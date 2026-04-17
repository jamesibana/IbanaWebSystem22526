using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class MyLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            int rowCount = GridView1.Rows.Count;

            if (rowCount != 0){
                lblMessage.Text = "OK";
            }

            else{
                lblMessage.Text = "Username and password does not exist.";
            }
        }
    }
}