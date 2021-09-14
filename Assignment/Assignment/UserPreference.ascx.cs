using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class UserPreference : System.Web.UI.UserControl
    {
        public string username;
        public string datetime;
        public string role;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (username != null)
            {
                lblUsername.Text = username.ToString();
                lblRole.Text = role.ToString();
                lblDateTime.Text = "You logged on at : " + datetime.ToString();
                lblDateTime.Visible = true;
            }
            else
            {
                lblUsername.Text = "Guest as ";
                lblRole.Text = "Guest";
                lblDateTime.Visible = false;
            }

        }
    }
}