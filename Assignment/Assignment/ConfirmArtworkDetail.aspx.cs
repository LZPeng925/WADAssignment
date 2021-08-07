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
    public partial class ConfirmArtworkDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            SqlDataReader dataReader;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                String Output = "";
                String Output2 = "";
                DropDownList txtName = (DropDownList)PreviousPage.FindControl("ddlInventoryID");
                lblArtworkID.Text = txtName.Text;

                con.Open();
                string query = "SELECT InventoryName, InventoryPrice FROM [PreInventory] WHERE InventoryID = @InventoryID";
                SqlCommand comand = new SqlCommand(query, con);
                comand.Parameters.AddWithValue("@InventoryID", lblArtworkID.Text);
                dataReader = comand.ExecuteReader();
                while (dataReader.Read())
                {
                    Output = Output + dataReader.GetValue(0);
                    Output2 = Output2 + "RM" + dataReader.GetValue(1);
                }

                lblArtworkName.Text = Output;
                lblArtworkPrice.Text = Output2;
                con.Close();
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }
    }
}