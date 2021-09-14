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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string Password = txtPassword.Text;
                string cPassword = txtCPassword.Text;
                string cnPassword = txtCNPassword.Text;
                txtPassword.Attributes.Add("value", Password);
                txtCPassword.Attributes.Add("value", cPassword);
                txtCNPassword.Attributes.Add("value", cnPassword);
            }
            if (CheckBox1.Checked == true)
            {
                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtCPassword.TextMode = TextBoxMode.SingleLine;
                txtCNPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtPassword.TextMode = TextBoxMode.Password;
                txtCPassword.TextMode = TextBoxMode.Password;
                txtCNPassword.TextMode = TextBoxMode.Password;
            }
            lblDisplayMsg.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Password Change Unsuccessful! Returning back to Profile Page.'); window.location = '" + Page.ResolveUrl("~/Artist.aspx") + "';", true);
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                SqlCommand query = new SqlCommand("Select * from Users WHERE UserName = @username", con);
                query.Parameters.AddWithValue("@username", Session["Username"].ToString());
                con.Open();
                SqlDataReader reader = query.ExecuteReader();
                if (reader.Read())
                {
                    if (txtPassword.Text != reader.GetValue(2).ToString())
                    {
                        lblDisplayMsg.Text = "The password you entered is not match.";
                    }
                    else
                    {
                        if (txtCNPassword.Text == txtCPassword.Text)
                        {
                            con.Close();
                            con.Open();
                            SqlCommand query1 = new SqlCommand("update Users set Password = @password WHERE UserName = @username", con);
                            query1.Parameters.AddWithValue("password", txtCPassword.Text);
                            query1.Parameters.AddWithValue("username", Session["Username"].ToString());
                            query1.ExecuteNonQuery();
                            con.Close();
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Password Change Successful! Returning back to Profile Page.'); window.location = '" + Page.ResolveUrl("~/Artist.aspx") + "';", true);
                        }
                        else
                        {
                            lblDisplayMsg.Text = "The Confirm New Password must be same with New Password.";
                        }
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Session["ErrorMsg"] = ex.ToString();
                Response.Redirect("ErrorPages.aspx");
            }
        }
    }
}