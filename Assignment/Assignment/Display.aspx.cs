using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string c;
            //c = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            //SqlConnection con = new SqlConnection(c);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("Select * from artwork", con);
            //SqlDataReader dr = cmd.ExecuteReader();
            //GridView1.DataSource = dr;
            //GridView1.DataBind();
            //con.Close();
            if (Session["Role"].ToString() == "Artist")
            {
                DataList1.Visible = false;
            }
            else
            {
                DataList2.Visible = false;
            }

            //if (!this.IsPostBack)
            //{
            //    string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //    using (SqlConnection conn = new SqlConnection(constr))
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM artwork", conn))
            //        {
            //            DataTable dt = new DataTable();
            //            sda.Fill(dt);

            //        }
            //    }
            //}
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
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
                //maxCartID = 1;
                try
                {
                    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;

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
                catch
                {
                    Response.Write("<script>alert('There are something have problem');</script>");
                }

                con.Close();
                //Response.Redirect("Artist.aspx");
                //addtocart
            }
            else
            {
                SqlConnection con;
                int maxWishID;
                string wishCheck;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query1 = "SELECT MAX(WishListId) AS MaximumID FROM [dbo].[WishList]";
                string query2 = "INSERT INTO [dbo].[WishList](WishListId, UserName, id) VALUES (@maxWishID, @UserName, @id)";
                string query3 = "SELECT id FROM [dbo].[WishList] WHERE (UserName = @Username) AND (id = @idCheck)";

                SqlCommand comand = new SqlCommand(query1, con);
                SqlCommand comand2 = new SqlCommand(query2, con);
                SqlCommand comand3 = new SqlCommand(query3, con);
                comand.ExecuteNonQuery();
                //maxWishID = 1;
                maxWishID = (int)comand.ExecuteScalar();
                maxWishID += 1;

                try
                {
                    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;

                    comand3.Parameters.AddWithValue("@Username", Session["Username"]);
                    comand3.Parameters.AddWithValue("@idCheck", idOFArtwork.Text.ToString());
                    comand3.ExecuteNonQuery();
                    wishCheck = (string)comand3.ExecuteScalar();

                    if (wishCheck == null)
                    {
                        comand2.Parameters.AddWithValue("@maxWishID", maxWishID);
                        comand2.Parameters.AddWithValue("@UserName", Session["Username"]);
                        comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
                        comand2.ExecuteNonQuery();
                        Response.Write("<script>alert('Add Successfully');</script>");
                    }
                    else if (wishCheck != null)
                    {
                        Response.Write("<script>alert('This Art has exist in your wish list.');</script>");
                    }

                }
                catch
                {
                    Response.Write("<script>alert('There are something have problem');</script>");
                }

                con.Close();
                //Response.Redirect("WishListPage.aspx");
                //wishlist
            }
        }



        //public void searchData(String valueToSearch)
        //{

        //    SqlConnection con;
        //    SqlCommand command;

        //    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //    con = new SqlConnection(strCon);
        //    string query = "Select * from artwork WHERE CONCAT([id], [name], [artists], [paintCate], [paintStyle], [paintTech], [price], [stock]) like '%" + valueToSearch + "%'";
        //    command = new SqlCommand(query, con);
        //    con.Open();
        //    SqlDataReader sdr = command.ExecuteReader();
        //    if (sdr.HasRows)
        //    {
        //        DataList3.DataSource = sdr;
        //        DataList3.DataBind();
        //    }
        //    else
        //    {
        //        lblNotice.Text = "Not Data Found";
        //    }
        //    con.Close();

        //}

        protected void btnManageSearch_Click(object sender, EventArgs e)
        {
            //string valueToSearch = txtSearch.Text.ToString();
            //searchData(valueToSearch);
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from artwork WHERE CONCAT([id], [name], [artists], [paintCate], [paintStyle], [paintTech], [price], [stock]) like '%" + txtSearch.Text + "%'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void DataList2_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Label idOFArtwork =  e.Item.FindControl("idLabel") as Label ;
                Session["id"] = idOFArtwork.Text;
                //idOFArtwork.Visible = true;
                Response.Redirect("EditGallery.aspx?id=" + e.CommandArgument.ToString());

            }
        }

        //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DataRowView dr = (DataRowView)e.Row.DataItem;
        //        string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
        //        (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        //    }
        //}

    }
}