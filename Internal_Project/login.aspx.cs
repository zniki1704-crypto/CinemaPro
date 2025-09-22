using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Internal_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // 🔹 Check for hardcoded admin login
            if (username.Equals("admin", StringComparison.OrdinalIgnoreCase) && password == "admin123")
            {
                Session["Username"] = "admin";
                Response.Redirect("Dashboard.aspx");
                return;
            }

            // 🔹 Otherwise check database for normal user
            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT UserID FROM User_Login WHERE Username=@Username AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    Session["UserID"] = result.ToString();
                    Session["Username"] = username;
                    Response.Redirect("Home.aspx"); // normal users
                }
                else
                {
                    lblError.Text = "Invalid username or password!";
                }
            }
        }


    }
}
