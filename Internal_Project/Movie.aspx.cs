using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Internal_Project
{
    public partial class Movie : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadMovies();
        }

        private void LoadMovies()
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Movies", con))
            {
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                rptMovies.DataSource = dt;
                rptMovies.DataBind();
            }
        }

        // ✅ This method must exist exactly for OnItemDataBound
        protected void rptMovies_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int movieId = Convert.ToInt32(drv["MovieID"]);
                Repeater rptShows = (Repeater)e.Item.FindControl("rptShows");

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT ShowID, ShowTime, Language, Format, Price FROM Shows WHERE MovieID=@MovieID ORDER BY ShowTime", con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    con.Open();
                    DataTable dt = new DataTable();
                    dt.Load(cmd.ExecuteReader());
                    rptShows.DataSource = dt;
                    rptShows.DataBind();
                }
            }
        }
    }
}
