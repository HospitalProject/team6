using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        linqUsers objUsers = new linqUsers();

        var allDoctors = objUsers.getAllDoctors();
        rpt_doctorlist.DataSource = allDoctors;
        rpt_doctorlist.DataBind();
    }

    private void _showPanel(Panel pnl)
    {
        pnl_doctorList.Visible = false;
        pnl.Visible = true;
    }


}