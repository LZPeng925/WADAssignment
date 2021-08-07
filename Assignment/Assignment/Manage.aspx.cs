using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Assignment
{
    public partial class ArtworkManage : System.Web.UI.Page

    {
        //SqlCommand cmd = new SqlCommand();
       // SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtManageName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            if (! FileUpload1.HasFile)
            {
                lblUploadPic.Text = "Please Insert Image";

            }
            else
            {
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                SqlCommand cmd = new SqlCommand("insert into artwork" + "(id , Name , artists , paintCate , paintStyle , paintTech , price, image) values (@ArtwordID , @ArtwordName , @Artists , @PaintCate , @PaintStyle , @PaintTech , @Price, @Image)", con);
                cmd.Parameters.AddWithValue("@ArtwordID", txtID.Text);
                cmd.Parameters.AddWithValue("@ArtwordName", txtManageName.Text);
                cmd.Parameters.AddWithValue("@Artists", txtManageArtists.Text);
                cmd.Parameters.AddWithValue("@PaintCate", ddlManagePaintCatego.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@PaintStyle", ddlManagePaintingStyle.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@PaintTech", ddlManagePaintTechniques.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Price", txtManagePrice.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.ExecuteScalar();
                con.Close();
                lblInformation.Text = "Succesfully!";

                //String con = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=True";
                //SqlConnection sqlcon = new SqlConnection(con);
                //FileUpload1.SaveAs(Server.MapPath("~/ArtPic/") + Path.GetFileName(FileUpload1.FileName));
                //String link = "ArtPic/" + Path.GetFileName(FileUpload1.FileName);


                //String query = "Insert into Manage (ArtwordID, ArtwordName, Artists, PaintCate, PaintStyle, PaintTech, Price, Image) values (" + txtID .Text + " ,  '" + txtManageName.Text + "' ,  '" + txtManageArtists.Text + "' , '" + ddlManagePaintCatego.SelectedItem.ToString() + "' , '" + ddlManagePaintingStyle.SelectedItem.ToString() + "' , '" + ddlManagePaintTechniques.SelectedItem.ToString() + "' , '" + txtManagePrice.Text + "' , '" + link + "')";
                //SqlCommand cmd = new SqlCommand(query, sqlcon);
                //sqlcon.Open();
                //cmd.ExecuteNonQuery();
                //sqlcon.Close();

                //lblInformation.Text = "Succesfully !!!";









            }


            }

        
    }
}