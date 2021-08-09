using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.SessionState;

namespace Assignment
{
    public partial class Artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FileUpload1.Enabled = false;
            if (!IsPostBack)
            {
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strCon);
                    con.Open();
                    SqlCommand query = new SqlCommand("Select * from Users WHERE UserName = @username", con);
                    query.Parameters.AddWithValue("@username", Session["Username"].ToString());
                    SqlDataReader reader = query.ExecuteReader();
                    if (reader.Read())
                    {
                        txtFName.Text = reader.GetValue(4).ToString();
                        txtLName.Text = reader.GetValue(5).ToString();
                        txtDisplayName.Text = reader.GetValue(3).ToString();
                        txtEmail.Text = reader.GetValue(7).ToString();
                        txtCode.Text = reader.GetValue(12).ToString();
                        txtCountry.Text = reader.GetValue(8).ToString();
                        txtPhone.Text = reader.GetValue(6).ToString();
                        txtStreet.Text = reader.GetValue(10).ToString();
                        lblDisplayCity.Text = reader.GetValue(11).ToString();
                        ddlCity.Items.Add(reader.GetValue(11).ToString());
                        ddlState.Text = reader.GetValue(9).ToString();
                        txtBankAcc.Text = reader.GetValue(14).ToString();
                        ddlBank.Text = reader.GetValue(13).ToString();
                        if (reader.GetValue(16).ToString() != "")
                        {
                            byte[] bytes = (byte[])reader.GetValue(16);
                            string strBase64 = Convert.ToBase64String(bytes);
                            imgPicture.ImageUrl = "data:Image/png;base64," + strBase64;
                        }
                        if (reader.GetValue(15).ToString() == "Artist")
                        {
                            txtFName.Enabled = false;
                            txtLName.Enabled = false;
                            txtDisplayName.Enabled = false;
                            txtEmail.Enabled = false;
                            txtCode.Enabled = false;
                            txtCountry.Enabled = false;
                            txtPhone.Enabled = false;
                            txtStreet.Enabled = false;
                            ddlState.Enabled = false;
                            ddlCity.Visible = false;
                            txtBankAcc.Enabled = false;
                            ddlBank.Enabled = false;
                        }
                        else
                        {
                            txtFName.Enabled = false;
                            txtLName.Enabled = false;
                            txtDisplayName.Enabled = false;
                            txtEmail.Enabled = false;
                            txtCode.Enabled = false;
                            txtCountry.Enabled = false;
                            txtPhone.Enabled = false;
                            txtStreet.Enabled = false;
                            ddlState.Enabled = false;
                            ddlCity.Visible = false;
                            txtBankAcc.Visible = false;
                            ddlBank.Visible = false;
                            lblBank.Visible = false;
                            lblBankAcc.Visible = false;
                        }
                    }
                    con.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text == "Edit Profile")
            {
                btnEdit.Text = "Confirm";
                txtFName.Enabled = true;
                txtLName.Enabled = true;
                txtDisplayName.Enabled = true;
                txtEmail.Enabled = true;
                txtCode.Enabled = true;
                txtCountry.Enabled = true;
                txtPhone.Enabled = true;
                txtStreet.Enabled = true;
                txtBankAcc.Enabled = true;
                ddlBank.Enabled = true;
                ddlCity.Visible = true;
                ddlState.Enabled = true;
                lblDisplayCity.Visible = false;
            }
            else
            {
                btnEdit.Text = "Edit Profile";
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtDisplayName.Enabled = false;
                txtEmail.Enabled = false;
                txtCode.Enabled = false;
                txtCountry.Enabled = false;
                txtPhone.Enabled = false;
                txtStreet.Enabled = false;
                txtBankAcc.Enabled = false;
                ddlBank.Enabled = false;
                lblDisplayCity.Text = ddlCity.SelectedItem.ToString();
                ddlCity.Visible = false;
                ddlState.Enabled = false;
                lblDisplayCity.Visible = true;

                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand query = new SqlCommand("update Users set DisplayName = @displayname, FirstName = @firstname, LastName = @lastname, PhoneNo = @phoneno," +
                    " Email = @email, Country = @country, State = @state, Street = @street, City = @city, Code = @code, Bank = @bank, BankAccount = @bankaccount" +
                    " WHERE UserName = @username", con);
                query.Parameters.AddWithValue("@username", Session["Username"].ToString());
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
                if (Session["Role"].ToString() == "Artist")
                {
                    query.Parameters.AddWithValue("@bank", ddlBank.SelectedItem.ToString());
                    query.Parameters.AddWithValue("@bankaccount", txtBankAcc.Text);
                }
                else
                {
                    query.Parameters.AddWithValue("@bank", "");
                    query.Parameters.AddWithValue("@bankaccount", "");
                }
                query.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void ddlState_Load(object sender, EventArgs e)
        {
            if (btnEdit.Text == "Confirm")
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
            else
            {
                
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (btnUpload.Text == "Upload")
            {
                btnUpload.Text = "Change Picture";
                if (!FileUpload1.HasFile)
                {
                    lblDisplayError.Visible = true;
                    lblDisplayError.Text = "Please Select Image File";
                }
                else
                {
                    int length = FileUpload1.PostedFile.ContentLength;
                    byte[] pic = new byte[length];
                    FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strCon);
                    SqlCommand cmd = new SqlCommand("update Users set Picture=@Image WHERE UserName = @username", con);
                    cmd.Parameters.AddWithValue("@username", Session["Username"].ToString());
                    cmd.Parameters.AddWithValue("@Image", pic);
                    con.Open();
                    cmd.ExecuteScalar();
                    lblDisplayError.Visible = true;
                    lblDisplayError.Text = "Image Uploaded Sucessfully";
                    con.Close();
                    byte[] bytes = pic;
                    string strBase64 = Convert.ToBase64String(bytes);
                    imgPicture.ImageUrl = "data:Image/png;base64," + strBase64;
                }
            }
            else
            {
                btnUpload.Text = "Upload";
                FileUpload1.Enabled = true;
            }
        }
    }
}