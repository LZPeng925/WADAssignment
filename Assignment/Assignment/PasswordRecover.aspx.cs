using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace Assignment
{
    public partial class PasswordRecover : System.Web.UI.Page
    {
        private string verificationCode="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TimeSpan time = TimeSpan.FromSeconds(Convert.ToDouble(lblTimer.Text) * 100);
                string str = time.ToString(@"hh\:mm\:ss");
                lblTimer.Text = str;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (lblTimer.Text != "00:00:00")
            {
                TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(lblTimer.Text).TotalSeconds - 1);
                string fromTimeString = result.ToString(@"hh\:mm\:ss");
                lblTimer.Text = fromTimeString;
            }
            else
            {
                Timer1.Enabled = false;
            }
        }

        void sendEmail()
        {
            try
            {
                Random generator = new Random();
                Session["verificationCode"] = "RSD" + generator.Next(0, 1000).ToString("D3");
                MailMessage mailMessage = new MailMessage
                    ("jerry00lzp@gmail.com", txtEmail.Text.ToString());
                mailMessage.Body = "Dear RSD Gallery Users" + "\n\n" + "Your Verification Code : " + Session["verificationCode"].ToString()
                    + "\nNot your action? Do not share the code to anyone.\n\nBest Regards, \r\nRSD Gallery";
                mailMessage.Subject = "RSD Gallery password recovery verification code";
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                Session["ErrorMsg"] = ex.ToString();
                Response.Redirect("ErrorPages.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand query = new SqlCommand("Select Email from Users WHERE UserName = @Username", con);
                query.Parameters.AddWithValue("Username", txtUsername.Text);
                SqlDataReader reader = query.ExecuteReader();
                if (reader.Read())
                {
                    if (reader.GetValue(0).ToString() == txtEmail.Text)
                    {
                        lblDisplay.Text = "";
                        if (lblTimer.Text == "00:00:10")
                        {
                            sendEmail();
                            Timer1.Enabled = true;
                            btnSend.Text = "Resend";
                        }
                        else if (TimeSpan.Parse(lblTimer.Text) > TimeSpan.Parse("00:00:00"))
                        {
                            lblDisplay.Text = "While waiting the time to Resend. Please check ur email.";
                        }
                        else
                        {
                            lblTimer.Text = "0.1";
                            TimeSpan time = TimeSpan.FromSeconds(Convert.ToDouble(lblTimer.Text) * 100);
                            string str = time.ToString(@"hh\:mm\:ss");
                            lblTimer.Text = str;
                            Timer1.Enabled = true;
                            lblDisplay.Text = "";
                            sendEmail();
                        }
                    }
                    else
                    {
                        lblDisplay.Text = "Email that u entered is not match.";
                    }
                }
                else
                {
                    lblDisplay.Text = "Username not found.";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Session["ErrorMsg"] = ex.ToString();
                Response.Redirect("ErrorPages.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["verificationCode"].ToString()== txtCode.Text.ToString())
            {
                Session["Username1"] = txtUsername.Text;
                Response.Redirect("PasswordReset.aspx");
            }
            else
            {
                lblCodeMsg.Text = "The code that you entered is not match.";
            }
        }
    }
}