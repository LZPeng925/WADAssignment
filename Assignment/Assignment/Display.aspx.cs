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