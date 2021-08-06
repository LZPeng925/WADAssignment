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

            if ( ! FileUpload1.HasFile)
            {
                lblUploadPic.Text = "Please Insert Image";

            }
            else
            {
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                SqlCommand cmd = new SqlCommand("insert into Manage" + "(ArtwordID , AtrwordName , Artists , PaintCate , PaintStyle , PaintTech , Price, Image) values " +
                    "(@ArtwordID , @AtrwordName , @Artists , @PaintCate , @PaintStyle , @PaintTech , @Price, @Image)",con);
                cmd.Parameters.AddWithValue("@ArtwordID", lblManageID.Text);
                cmd.Parameters.AddWithValue("@AtrwordName", txtManageName.Text);
                cmd.Parameters.AddWithValue("@Artists", txtManageArtists.Text);
                cmd.Parameters.AddWithValue(" @PaintCate", ddlManagePaintCatego.Text);
                cmd.Parameters.AddWithValue("@PaintStyle", ddlManagePaintingStyle.Text);
                cmd.Parameters.AddWithValue("@PaintTech", ddlManagePaintTechniques.Text);
                cmd.Parameters.AddWithValue("@Price", txtManagePrice.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.ExecuteNonQuery();
                con.Close();
                lblInformation.Text = "Succesfully!";

            }



            
        
        
        
        
        
        
        }
    }
}