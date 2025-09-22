using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Internal_Project
{
    public partial class DeleteMovie : System.Web.UI.Page
    {
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int movieID; // Declare variable separately

            // Validate MovieID input
            if (!int.TryParse(txtMovieID.Text.Trim(), out movieID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid Movie ID');", true);
                return;
            }

            // Get selected delete option
            string pageOption = rblDeletePage.SelectedValue; // Movie, Home, Both
            string query = "";

            // Determine SQL query based on option
            if (pageOption == "Movie")
            {
                query = @"UPDATE Movies
                          SET DisplayOn = CASE 
                              WHEN DisplayOn='Both' THEN 'Home' 
                              ELSE 'Deleted' 
                          END
                          WHERE MovieID=@MovieID";
            }
            else if (pageOption == "Home")
            {
                query = @"UPDATE Movies
                          SET DisplayOn = CASE 
                              WHEN DisplayOn='Both' THEN 'Movie' 
                              ELSE 'Deleted' 
                          END
                          WHERE MovieID=@MovieID";
            }
            else // Both
            {
                query = "DELETE FROM Movies WHERE MovieID=@MovieID";
            }

            // Execute query
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@MovieID", System.Data.SqlDbType.Int).Value = movieID;
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        // Success
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Movie deleted/updated successfully'); window.location='Home.aspx';", true);
                    }
                    else
                    {
                        // MovieID not found
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Movie ID not found');", true);
                    }
                }
            }
        }
    }
}
