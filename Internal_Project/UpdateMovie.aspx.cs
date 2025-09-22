using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Internal_Project
{
    public partial class UpdateMovie : System.Web.UI.Page
    {
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int movieID = int.Parse(txtMovieID.Text);
            string displayOn = rblUpdatePage.SelectedValue; // Movie, Home, Both

            string query = @"UPDATE Movies SET 
                                Title=@Title, Genre=@Genre, Duration=@Duration, Language=@Language, 
                                ReleaseDate=@ReleaseDate, PosterURL=@PosterURL, Description=@Description, 
                                DisplayOn=@DisplayOn 
                             WHERE MovieID=@MovieID";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text);
                cmd.Parameters.AddWithValue("@Language", txtLanguage.Text);
                cmd.Parameters.AddWithValue("@ReleaseDate", txtReleaseDate.Text);
                cmd.Parameters.AddWithValue("@PosterURL", txtPoster.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@DisplayOn", displayOn);
                cmd.Parameters.AddWithValue("@MovieID", movieID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Redirect("Home.aspx"); // Redirect after update
        }
    }
}
