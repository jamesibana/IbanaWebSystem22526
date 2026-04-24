using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace IbanaWebSystem22526
{


    public partial class CollegeCRUD : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["StudName"] == null)
                    {
                Response.Redirect("MyLogIn.aspx");
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;

            lblStudName.Text = Session["StudName"].ToString();
        }


        #region "UPDATE"
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pageAddEdit();
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtDescription.Text = row.Cells[3].Text;
            txtCode.Text = row.Cells[2].Text;
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtDescription.Text = row.Cells[3].Text;
            txtCode.Text = row.Cells[2].Text;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Update();
        }
        protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
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
            SqlDataSource2.Insert();
        }
        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            pageInitialize();
            myMessage("A new record was inserted");
        }
        #endregion

        #region "MyMethods"
        public void pageInitialize()
        {
            txtCode.Text = "";
            txtDescription.Text = "";
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
            lblMessage.Visible = true;
            lblMessage.Text = msg;
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