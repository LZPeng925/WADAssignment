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
    public partial class ButtonTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddtoWish_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            int maxID;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            con.Open();
            string query1 = "SELECT MAX(WishListId) AS MaximumID FROM [dbo].[WishList]";
            string query2 = "INSERT INTO [dbo].[WishList](WishListId, UserID, InventoryID) VALUES (@maxID, @UserID, @InventoryID)";
            SqlCommand comand = new SqlCommand(query1, con);
            SqlCommand comand2 = new SqlCommand(query2, con);
            comand.ExecuteNonQuery();
            maxID = (int)comand.ExecuteScalar();
            maxID += 1;
            comand2.Parameters.AddWithValue("@maxID", maxID);
            comand2.Parameters.AddWithValue("@UserID", lblUserID.Text);
            comand2.Parameters.AddWithValue("@InventoryID", ddlInventoryID.SelectedValue.ToString());
            comand2.ExecuteNonQuery();
            con.Close();
        }
    }
}