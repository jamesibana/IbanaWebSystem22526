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

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convert the string into a byte array and hash it
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert the byte array back into a readable string of hex characters
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
            //Check empty fields
            if (string.IsNullOrWhiteSpace(txtStudentIndex.Text) ||
                string.IsNullOrWhiteSpace(txtUN.Text) ||
                string.IsNullOrWhiteSpace(txtPW.Text))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Please fill out all fields before registering.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            //Index validation
            grdValidation.DataBind();
            // Count the rows it found
            int count = grdValidation.Rows.Count;

            if (count == 0)
            {
                // If the row count is zero, the index does not exist.
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Invalid Student Index.";
                return; // Stop the registration
            }

            //Duplicate checking
            grdDuplicateCheck.DataBind();

            // Count the rows it found
            int rowCount = grdDuplicateCheck.Rows.Count;

            if (rowCount != 0)
            {
                // If the row count is NOT zero, it found a match in the database.
                lblMessage.Visible = true;
                lblMessage.Text = "Error: This Student Index is already registered!";
                return; // Stop the registration
            }

            //Insertion
            try
            {
                // Hash the password and inject it into the SqlDataSource parameter
                string myHashedPassword = HashPassword(txtPW.Text);
                SqlDataSource1.InsertParameters["HashedPW"].DefaultValue = myHashedPassword;

                // NOW execute the insert
                SqlDataSource1.Insert();

                lblMessage.Visible = true;
                lblMessage.Text = "You have successfully registered.";
                lblMessage.ForeColor = Color.Green;

                // Clear textboxes
                txtStudentIndex.Text = "";
                txtUN.Text = "";
                txtPW.Text = "";
            }

            catch (Exception ex)
            {
                //Error checking
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