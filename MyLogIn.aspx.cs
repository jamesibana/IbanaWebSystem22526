using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class MyLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            // Hash what the user typed
            string attemptHash = HashPassword(txtPW.Text);

            // Inject the hash into the 2nd parameter slot (Index 1)
            SqlDataSource1.SelectParameters[1].DefaultValue = attemptHash;

            // Trigger the search
            GridView1.DataBind();
            int rowCount = GridView1.Rows.Count;

            if (rowCount != 0)
            {
                Session["StudName"] = GridView1.Rows[0].Cells[2].Text + " " + GridView1.Rows[0].Cells[3].Text;
                Response.Redirect("CollegeCRUD.aspx");
            }
            else
            {
                lblMessage.Text = "Username and password does not exist.";
            }
        }
    }
}