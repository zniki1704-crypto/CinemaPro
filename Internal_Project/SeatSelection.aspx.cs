using System;
using System.Linq;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Internal_Project
{
    public partial class SeatSelection : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!int.TryParse(Request.QueryString["ShowID"], out int showID))
                {
                    lblMessage.Text = "Invalid show selected.";
                    return;
                }
                ViewState["ShowID"] = showID;
                LoadShowInfo(showID);
                LoadSeats(showID);
            }
        }

        private void LoadShowInfo(int showID)
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("SELECT s.ShowTime, s.Language, s.Format, s.Price, m.Title FROM Shows s JOIN Movies m ON s.MovieID = m.MovieID WHERE s.ShowID = @ShowID", con))
            {
                cmd.Parameters.AddWithValue("@ShowID", showID);
                con.Open();
                var r = cmd.ExecuteReader();
                if (r.Read())
                {
                    DateTime st = r.GetDateTime(0);
                    string lang = r.GetString(1);
                    string format = r.GetString(2);
                    decimal price = r.GetDecimal(3);
                    string title = r.GetString(4);

                    // Fixed line (no string interpolation)
                    lblShowInfo.Text = title + " — " + lang + " — " + format + " — " + st.ToString("dd MMM yyyy HH:mm") + " — ₹" + price.ToString("0.00");
                }
                con.Close();
            }
        }

        private void LoadSeats(int showID)
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("SELECT SeatID, SeatNumber, IsBooked FROM Seats WHERE ShowID=@ShowID ORDER BY SeatNumber", con))
            {
                cmd.Parameters.AddWithValue("@ShowID", showID);
                con.Open();
                rptSeats.DataSource = cmd.ExecuteReader();
                rptSeats.DataBind();
                con.Close();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string selected = hfSelectedSeats.Value;
            if (string.IsNullOrEmpty(selected))
            {
                lblMessage.Text = "Please select at least one seat.";
                return;
            }

            var seatIds = selected.Split(',').Select(s => int.Parse(s)).ToList();
            int showID = (int)ViewState["ShowID"];

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlTransaction tr = con.BeginTransaction())
                {
                    try
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.Connection = con;
                            cmd.Transaction = tr;

                            // Build parameters dynamically for each seat
                            var parameters = seatIds.Select((id, index) =>
                            {
                                string param = "@id" + index;
                                cmd.Parameters.AddWithValue(param, id);
                                return param;
                            }).ToArray();

                            string paramList = string.Join(",", parameters);
                            cmd.CommandText = "UPDATE Seats SET IsBooked=1 WHERE SeatID IN (" + paramList + ") AND IsBooked=0";

                            int updated = cmd.ExecuteNonQuery();
                            if (updated != seatIds.Count)
                            {
                                tr.Rollback();
                                lblMessage.Text = "Some seats were already booked. Refresh and try again.";
                                LoadSeats(showID);
                                return;
                            }
                        }

                        tr.Commit();
                    }
                    catch
                    {
                        tr.Rollback();
                        lblMessage.Text = "Error booking seats. Try again.";
                        return;
                    }
                }
                con.Close();
            }

            Session["BookedSeats"] = selected;
            Session["ShowID"] = showID;
            Response.Redirect("Payment.aspx");
        }
    }
}
