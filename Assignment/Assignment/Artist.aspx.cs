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
    public partial class Artist : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtUsername.Enabled = false;
                txtEmail.Enabled = false;
                txtCode.Enabled = false;
                txtCountry.Enabled = false;
                txtPhone.Enabled = false;
                txtStreet.Enabled = false;
                txtBankAcc.Enabled = false;
                ddlBank.Enabled = false;
                ddlCity.Enabled = false;
                ddlState.Enabled = false;
            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCity.Items.Clear();
            if (ddlState.SelectedItem.ToString() == "Johor")
            {
                ddlCity.Items.Add("Johor Bahru");
                ddlCity.Items.Add("Iskandar Puteri");
                ddlCity.Items.Add("Pasir Gudang");
            }
            else if (ddlState.SelectedItem.ToString() == "Kedah")
            {
                ddlCity.Items.Add("Alor Setar");
            }
            else if (ddlState.SelectedItem.ToString() == "Kelantan")
            {
                ddlCity.Items.Add("Kota Bahru");
            }
            else if (ddlState.SelectedItem.ToString() == "Malacca")
            {
                ddlCity.Items.Add("Malacca City");
            }
            else if (ddlState.SelectedItem.ToString() == "Negeri Sembilan")
            {
                ddlCity.Items.Add("Seremban");
            }
            else if (ddlState.SelectedItem.ToString() == "Pahang")
            {
                ddlCity.Items.Add("Kuantan");
            }
            else if (ddlState.SelectedItem.ToString() == "Penang")
            {
                ddlCity.Items.Add("George Town");
                ddlCity.Items.Add("Seberang Perai");
            }
            else if (ddlState.SelectedItem.ToString() == "Perak")
            {
                ddlCity.Items.Add("Ipoh");
            }
            else if (ddlState.SelectedItem.ToString() == "Perlis")
            {
                ddlCity.Items.Add("Kuala Perlis");
            }
            else if (ddlState.SelectedItem.ToString() == "Sabah")
            {
                ddlCity.Items.Add("Kota Kinabalu");
            }
            else if (ddlState.SelectedItem.ToString() == "Sarawak")
            {
                ddlCity.Items.Add("Kuching");
                ddlCity.Items.Add("Miri");
            }
            else if (ddlState.SelectedItem.ToString() == "Selangor")
            {
                ddlCity.Items.Add("Shah Alam");
                ddlCity.Items.Add("Petaling Jaya");
                ddlCity.Items.Add("Subang Jaya");
            }
            else if (ddlState.SelectedItem.ToString() == "Terengganu")
            {
                ddlCity.Items.Add("Kuala Terengganu");
            }
            else if (ddlState.SelectedItem.ToString() == "WP.Kuala Lumpur")
            {
                ddlCity.Items.Add("Kuala Lumpur");
            }
            else if (ddlState.SelectedItem.ToString() == "WP.Labuan")
            {
                ddlCity.Items.Add("Labuan");
            }
            else
            {
                ddlCity.Items.Add("Putrajaya");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text == "Edit")
            {
                btnEdit.Text = "Confirm";
                txtFName.Enabled = true;
                txtLName.Enabled = true;
                txtUsername.Enabled = true;
                txtEmail.Enabled = true;
                txtCode.Enabled = true;
                txtCountry.Enabled = true;
                txtPhone.Enabled = true;
                txtStreet.Enabled = true;
                txtBankAcc.Enabled = true;
                ddlBank.Enabled = true;
                ddlCity.Enabled = true;
                ddlState.Enabled = true;
            }
            else
            {
                btnEdit.Text = "Edit";
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtUsername.Enabled = false;
                txtEmail.Enabled = false;
                txtCode.Enabled = false;
                txtCountry.Enabled = false;
                txtPhone.Enabled = false;
                txtStreet.Enabled = false;
                txtBankAcc.Enabled = false;
                ddlBank.Enabled = false;
                ddlCity.Enabled = false;
                ddlState.Enabled = false;
            }
        }
    }
}