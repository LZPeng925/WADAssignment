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
                int maxCartID;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query1 = "SELECT MAX(cartID) AS MaximumID FROM [dbo].[Cart]";
                string query2 = "INSERT INTO [dbo].[Cart](cartID, UserName, id, quantity) VALUES (@maxCartID, @UserName, @id, @Quantity)";
                string query3 = "DELETE FROM [WishList] WHERE WishListID = @WishListID";
                SqlCommand comand = new SqlCommand(query1, con);
                SqlCommand comand2 = new SqlCommand(query2, con);
                SqlCommand comand3 = new SqlCommand(query3, con);
                comand.ExecuteNonQuery();
                //maxCartID = 1;
                maxCartID = (int)comand.ExecuteScalar();
                maxCartID += 1;
                try
                {
                    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;
                    Label idOFWish = e.Item.FindControl("WishListIDLabel") as Label;
                    comand2.Parameters.AddWithValue("@maxCartID", maxCartID);
                    comand2.Parameters.AddWithValue("@UserName", Session["Username"].ToString());
                    comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
                    comand2.Parameters.AddWithValue("@Quantity", 1);
                    comand2.ExecuteNonQuery();

                    comand3.Parameters.AddWithValue("@WishListID", idOFWish.Text.ToString());
                    comand3.ExecuteNonQuery();
                    DataList1.DataBind();
                    Response.Write("<script>alert('Add Successfully');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('There are something have problem');</script>");
                }

                con.Close();
                //Response.Redirect("Artist.aspx");
                //addtocart
            }
        }

    }
}