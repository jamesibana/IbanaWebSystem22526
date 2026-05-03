using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class ProgramCRUD : System.Web.UI.Page
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["StudName"] == null)
            {
                Response.Redirect("MyLogIn.aspx?ReturnUrl=ProgramCRUD.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;

            lblStudName.Text = "Session: " + Session["StudName"].ToString();
        }


        #region "UPDATE"
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtCode.Text = row.Cells[1].Text;
            txtName.Text = row.Cells[2].Text;
            // Read CollegeID from DataKeys to avoid depending on cell indexes
            object collegeKey = GridView1.SelectedDataKey != null ? GridView1.SelectedDataKey.Values["CollegeID"] : null;
            if (collegeKey != null)
            {
                // Ensure DropDownList has been databound so SelectedValue exists
                DropDownList1.DataBind();
                string val = collegeKey.ToString();
                if (DropDownList1.Items.FindByValue(val) != null)
                {
                    DropDownList1.SelectedValue = val;
                }
                else
                {
                    // If the value isn't in the list, select the first item to avoid exception
                    if (DropDownList1.Items.Count > 0) DropDownList1.SelectedIndex = 0;
                }
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Ensure the clicked row becomes the selected row so DataKeys are available
            var btn = sender as Button;
            if (btn != null)
            {
                var row = btn.NamingContainer as GridViewRow;
                if (row != null)
                {
                    GridView1.SelectedIndex = row.RowIndex;
                    // Manually invoke SelectedIndexChanged handler to populate fields
                    GridView1_SelectedIndexChanged(this, EventArgs.Empty);
                }
            }

            pageAddEdit();
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Ensure all update parameters are provided for the Update operation
            try
            {
                Program.UpdateParameters["Code"].DefaultValue = txtCode.Text;
                Program.UpdateParameters["Description"].DefaultValue = txtName.Text;
                Program.UpdateParameters["CollegeID"].DefaultValue = DropDownList1.SelectedValue;

                string programId = null;
                if (GridView1.SelectedDataKey != null && GridView1.SelectedDataKey.Values["ProgramID"] != null)
                {
                    programId = GridView1.SelectedDataKey.Values["ProgramID"].ToString();
                }
                else if (GridView1.SelectedIndex >= 0 && GridView1.DataKeys[GridView1.SelectedIndex] != null)
                {
                    programId = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
                }

                if (string.IsNullOrEmpty(programId))
                {
                    // Provide a clearer error instead of letting SqlDataSource throw MetaTable error
                    myMessage("Cannot determine ProgramID for update. Make sure a row is selected before clicking Update.");
                    return;
                }

                Program.UpdateParameters["ProgramID"].DefaultValue = programId;
                Program.Update();
            }
            catch (Exception ex)
            {
                myMessage("Update failed: " + ex.Message);
            }
        }
        protected void Program_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            pageInitialize();
            myMessage("A record was updated");
        }
        #endregion

        #region "INSERT"
        protected void lbtnAddNewRecord_Click(object sender, EventArgs e)
        {
            pageAddEdit();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void Program_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            pageInitialize();
            myMessage("A new record was inserted");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Program.Insert();
        }
        #endregion

        #region "MyMethods"
        public void pageInitialize()
        {
            txtCode.Text = "";
            txtName.Text = "";
            pnlAddNewRecord.Visible = false;
            GridView1.Visible = true;
            lbtnAddNewRecord.Visible = true;
        }

        public void pageAddEdit()
        {
            pnlAddNewRecord.Visible = true;
            GridView1.Visible = false;
            lbtnAddNewRecord.Visible = false;
        }

        public void myMessage(string msg)
        {
            lblMessage.Text = msg;
            lblMessage.Visible = true;
        }


        #endregion

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            myMessage("A record was deleted");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pageInitialize();
        }
    }
}