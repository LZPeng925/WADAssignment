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
            if (!IsPostBack)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();
                SqlCommand query = new SqlCommand("Select * from artwork ", con);
                SqlDataReader reader = query.ExecuteReader();
                if (reader.Read())
                {
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

            SqlCommand cmd = new SqlCommand("update artwork set  Name = @ArtwordName , artists = @Artists , paintCate =  @PaintCate , paintStyle =  @PaintStyle , paintTech = @PaintTech , price = @Price, stock = @stock  where id = @ArtwordID", con);
            cmd.Parameters.AddWithValue("@ArtwordID", txtID.Text);
            cmd.Parameters.AddWithValue("@ArtwordName", txtEditName.Text);
            cmd.Parameters.AddWithValue("@Artists", txtEditArtists.Text);
            cmd.Parameters.AddWithValue("@PaintCate", ddlEditPaintCatego.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@PaintStyle", ddlEditPaintingStyle.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@PaintTech", ddlEditPaintTechniques.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Price", txtEditPrice.Text);
            cmd.Parameters.AddWithValue("@stock", txtEditStock.Text);
            cmd.ExecuteScalar();
            con.Close();
            
            lblInformation.Text = "Succesfully!"; 


        }

        protected void btnChangePic_Click(object sender, EventArgs e)
        {

        }
    }
}