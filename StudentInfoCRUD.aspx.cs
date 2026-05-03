using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class StudentInfoCRUD : System.Web.UI.Page
    {
        private string sex;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["StudName"] == null)
            {
                Response.Redirect("MyLogIn.aspx?ReturnUrl=StudentInfoCRUD.aspx");
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
            txtStudentID.Text = row.Cells[2].Text;
            txtFirstName.Text = row.Cells[3].Text;
            txtMiddleName.Text = row.Cells[4].Text;
            txtLastName.Text = row.Cells[5].Text;
            Label lblBdayRaw = (Label)row.FindControl("lblBdayRaw");
            if (lblBdayRaw != null) txtBday.Text = lblBdayRaw.Text;
            object sexKey = GridView1.SelectedDataKey != null ? GridView1.SelectedDataKey.Values["Sex"] : null;
            sex = sexKey != null ? sexKey.ToString() : string.Empty;
            rbtnMale.Checked = sex == "M";
            rbtnFemale.Checked = sex == "F";
            DropDownList1.SelectedValue = row.Cells[8].Text;
            ddlYearLevel.SelectedValue = row.Cells[9].Text;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pageAddEdit();
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            sex = rbtnMale.Checked ? "M" : "F";
            StudentInfo.UpdateParameters["Sex"].DefaultValue = sex;
            StudentInfo.Update();
        }
        protected void StudentInfo_Updated(object sender, SqlDataSourceStatusEventArgs e)
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            sex = rbtnMale.Checked ? "M" : "F";
            StudentInfo.InsertParameters["Sex"].DefaultValue = sex;
            StudentInfo.Insert();
        }

        protected void StudentInfo_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            pageInitialize();
            myMessage("A new record was inserted");
        }
        #endregion

        #region MyMethods
        public void pageInitialize()
        {
            txtStudentID.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtBday.Text = "";
            rbtnMale.Checked = false;
            rbtnFemale.Checked = false;
            DropDownList1.SelectedIndex = 0;
            ddlYearLevel.SelectedIndex = 0;
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