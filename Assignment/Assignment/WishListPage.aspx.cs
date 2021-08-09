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
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                Label lblID = (Label)PreviousPage.FindControl("lblUserID");
                lblUserID.Text = "" + lblID.Text;
            }
        }
        protected void btnDeleteWish_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            con.Open();
            string query1 = "DELETE FROM [WishList] WHERE WishListId = @deleteID";
            SqlCommand comand = new SqlCommand(query1, con);
            comand.Parameters.AddWithValue("@deleteID", ddlSelectInventory.SelectedValue.ToString());
            comand.ExecuteNonQuery();
            GridView1.DataBind();
            con.Close();

        }

        protected void btnPay_Click(object sender, EventArgs e)
        {

        }
    }
}