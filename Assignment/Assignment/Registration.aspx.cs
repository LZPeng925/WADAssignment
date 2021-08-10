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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblBank.Visible = false;
                lblBankAcc.Visible = false;
                ddlBank.Visible = false;
                txtBankAcc.Visible = false;
            }
            else
            {
                string Password = txtPassword.Text;
                string cPassword = txtCPassword.Text;
                txtPassword.Attributes.Add("value", Password);
                txtCPassword.Attributes.Add("value", cPassword);
            }
            if (chkShowPassword.Checked == true)
            {
                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtCPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtPassword.TextMode = TextBoxMode.Password;
                txtCPassword.TextMode = TextBoxMode.Password;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            SqlCommand query = new SqlCommand();
            con.Open();
            query = new SqlCommand("insert into Users (UserName, Password, DisplayName, FirstName, LastName, PhoneNo, Email, Country, State," +
                    " Street, City, Code, Bank, BankAccount, UserType) Values (@username, @password, @displayname, @firstname, @lastname," +
                    " @phoneno, @email, @country, @state, @street, @city, @code, @bank, @bankaccount, @usertype)", con);
            query.Parameters.AddWithValue("@username", txtUsername.Text);
            query.Parameters.AddWithValue("@password", txtPassword.Text);
            query.Parameters.AddWithValue("@displayname", txtDisplayName.Text);
            query.Parameters.AddWithValue("@firstname", txtFName.Text);
            query.Parameters.AddWithValue("@lastname", txtLName.Text);
            query.Parameters.AddWithValue("@phoneno", txtPhone.Text);
            query.Parameters.AddWithValue("@email", txtEmail.Text);
            query.Parameters.AddWithValue("@country", txtCountry.Text);
            query.Parameters.AddWithValue("@state", ddlState.SelectedItem.ToString());
            query.Parameters.AddWithValue("@street", txtStreet.Text);
            query.Parameters.AddWithValue("@city", ddlCity.SelectedItem.ToString());
            query.Parameters.AddWithValue("@code", txtCode.Text);
            if (radUserType.SelectedItem.ToString() == "Artist")
            {
                query.Parameters.AddWithValue("@bank", ddlBank.SelectedItem.ToString());
                query.Parameters.AddWithValue("@bankaccount", txtBankAcc.Text);
            }
            else
            {
                query.Parameters.AddWithValue("@bank", "");
                query.Parameters.AddWithValue("@bankaccount", "");
            }
            query.Parameters.AddWithValue("@usertype", radUserType.SelectedItem.ToString());
            query.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('You has successfully registered!!! Returning back to Home Page.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Register Unsuccessful! Returning back to Home Page.'); window.location = '" + Page.ResolveUrl("~/PreHomePage.aspx") + "';", true);
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

        protected void radUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (radUserType.SelectedItem.ToString() == "Artist")
            {
                lblBank.Visible = true;
                lblBankAcc.Visible = true;
                ddlBank.Visible = true;
                txtBankAcc.Visible = true;
            }
            else
            {
                lblBank.Visible = false;
                lblBankAcc.Visible = false;
                ddlBank.Visible = false;
                txtBankAcc.Visible = false;
            }
        }
    }
}