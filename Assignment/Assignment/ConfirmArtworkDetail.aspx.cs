using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

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

            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                String Output = "";
                String Output2 = "";
                String quantity = "";
                DropDownList txtName = (DropDownList)PreviousPage.FindControl("ddlInventoryID");
                lblArtworkID.Text = txtName.Text;
                Label lblID = (Label)PreviousPage.FindControl("lblUserID");
                lblUserID.Text = "" + lblID.Text;

                con.Open();
                string query = "SELECT name, price, stock FROM [artwork] WHERE id = @InventoryID";
                SqlCommand comand = new SqlCommand(query, con);
                comand.Parameters.AddWithValue("@InventoryID", lblArtworkID.Text);
                dataReader = comand.ExecuteReader();
                while (dataReader.Read())
                {
                    Output += dataReader.GetValue(0);
                    Output2 += dataReader.GetValue(1);
                    quantity += dataReader.GetValue(2);
                }
                dataReader.Close();

                lblArtworkName.Text = Output;
                lblArtworkPrice.Text = String.Format("{0:0.##}", Output2);
                txtAmount.Text = String.Format("{0:0.##}", Output2);
                lblArtistsName.Text = quantity;
            }

            con.Close();
        }


        protected void btnPay_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            int maxPayHistoryID;
            var convertDecimal = Convert.ToDouble(txtAmount.Text);
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            con.Open();
            string query1 = "SELECT MAX(HistoryID) AS MaximumID FROM [dbo].[History]";
            string query2 = "INSERT INTO [dbo].[History](HistoryID, UserID, artworkID, dateTime, price, quantity) VALUES (@maxID, @UserID, @InventoryID, @datetime, @price, @quantity)";
            SqlCommand comand = new SqlCommand(query1, con);
            SqlCommand comand2 = new SqlCommand(query2, con);
            comand.ExecuteNonQuery();
            //maxPayHistoryID = 1;
            maxPayHistoryID = (int)comand.ExecuteScalar();
            maxPayHistoryID += 1;

            try
            {
                comand2.Parameters.AddWithValue("@maxID", maxPayHistoryID);
                comand2.Parameters.AddWithValue("@UserID", lblUserID.Text);
                comand2.Parameters.AddWithValue("@InventoryID", lblArtworkName.Text);
                comand2.Parameters.AddWithValue("@datetime", DateTime.Now);
                comand2.Parameters.AddWithValue("@price", convertDecimal);
                comand2.Parameters.AddWithValue("@quantity", txtNumber.Text);
                comand2.ExecuteNonQuery();
                Response.Redirect("ButtonTest.aspx");
                Response.Write("<script>alert('Pay Successful');</script>");
                
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
        }
    }
}