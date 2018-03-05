using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MainWebpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSelect_Click(object sender, EventArgs e)
        {
            string Selection = DropDownList1.SelectedValue;
           Response.Redirect(Selection);
                

            
        }
    }
}