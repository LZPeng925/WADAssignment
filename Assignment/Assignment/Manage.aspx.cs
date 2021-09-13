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
            if (!IsPostBack)
            {
                GenerateAutoID();
            }
            txtManageArtists.Text = Session["Username"].ToString();
            txtManageArtists.Enabled = false;
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
            i++;
            lblManageID.Text = artID + i.ToString();

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
                SqlCommand cmd = new SqlCommand("insert into artwork" + "(id , Name , artists , paintCate , paintStyle , paintTech , price, image, stock) values (@ArtwordID , @ArtwordName , @Artists , @PaintCate , @PaintStyle , @PaintTech , @Price, @Image ,@stock)", con);
                cmd.Parameters.AddWithValue("@ArtwordID", lblManageID.Text);
                cmd.Parameters.AddWithValue("@ArtwordName", txtManageName.Text);
                cmd.Parameters.AddWithValue("@Artists", txtManageArtists.Text);
                cmd.Parameters.AddWithValue("@PaintCate", ddlManagePaintCatego.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@PaintStyle", ddlManagePaintingStyle.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@PaintTech", ddlManagePaintTechniques.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Price", txtManagePrice.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.Parameters.AddWithValue("@stock", txtManageStock.Text);
                cmd.ExecuteScalar();
                con.Close();
                GenerateAutoID();
                lblInformation.Text = "Succesfully!";
                
                

            }
        }

        //protected void btnManageUpload_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con;
        //    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //    con = new SqlConnection(strCon);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("select image from artwork where  ");
        //}




    }
}