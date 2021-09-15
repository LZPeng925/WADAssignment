using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class EditGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEditArtists.Enabled = false;
            if (!IsPostBack)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand query = new SqlCommand("Select * from artwork where id = @ArtworkID ", con);
                query.Parameters.AddWithValue("@ArtworkID", Session["id"].ToString());
               
                SqlDataReader reader = query.ExecuteReader();
                if (reader.Read())
                {
                    lblID.Text = reader.GetValue(0).ToString();
                    txtEditName.Text = reader.GetValue(1).ToString();
                    txtEditArtists.Text = reader.GetValue(2).ToString();
                    ddlEditPaintCatego.Items.Add(reader.GetValue(3).ToString());
                    ddlEditPaintingStyle.Items.Add(reader.GetValue(4).ToString());
                    ddlEditPaintTechniques.Items.Add(reader.GetValue(5).ToString());
                    txtEditPrice.Text = reader.GetValue(6).ToString();
                    txtEditStock.Text = reader.GetValue(8).ToString();
                    if (reader.GetValue(7).ToString() != "")
                    {
                        byte[] bytes = (byte[])reader.GetValue(7);
                        string strBase64 = Convert.ToBase64String(bytes);
                        Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                    }
                }
                con.Close();
            }

        }

     

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //int id = int.Parse(lbl_ID.Text);

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            if (!FileUpload1.HasFile && Image1.ImageUrl==null)
            {
                lblUploadPic.Text = "Please Insert Image";
            }
            else
            {
                if (Image1.ImageUrl!=null && FileUpload1.HasFile)
                {
                    int length = FileUpload1.PostedFile.ContentLength;
                    byte[] pic = new byte[length];
                    FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                    SqlCommand cmd = new SqlCommand("update artwork set  Name = @ArtwordName , artists = @Artists , paintCate =  @PaintCate , paintStyle =  @PaintStyle , paintTech = @PaintTech , price = @Price, image=@Image ,stock = @stock  where id = @ArtworkID", con);
                    // cmd.Parameters.AddWithValue("@ArtworkID", Session["id"].ToString());
                    cmd.Parameters.AddWithValue("@ArtworkID", lblID.Text);
                    cmd.Parameters.AddWithValue("@ArtwordName", txtEditName.Text);
                    cmd.Parameters.AddWithValue("@Artists", txtEditArtists.Text);
                    cmd.Parameters.AddWithValue("@PaintCate", ddlEditPaintCatego.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@PaintStyle", ddlEditPaintingStyle.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@PaintTech", ddlEditPaintTechniques.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Price", txtEditPrice.Text);
                    cmd.Parameters.AddWithValue("@Image", pic);
                    cmd.Parameters.AddWithValue("@stock", txtEditStock.Text);
                    cmd.ExecuteScalar();
                    con.Close();
                    byte[] bytes = pic;
                    string strBase64 = Convert.ToBase64String(bytes);
                    Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("update artwork set  Name = @ArtwordName , artists = @Artists , paintCate =  @PaintCate , paintStyle =  @PaintStyle , paintTech = @PaintTech , price = @Price ,stock = @stock  where id = @ArtworkID", con);
                    // cmd.Parameters.AddWithValue("@ArtworkID", Session["id"].ToString());
                    cmd.Parameters.AddWithValue("@ArtworkID", lblID.Text);
                    cmd.Parameters.AddWithValue("@ArtwordName", txtEditName.Text);
                    cmd.Parameters.AddWithValue("@Artists", txtEditArtists.Text);
                    cmd.Parameters.AddWithValue("@PaintCate", ddlEditPaintCatego.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@PaintStyle", ddlEditPaintingStyle.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@PaintTech", ddlEditPaintTechniques.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Price", txtEditPrice.Text);
                    cmd.Parameters.AddWithValue("@stock", txtEditStock.Text);
                    cmd.ExecuteScalar();
                    con.Close();
                }
                lblInformation.Text = "Succesfully!";
            }


        }

        //protected void onDelete(object sender, EventArgs e)
        //{
        //    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        //    string orderID = (item.FindControl("lblOrderId") as Label).Text;

        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        con.Open();
        //        SqlCommand sql = new SqlCommand("delete from dblOrder where orderID='" + orderID + "' ", con);

        //        sql.ExecuteNonQuery();
        //        con.Close();
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully deleted this Order !!!');window.location ='OrderStat.aspx';", true);
        //    }
        //}


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            //string id2 = (item.FindControl("lblID") as Label).Text;

            //string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(strCon))
            //{
            //    con.Open();
            //    SqlCommand sql = new SqlCommand("delete from artwork where id='" id2 "' ", con);
            //}



            //string artID = "ART ";
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            //SqlCommand cmd = new SqlCommand("Delete from artwork where id = @ArtwordID", con);
            SqlCommand cmd = new SqlCommand("Delete from artwork where id ='" +lblID.Text +"'",con);
            cmd.ExecuteNonQuery();
            con.Close();
            
            lblInformation.Text = "Delete Successfully";
        }


        private void updateID()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("update artwort set id = @ArtworkID");




        }

        private void GenerateAutoID()
        {
            string artID = "ART ";

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Count(id) from artwork", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i--;
            lblID.Text = artID + i.ToString();

        }
       
        


    }



}