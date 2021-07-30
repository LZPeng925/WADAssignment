using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class PreHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                if(reader.GetValue(2).ToString() == txtPassword.Text)
                {
                    Session["Username"] = txtUserName.Text;
                    Response.Redirect("Artist.aspx");
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
    }
}