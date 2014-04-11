using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CareersListClass
/// </summary>
public class calendarClassLinq
{
    public IQueryable<event_calendar> getEventsList()
    {
        CalendarDataContext obj = new CalendarDataContext();
        var list = obj.event_calendar.Select(x => x);
        return list;
    }

    public IQueryable<event_calendar> getEventsListByID(int _id)
    {
        CalendarDataContext obj = new CalendarDataContext();
        var list = obj.event_calendar.Where(x => x.event_id == _id).Select(x => x);
        return list;
    }

    public IQueryable<event_calendar> getEventsListByDate(DateTime _start_date)
    {
        CalendarDataContext obj = new CalendarDataContext();
        var list = obj.event_calendar.Where(x => x.start_date == _start_date).Select(x => x);
        return list;
    }

    public bool commitInsert(string _event_title, string _event_content, DateTime _start_date, DateTime _end_date)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            event_calendar obj = new event_calendar();
            obj.event_title = _event_title;
            obj.event_content = _event_content;
            obj.start_date = _start_date;
            obj.end_date = _end_date;
            objList.event_calendar.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _event_title, string _event_content, DateTime _start_date, DateTime _end_date)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            var obj = objList.event_calendar.Single(x => x.event_id == _id);
            obj.event_title = _event_title;
            obj.event_content = _event_content;
            obj.start_date = _start_date;
            obj.end_date = _end_date;
            objList.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _id)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            var obj = objList.event_calendar.Single(x => x.event_id == _id);
            objList.event_calendar.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

}