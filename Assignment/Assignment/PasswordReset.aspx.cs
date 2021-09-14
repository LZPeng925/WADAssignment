using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace Assignment
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                TextBox userName = PreviousPage.FindControl("txtUsername") as TextBox;
                lblUsername.Text = userName.Text;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand query = new SqlCommand("Update Users set Password = @password WHERE UserName = @username", con);
                query.Parameters.AddWithValue("password", txtNPassword.Text);
                query.Parameters.AddWithValue("username", lblUsername.Text);
                query.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('You has successfully Reset your Password!!!'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
            catch (Exception ex)
            {
                Session["ErrorMsg"] = ex.ToString();
                Response.Redirect("ErrorPages.aspx");
            }
        }
    }
}