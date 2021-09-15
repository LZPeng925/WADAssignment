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
    public partial class WishListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "DeleteWish")
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query3 = "DELETE FROM [WishList] WHERE WishListID = @WishListID";
                SqlCommand comand3 = new SqlCommand(query3, con);

                try
                {
                    Label idOFWish = e.Item.FindControl("WishListIDLabel") as Label;
                    comand3.Parameters.AddWithValue("@WishListID", idOFWish.Text.ToString());
                    comand3.ExecuteNonQuery();
                    DataList1.DataBind();
                    Response.Write("<script>alert('Delete Successfully');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Delete Fail');</script>");
                }

                con.Close();
            }
            else
            {
                SqlConnection con;
                int updateCartQuantity, stockNum;
                string cartCheck;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query1 = "SELECT MAX(cartID) AS MaximumID FROM [dbo].[Cart]";
                string query2 = "INSERT INTO [dbo].[Cart](UserName, id, quantity) VALUES (@UserName, @id, @Quantity)";
                string query3 = "SELECT id FROM [dbo].[Cart] WHERE (UserName = @Username) AND (id = @idCheck)";
                string query4 = "SELECT quantity FROM [dbo].[Cart] WHERE (UserName = @Username) AND (id = @idCheck)";
                string query5 = "UPDATE [Cart] SET quantity = @newQuantity WHERE (id = @idCheck)";
                string query6 = "SELECT stock FROM [dbo].[artwork] WHERE (id = @idCheck)";

                SqlCommand comand = new SqlCommand(query1, con);
                SqlCommand comand2 = new SqlCommand(query2, con);
                SqlCommand comand3 = new SqlCommand(query3, con);
                SqlCommand comand4 = new SqlCommand(query4, con);
                SqlCommand comand5 = new SqlCommand(query5, con);
                SqlCommand comand6 = new SqlCommand(query6, con);
                comand.ExecuteNonQuery();

                Label idOFArtwork = e.Item.FindControl("idLabel") as Label;
                Label stockCheck = e.Item.FindControl("stockLabel") as Label;

                if (stockCheck.Text.Equals("0"))
                {
                    Response.Write("<script>alert('No more stock');</script>");
                }
                else
                {
                    comand3.Parameters.AddWithValue("@Username", Session["Username"]);
                    comand3.Parameters.AddWithValue("@idCheck", idOFArtwork.Text.ToString());
                    comand3.ExecuteNonQuery();
                    cartCheck = (string)comand3.ExecuteScalar();

                    if (cartCheck == null)
                    {
                        comand2.Parameters.AddWithValue("@UserName", Session["Username"]);
                        comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
                        comand2.Parameters.AddWithValue("@Quantity", 1);
                        comand2.ExecuteNonQuery();
                        Response.Write("<script>alert('Add Successfully');</script>");
                    }
                    else if (cartCheck != null)
                    {
                        comand6.Parameters.AddWithValue("@idCheck", idOFArtwork.Text.ToString());
                        stockNum = (int)comand6.ExecuteScalar();

                        comand4.Parameters.AddWithValue("@Username", Session["Username"]);
                        comand4.Parameters.AddWithValue("@idCheck", idOFArtwork.Text.ToString());
                        comand4.ExecuteNonQuery();

                        updateCartQuantity = (int)comand4.ExecuteScalar();



                        if (updateCartQuantity < stockNum)
                        {
                            updateCartQuantity += 1;
                            comand5.Parameters.AddWithValue("@newQuantity", updateCartQuantity);
                            comand5.Parameters.AddWithValue("@idCheck", idOFArtwork.Text.ToString());

                            try
                            {
                                comand5.ExecuteNonQuery();
                                Response.Write("<script>alert('Add Successfully');</script>");
                            }
                            catch
                            {
                                Response.Write("<script>alert('Update Fail');</script>");
                            }
                        }
                        else if (updateCartQuantity >= stockNum)
                        {
                            Response.Write("<script>alert('No more stock');</script>");
                        }
                    }
                }
            }
        }

    }
}