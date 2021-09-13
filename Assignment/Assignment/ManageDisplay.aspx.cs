using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Assignment
{
    public partial class ArtManageDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void searchData (String valueToSearch)
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
                DataList1.DataSource = sdr;
                DataList1.DataBind();
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
    }
}