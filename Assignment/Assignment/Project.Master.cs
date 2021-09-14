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
    public partial class Project : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                hyperlink1.Enabled = false;
                hyperlink2.Enabled = false;
                hyperlink3.Enabled = false;
                btnLogout.Text = "LogIn";
            }
            else
            {
                if (Session["Role"].ToString() == "Customer")
                {
                    hyperlink1.Enabled = true;
                    hyperlink2.Enabled = true;
                    hyperlink3.Enabled = true;
                }
                else
                {
                    hyperlink1.Enabled = false;
                    hyperlink2.Enabled = false;
                    hyperlink3.Enabled = false;
                }
                labelsC.role = "as " + Session["Role"].ToString();
                labelsC.username = Session["Username"].ToString();
                labelsC.datetime = Session["Time"].ToString();
                btnLogout.Text = "LogOut";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (btnLogout.Text == "LogOut")
            {
                string user = "as " + Session["Role"].ToString() + " with Username: " + Session["Username"].ToString();
                Session.Abandon();
                Session.Remove("Role");
                Session.Remove("Username");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('You Logged on " + Session["Time"].ToString() + " " + user + "'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
            else
            {
                Response.Redirect("PreHomePage.aspx");
            }
        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("Display.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Please LogIn before using this website.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
        }

        protected void btnArtwork_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (Session["Role"].ToString() == "Artist")
                {
                    Response.Redirect("Manage.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Sorry, This page is for Artist.'); window.location = '" + Page.ResolveUrl("Display.aspx") + "';", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Please LogIn before using this website.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (Session["Role"].ToString() == "Customer")
                {
                    Response.Redirect("ViewCart.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Sorry, This page is for Customer.'); window.location = '" + Page.ResolveUrl("Display.aspx") + "';", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Please LogIn before using this website.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("Artist.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Please LogIn before using this website.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
            }
        }
    }
}