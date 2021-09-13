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
            if(e.CommandName == "AddToCart")
            {
                SqlConnection con;
                int maxCartID;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query1 = "SELECT MAX(cartID) AS MaximumID FROM [dbo].[Cart]";
                string query2 = "INSERT INTO [dbo].[Cart](cartID, UserName, id, quantity) VALUES (@maxCartID, @UserName, @id, @Quantity)";
                SqlCommand comand = new SqlCommand(query1, con);
                SqlCommand comand2 = new SqlCommand(query2, con);
                comand.ExecuteNonQuery();
                //maxCartID = 1;
                maxCartID = (int)comand.ExecuteScalar();
                maxCartID += 1;
                try
                {
                    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;
                    comand2.Parameters.AddWithValue("@maxCartID", maxCartID);
                    comand2.Parameters.AddWithValue("@UserName", Session["Username"]);
                    comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
                    comand2.Parameters.AddWithValue("@Quantity", 1);
                    comand2.ExecuteNonQuery();
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
            else
            {
                SqlConnection con;
                int maxWishID;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);

                con.Open();
                string query1 = "SELECT MAX(WishListId) AS MaximumID FROM [dbo].[WishList]";
                string query2 = "INSERT INTO [dbo].[WishList](WishListId, UserName, id) VALUES (@maxWishID, @UserName, @id)";
                SqlCommand comand = new SqlCommand(query1, con);
                SqlCommand comand2 = new SqlCommand(query2, con);
                comand.ExecuteNonQuery();
                //maxWishID = 1;
                maxWishID = (int)comand.ExecuteScalar();
                maxWishID += 1;

                try
                {
                    Label idOFArtwork = e.Item.FindControl("idLabel") as Label;
                    comand2.Parameters.AddWithValue("@maxWishID", maxWishID);
                    comand2.Parameters.AddWithValue("@UserName", Session["Username"]);
                    comand2.Parameters.AddWithValue("@id", idOFArtwork.Text.ToString());
                    comand2.ExecuteNonQuery();
                    Response.Write("<script>alert('Add Successfully');</script>");
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

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        public void searchData(String valueToSearch)
        {

            SqlConnection con;
            SqlCommand command;

            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            string query = "Select * from artwork WHERE CONCAT([id], [name], [artists], [paintCate], [paintStyle], [paintTech], [price], [stock]) like '%" + valueToSearch + "%'";
            command = new SqlCommand(query, con);
            con.Open();
            SqlDataReader sdr = command.ExecuteReader();
            if (sdr.HasRows)
            {
                DataList3.DataSource = sdr;
                DataList3.DataBind();
            }
            else
            {
                lblNotice.Text = "Not Data Found";
            }
            con.Close();

        }

        protected void btnManageSearch_Click(object sender, EventArgs e)
        {
            string valueToSearch = txtSearch.Text.ToString();
            searchData(valueToSearch);
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