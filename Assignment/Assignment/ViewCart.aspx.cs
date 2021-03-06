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
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            lblTotalPrice.Text = "(not yet calculate)";
            string query2 = "UPDATE [Cart] SET [Cart].quantity = 0 FROM [artwork], [Cart] WHERE (artwork.id = Cart.id) AND (Cart.UserName = @Username) AND (artwork.stock = 0)";
            SqlCommand comand2 = new SqlCommand(query2, con);
            comand2.Parameters.AddWithValue("@Username", Session["Username"]);
            comand2.ExecuteNonQuery();
            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "DeleteWish")
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query = "DELETE FROM [Cart] WHERE cartID = @cartID";
                SqlCommand comand = new SqlCommand(query, con);

                try
                {
                    Label idOFCart = e.Item.FindControl("cartIDLabel") as Label;
                    comand.Parameters.AddWithValue("@cartID", idOFCart.Text.ToString());
                    comand.ExecuteNonQuery();
                    DataList1.DataBind();
                    Response.Write("<script>alert('Delete Successfully');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Delete Fail');</script>");
                }

                con.Close();
            }
            else if(e.CommandName == "MinusQty")
            {
                int numberStock, newNumber;
                TextBox num = e.Item.FindControl("quantityLabel") as TextBox;
                numberStock = int.Parse(num.Text.ToString());

                if (numberStock > 1)
                {
                    newNumber = numberStock - 1;
                    num.Text = "" + newNumber;

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strCon);

                    con.Open();
                    string query = "UPDATE [Cart] SET quantity = @newQuantity WHERE cartID = @cartid";
                    SqlCommand comand = new SqlCommand(query, con);

                    Label idOFCart = e.Item.FindControl("cartIDLabel") as Label;
                    comand.Parameters.AddWithValue("@cartID", idOFCart.Text.ToString());
                    comand.Parameters.AddWithValue("@newquantity", newNumber);
                    comand.ExecuteNonQuery();

                    DataList1.DataBind();
                }
            }
            else if (e.CommandName == "AddQty")
            {
                int numberStock, numberMax, newNumber;
                TextBox num = e.Item.FindControl("quantityLabel") as TextBox;
                Label num2 = e.Item.FindControl("stockLabel") as Label;
                numberMax = int.Parse(num2.Text.ToString());
                numberStock = int.Parse(num.Text.ToString());

                if (numberStock < numberMax)
                {
                    newNumber = numberStock + 1;
                    num.Text = "" + newNumber;

                    SqlConnection con;
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strCon);

                    con.Open();
                    string query = "UPDATE [Cart] SET quantity = @newQuantity WHERE cartID = @cartid";
                    SqlCommand comand = new SqlCommand(query, con);

                    Label idOFCart = e.Item.FindControl("cartIDLabel") as Label;
                    comand.Parameters.AddWithValue("@cartID", idOFCart.Text.ToString());
                    comand.Parameters.AddWithValue("@newquantity", newNumber);
                    comand.ExecuteNonQuery();

                    DataList1.DataBind();
                }
            }
        }

        protected void btnCount_Click(object sender, EventArgs e)
        {
            string total = "";
            SqlConnection con;
            SqlDataReader dataReader;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            string query = "SELECT FORMAT(SUM(artwork.price*Cart.quantity), 'N') AS Sales FROM [artwork] INNER JOIN [Cart] ON artwork.id = Cart.id WHERE (Cart.UserName = @UserName)";
            SqlCommand comand = new SqlCommand(query, con);
            comand.Parameters.AddWithValue("@UserName", Session["Username"].ToString());
            dataReader = comand.ExecuteReader();

            while (dataReader.Read())
            {
                total += dataReader.GetValue(0);
            }
            dataReader.Close();

            lblTotalPrice.Text = "RM" + total;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}