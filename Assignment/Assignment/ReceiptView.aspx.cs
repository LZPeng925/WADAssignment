using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Net.Mail;
using System.Net;

namespace Assignment
{
    public partial class ReceiptView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('This Receipt is sent to your E-mail');", true);
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT artwork.name, artwork.artists, artwork.price, Cart.quantity, (artwork.price * Cart.quantity) As TotalPrice FROM artwork INNER JOIN Cart ON artwork.id = Cart.id Where UserName = @username", con);
            adp.SelectCommand.Parameters.AddWithValue("username", Session["Username"].ToString());
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("~/CrystalReport1.rpt"));
            rpt.SetDataSource(ds.Tables["Table"]);

            CrystalReportViewer1.ReportSource = rpt;
            try
            {
                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Payment Receipt");
            }
            catch (Exception ex)
            {
                Session["ErrorMsg"] = ex.ToString();
                Response.Redirect("ErrorPages.aspx");
            }
            string query3 = "DELETE FROM [Cart] WHERE UserName = @username";
            SqlCommand comand3 = new SqlCommand(query3, con);
            comand3.Parameters.AddWithValue("@username", Session["Username"]);
            comand3.ExecuteNonQuery();
            con.Close();
        }
    }
}