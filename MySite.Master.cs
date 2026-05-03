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
            // Check if the user is currently logged in
            if (Session["StudName"] != null)
            {
                navLogin.Visible = false;
                navRegister.Visible = false;

                navLogout.Visible = true;
                navWelcome.Visible = true;
                lblUserName.Text = Session["StudName"].ToString();

                // ADD THIS: Turn ON the Session Timer!
                phSessionTimer.Visible = true;
            }
            else
            {
                navLogin.Visible = true;
                navRegister.Visible = true;

                navLogout.Visible = false;
                navWelcome.Visible = false;

                // ADD THIS: Keep the Session Timer completely OFF for guests
                phSessionTimer.Visible = false;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            // 1. Destroy the session entirely
            Session.Clear();
            Session.Abandon();

            // 2. Redirect back to the login page
            Response.Redirect("~/MyLogIn.aspx");
        }
    }
}