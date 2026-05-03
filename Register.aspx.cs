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
            // 1. Check empty fields (Updated to check txtStudentNo)
            if (string.IsNullOrWhiteSpace(txtStudentNumber.Text) ||
                string.IsNullOrWhiteSpace(txtUN.Text) ||
                string.IsNullOrWhiteSpace(txtPW.Text))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Please fill out all fields before registering.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // 2. Index validation (Search by Student Number)
            grdValidation.DataBind();
            int count = grdValidation.Rows.Count;

            if (count == 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: Invalid Student Number.";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // *** THE TRANSLATOR TRICK ***
            // The student exists! Let's grab their internal database [index] 
            // We use DataKeys[0] because the GridView secretly remembers it!
            string actualStudentIndex = grdValidation.DataKeys[0].Value.ToString();


            // 3. Duplicate checking
            // Inject the translated index into the SelectQuery parameter (Index 0)
            SqlDataSource1.SelectParameters[0].DefaultValue = actualStudentIndex;

            grdDuplicateCheck.DataBind();
            int rowCount = grdDuplicateCheck.Rows.Count;

            if (rowCount != 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: This Student is already registered!";
                lblMessage.ForeColor = Color.Red;
                return;
            }

            // 4. Insertion
            try
            {
                // Inject the translated index into the InsertQuery's 1st parameter
                SqlDataSource1.InsertParameters[0].DefaultValue = actualStudentIndex;

                // Hash the password and inject it into the InsertQuery's 3rd parameter
                string myHashedPassword = HashPassword(txtPW.Text);
                SqlDataSource1.InsertParameters[2].DefaultValue = myHashedPassword;

                // NOW execute the insert
                SqlDataSource1.Insert();

                lblMessage.Visible = true;
                lblMessage.Text = "You have successfully registered.";
                lblMessage.ForeColor = Color.Green;

                // Clear textboxes
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