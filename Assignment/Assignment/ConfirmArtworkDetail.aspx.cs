using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;
using System.Net.Mail;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

namespace Assignment
{
    public partial class ConfirmArtworkDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            SqlDataReader dataReader;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            string Output = "";
            string Output2 = "";
            lblUserID.Text = "" + Session["Username"];

            con.Open();
            string query = "SELECT FORMAT(SUM(artwork.price*Cart.quantity), 'N') AS Sales, FORMAT(SUM(Cart.quantity), 'N0') AS Quantity FROM [artwork] INNER JOIN [Cart] ON artwork.id = Cart.id WHERE (Cart.UserName = @Username)";
            SqlCommand comand = new SqlCommand(query, con);
            comand.Parameters.AddWithValue("@Username", lblUserID.Text);
            dataReader = comand.ExecuteReader();
            while (dataReader.Read())
            {
                Output += dataReader.GetValue(0);
                Output2 += dataReader.GetValue(1);
            }

            dataReader.Close();
            txtAmount.Text = String.Format("{0:0.##}", Output);
            txtNumber.Text = String.Format("{0:0.##}", Output2);

            con.Close();

        }


        protected void btnPay_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            int maxPayHistoryID;
            var convertDecimal = Convert.ToDouble(txtAmount.Text);
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            SqlDataAdapter adp = new SqlDataAdapter("SELECT artwork.name, artwork.artists, artwork.price, Cart.quantity, (artwork.price * Cart.quantity) As TotalPrice FROM artwork INNER JOIN Cart ON artwork.id = Cart.id Where UserName = @username", con);
            adp.SelectCommand.Parameters.AddWithValue("username", Session["Username"].ToString());
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ReportDocument crystalReport = new ReportDocument();
            crystalReport.Load(Server.MapPath("~/CrystalReport1.rpt"));
            crystalReport.SetDataSource(ds.Tables["Table"]);

            con.Open();
            string query1 = "SELECT MAX(HistoryID) AS MaximumID FROM [dbo].[History]";
            string query2 = "INSERT INTO [dbo].[History](HistoryID, UserName, dateTime, price, quantity) VALUES (@maxID, @Username, @datetime, @price, @quantity)";
            string query4 = "UPDATE artwork SET artwork.stock = artwork.stock - Cart.quantity FROM [artwork], [Cart] WHERE (artwork.id = Cart.id) AND (Cart.UserName = @nameCheck)";
            //string query5 = "UPDATE artwork SET artwork.stock = artwork.stock - Cart.quantity FROM [artwork], [Cart] WHERE (artwork.id = Cart.id) AND (Cart.UserName = @nameCheck)";
            SqlCommand comand = new SqlCommand(query1, con);
            SqlCommand comand2 = new SqlCommand(query2, con);
            SqlCommand comand4 = new SqlCommand(query4, con);
            comand.ExecuteNonQuery();
            //maxPayHistoryID = 1;
            maxPayHistoryID = (int)comand.ExecuteScalar();
            maxPayHistoryID += 1;

            try
            {
                try
                {
                    comand4.Parameters.AddWithValue("@nameCheck", lblUserID.Text);
                    comand4.ExecuteNonQuery();
                }
                catch
                {
                    Response.Write("<script>alert('Payment Fail');</script>");
                }

                comand2.Parameters.AddWithValue("@maxID", maxPayHistoryID);
                comand2.Parameters.AddWithValue("@Username", lblUserID.Text);
                comand2.Parameters.AddWithValue("@datetime", DateTime.Now);
                comand2.Parameters.AddWithValue("@price", convertDecimal);
                comand2.Parameters.AddWithValue("@quantity", txtNumber.Text);
                try
                {
                    comand2.ExecuteNonQuery();
                    MailMessage mm = new MailMessage
                                   ("jerry00lzp@gmail.com", TextBox1.Text);
                    mm.Subject = "Transaction Detail";
                    mm.Body = "Attachment: Transaction Detail";
                    mm.Subject = "Payment Receipt";
                    mm.Body = "Attachment: Receipt";
                    mm.Attachments.Add(new Attachment(crystalReport.ExportToStream(ExportFormatType.PortableDocFormat), "Receipt.pdf"));
                    mm.IsBodyHtml = true;
                    SmtpClient smtpClient = new SmtpClient();
                    smtpClient.Send(mm);
                    Response.Write("<script> alert('This receipt will be sent to your Email: "+TextBox1.Text+"'); window.open('" + "ReceiptView.aspx" + "','_blank'); </script>");
                }
                catch (Exception ex)
                {
                    Session["ErrorMsg"] = ex.ToString();
                    Response.Redirect("ErrorPages.aspx");
                }
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Payment Successfully'); window.location = '" + Page.ResolveUrl("~/Display.aspx") + "';", true);
            }
            catch
            {
                Response.Write("<script>alert('Pay Fail');</script>");
            }
            con.Close();
        }

        protected void rblWayToPay_SelectedIndexChanged1(object sender, EventArgs e)
        {
            btnPay.Enabled = true;

            if (rblWayToPay.SelectedValue == "FPX")
            {
                Label1.Visible = true;
                ddlNameofBank.Visible = true;
            }
            else
            {
                Label1.Visible = false;
                ddlNameofBank.Visible = false;
            }

            if (txtAmount.Text == "")
            {
                btnPay.Enabled = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Display.aspx");
        }
    }
}