using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Handlers;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('You has successfully registered!!! Returning back to Home Page.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Register Unsuccessful! Returning back to Home Page.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
        }
    }
}