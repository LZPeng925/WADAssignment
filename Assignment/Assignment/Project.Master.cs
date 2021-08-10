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
            lblRole.Visible = true;
            lblName.Visible = true;
            lblGuest.Visible = true;
            if (Session["Username"] == null)
            {
                hyperlink1.Enabled = false;
                hyperlink2.Enabled = false;
                lblRole.Visible = false;
                lblName.Visible = false;
                lblGuest.Text = "Guest";
                btnLogout.Text = "LogIn";
            }
            else
            {
                if (Session["Role"].ToString() == "Customer")
                {
                    hyperlink1.Enabled = true;
                    hyperlink2.Enabled = true;
                }
                else
                {
                    hyperlink1.Enabled = false;
                    hyperlink2.Enabled = false;
                }
                lblRole.Text = "as " + Session["Role"].ToString();
                lblName.Text = Session["Username"].ToString();
                lblGuest.Visible = false;
                btnLogout.Text = "LogOut";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (btnLogout.Text == "LogOut")
            {
                Session.Abandon();
                Session.Remove("Role");
                Session.Remove("Username");
                Response.Redirect("PreHomePage.aspx");
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
                    Response.Redirect("WishListPage.aspx");
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