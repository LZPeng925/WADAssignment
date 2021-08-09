using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

namespace Assignment
{
    public partial class PreHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string Password = txtPassword.Text;
                txtPassword.Attributes.Add("value", Password);
            }
            if (CheckBox1.Checked == true)
            {
                txtPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtPassword.TextMode = TextBoxMode.Password;
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            SqlCommand query = new SqlCommand("Select * from Users WHERE UserName = @Username", con);
            query.Parameters.AddWithValue("Username", txtUserName.Text);
            SqlDataReader reader = query.ExecuteReader();
            if (reader.Read())
            {
                if (reader.GetValue(2).ToString() == txtPassword.Text)
                {
                    Session["Role"] = reader.GetValue(15).ToString();
                    Session["Username"] = txtUserName.Text;
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('You has successfully LogIn!!!'); window.location = '" + Page.ResolveUrl("~/Artist.aspx") + "';", true);
                }
                else
                {
                    lblDisplayMsg.Text = "Username Or Password you entered is wrong.";
                }
            }
            else
            {
                lblDisplayMsg.Text = "Username Not found.";
            }
            con.Close();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}