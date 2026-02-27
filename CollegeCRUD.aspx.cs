using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IbanaWebSystem22526
{
    public partial class CollegeCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnAddNewRecord_Click(object sender, EventArgs e)
        {
            pnlAddNewRecord.Visible = true;
            GridView1.Visible = false;
            lbtnAddNewRecord.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            pnlAddNewRecord.Visible = false;
            GridView1.Visible = true;
            lbtnAddNewRecord.Visible = true;
            SqlDataSource2.Insert();
        }
    }
}