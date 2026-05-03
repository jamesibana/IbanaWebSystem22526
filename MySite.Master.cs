using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class MySite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Log in verification
            if (Session["StudName"] != null)
            {
                navLogin.Visible = false;
                navRegister.Visible = false;

                navLogout.Visible = true;
                navWelcome.Visible = true;
                lblUserName.Text = Session["StudName"].ToString();

                phSessionTimer.Visible = true;
            }
            else
            {
                navLogin.Visible = true;
                navRegister.Visible = true;

                navLogout.Visible = false;
                navWelcome.Visible = false;

                phSessionTimer.Visible = false;
            }
        }

        // Log out and destroy session
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();


            Response.Redirect("~/MyLogIn.aspx");
        }
    }
}