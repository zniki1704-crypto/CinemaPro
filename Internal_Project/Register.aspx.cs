using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Internal_Project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Insert into User_register and return new UserID
                string query = @"INSERT INTO User_register (FullName, Email, Password, ConfromPassword) 
                                 OUTPUT INSERTED.UserID 
                                 VALUES (@FullName, @Email, @Password, @ConfromPassword)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@ConfromPassword", txtConfirmPassword.Text.Trim());

                int userId = (int)cmd.ExecuteScalar();

                // Insert into User_Login
                string loginQuery = @"INSERT INTO User_Login (UserID, Username, Password) 
                                      VALUES (@UserID, @Username, @Password)";
                SqlCommand cmdLogin = new SqlCommand(loginQuery, con);
                cmdLogin.Parameters.AddWithValue("@UserID", userId);
                cmdLogin.Parameters.AddWithValue("@Username", txtEmail.Text.Trim());
                cmdLogin.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmdLogin.ExecuteNonQuery();

                lblMessage.Text = "✅ Registration successful!";
            }
        }
    }
}
