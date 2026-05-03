using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        // Hash the password (Security)
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Check for empty fields
            if (string.IsNullOrWhiteSpace(txtStudentNumber.Text) ||
                string.IsNullOrWhiteSpace(txtUN.Text) ||
                string.IsNullOrWhiteSpace(txtPW.Text))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Please fill out all fields before registering.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // Index validation
            grdValidation.DataBind();
            int count = grdValidation.Rows.Count;

            if (count == 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Invalid Student Number.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            string actualStudentIndex = grdValidation.DataKeys[0].Value.ToString();


            // Index duplicate checking
            SqlDataSource1.SelectParameters[0].DefaultValue = actualStudentIndex;
            grdDuplicateCheck.DataBind();

            if (grdDuplicateCheck.Rows.Count != 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: This Student is already registered!";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // Username duplicate checking
            grdUsernameCheck.DataBind();

            if (grdUsernameCheck.Rows.Count != 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Username already taken.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // Insertion
            try
            {
                SqlDataSource1.InsertParameters[0].DefaultValue = actualStudentIndex;

                string myHashedPassword = HashPassword(txtPW.Text);
                SqlDataSource1.InsertParameters[2].DefaultValue = myHashedPassword;

                SqlDataSource1.Insert();

                lblMessage.Visible = true;
                lblMessage.Text = "You have successfully registered.";
                lblMessage.ForeColor = Color.Green;

                txtStudentNumber.Text = "";
                txtUN.Text = "";
                txtPW.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "A database error occurred: " + ex.Message;
                lblMessage.ForeColor = Color.Red;
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}