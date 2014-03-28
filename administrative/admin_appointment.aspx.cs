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
            _showPanel(pnl_doctorList);
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
        pnl_appointments.Visible = false;
        pnl_timeslot.Visible = false;
        pnl_addtimeslot.Visible = false;
        pnl.Visible = true;
    }


    protected void subAdmin(object sender, CommandEventArgs e)
    {
        Guid _doctor_id;
        _doctor_id = new Guid(e.CommandArgument.ToString());
        ViewState["doctor_id"] = e.CommandArgument.ToString();
        switch (e.CommandName)
        {
            case "ViewAppointment":
                _showPanel(pnl_appointments);
                break;
            case "ViewTimeslot":
                _showPanel(pnl_timeslot);
                lbl_doctimeslot.Text = "Time slots for DR. " + getUserFullName(_doctor_id);
                //lbl_doctimeslot.Text = e.CommandArgument.ToString();
                break;
        }
    }

    //Get user full name
    public string getUserFullName(Guid _userId)
    {
        linqUsers objUsers = new linqUsers();
        int count = objUsers.getUserAdditionalInfoByUserId(_userId).Count();

        if (count == 0)
            return "";
        else
        {
            var objCurrentUser = objUsers.getUserAdditionalInfoByUserId(_userId).First();
            return objCurrentUser.FirstName + " " + objCurrentUser.LastName;
        }
    }

    protected void lkb_backtodoclist_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_doctorList);
    }
    protected void btn_addtimeslot_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_addtimeslot);
        Guid _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        lbl_docaddtimeslot.Text = "Add new available time slot for DR. " + getUserFullName(_doctor_id);
    }
    protected void btn_savetimeslot_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_timeslot);
    }
    protected void btn_cancelsave_Click(object sender, EventArgs e)
    {
        txt_timeslotdate.Text = "";
        ddl_starttime.SelectedIndex = ddl_starttime.Items.IndexOf(ddl_starttime.Items.FindByText("09:00"));
        ddl_endtime.SelectedIndex = ddl_endtime.Items.IndexOf(ddl_endtime.Items.FindByText("09:30"));
        _showPanel(pnl_timeslot);
    }
}