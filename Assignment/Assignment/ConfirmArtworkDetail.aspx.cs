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


            //int numberStock, numberMax, newNumber, numberMaxNew;
            //TextBox num = e.Item.FindControl("quantityLabel") as TextBox;
            //Label num2 = e.Item.FindControl("stockLabel") as Label;
            //numberMax = int.Parse(num2.Text.ToString());
            //numberStock = int.Parse(num.Text.ToString());

            //if (numberStock < numberMax)
            //{
            //    newNumber = numberStock + 1;
            //    num.Text = "" + newNumber;
            //    numberMaxNew = numberMax - 1;

            //    SqlConnection con;
            //    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //    con = new SqlConnection(strCon);

            //    con.Open();
            //    string query = "UPDATE [Cart] SET quantity = @newQuantity WHERE cartID = @cartid";
            //    string query2 = "UPDATE [artwork] SET stock = @newStock WHERE id = @id";
            //    SqlCommand comand = new SqlCommand(query, con);
            //    SqlCommand comand2 = new SqlCommand(query2, con);

            //    Label idOFCart = e.Item.FindControl("cartIDLabel") as Label;
            //    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;
            //    comand.Parameters.AddWithValue("@cartID", idOFCart.Text.ToString());
            //    comand.Parameters.AddWithValue("@newquantity", newNumber);
            //    comand.ExecuteNonQuery();

            //    comand2.Parameters.AddWithValue("@newStock", numberMaxNew);
            //    comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
            //    comand2.ExecuteNonQuery();
            //    DataList1.DataBind();
            //}


            con.Open();
            string query1 = "SELECT MAX(HistoryID) AS MaximumID FROM [dbo].[History]";
            string query2 = "INSERT INTO [dbo].[History](HistoryID, UserName, dateTime, price, quantity) VALUES (@maxID, @Username, @datetime, @price, @quantity)";
            string query3 = "DELETE FROM [Cart] WHERE UserName = @username";
            SqlCommand comand = new SqlCommand(query1, con);
            SqlCommand comand2 = new SqlCommand(query2, con);
            SqlCommand comand3 = new SqlCommand(query3, con);
            comand.ExecuteNonQuery();
            //maxPayHistoryID = 1;
            maxPayHistoryID = (int)comand.ExecuteScalar();
            maxPayHistoryID += 1;

            try
            {
                comand2.Parameters.AddWithValue("@maxID", maxPayHistoryID);
                comand2.Parameters.AddWithValue("@Username", lblUserID.Text);
                comand2.Parameters.AddWithValue("@datetime", DateTime.Now);
                comand2.Parameters.AddWithValue("@price", convertDecimal);
                comand2.Parameters.AddWithValue("@quantity", txtNumber.Text);
                comand2.ExecuteNonQuery();

                comand3.Parameters.AddWithValue("@username", Session["Username"]);
                comand3.ExecuteNonQuery();
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
        }
    }
}