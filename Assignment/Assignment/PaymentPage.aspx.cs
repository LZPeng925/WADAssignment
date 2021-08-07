using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (rblWayToPay.SelectedValue == "FPX")
            {
                Label1.Visible = true;
                ddlNameofBank.Visible = true;
            }
            else
            {
                Label1.Visible = false;
                ddlNameofBank.Visible = false;
            }
        }
    }
}