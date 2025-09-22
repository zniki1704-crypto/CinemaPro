using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Internal_Project
{
    public partial class AddMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // Insert movie using SqlDataSource
                SqlDataSourceMovies.Insert();

                // Redirect to homepage after success
                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                // Optional: show error
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}