using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class visitors_calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //添加日期控件的这个事件 
    protected void MyDayRenderer(object sender, DayRenderEventArgs e)
    {
        calendarClassLinq objLinq = new calendarClassLinq();
        var events = objLinq.getEventsList();

        foreach (var each_event in events)
        {
            int event_id = Convert.ToInt32(each_event.event_id);
            string event_title = each_event.event_title.ToString();
            string event_content = each_event.event_content.ToString();
            DateTime start_date = Convert.ToDateTime(each_event.start_date);
            DateTime end_date = Convert.ToDateTime(each_event.end_date);

            if (e.Day.Date == start_date)
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
                e.Cell.ToolTip = "Event: " + event_title;
            }
        }
        //DateTime aa = Calendar1.SelectedDate;
        //lbl_output.Text = aa.ToString();
    }

    protected void Calender1_SelectionChanged(object sender, EventArgs e)
    {
        lbl_output.Text = Calendar1.SelectedDate.Date.ToString();
        calendarClassLinq objLinq = new calendarClassLinq();
        var events = objLinq.getEventsList();

        if (events.Count() != 0)
        {
            grv_main.DataSource = objLinq.getEventsListByDate(Convert.ToDateTime(Calendar1.SelectedDate.Date.ToString()));
            grv_main.DataBind();
        }
    }  
}