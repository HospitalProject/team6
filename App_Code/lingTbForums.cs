using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
///CareersApplicationClass 的摘要说明
/// </summary>
public class lingTbForms
{
    public IQueryable<tb_forums> getTbForums()
    {
        tbforumsLinqDataContext obj = new tbforumsLinqDataContext();
        var list = obj.tb_forums.Select(x => x);
        return list;
    }

    public IQueryable<tb_forums> getTbForumsById(int _id)
    {
        tbforumsLinqDataContext obj = new tbforumsLinqDataContext();
        var list = obj.tb_forums.Where(x => x.id == _id).Select(x => x);
        return list;
    }

    public IQueryable<tb_forums> getTbForumsByTitle(string _title)
    {
        tbforumsLinqDataContext obj = new tbforumsLinqDataContext();
        var list = obj.tb_forums.Where(x => x.title == _title).Select(x => x);
        return list;
    }

    public bool commitInsert(string _title, DateTime _dates, Guid _authorid, int _hf_nums)
    {
        tbforumsLinqDataContext objList = new tbforumsLinqDataContext();
        using (objList)
        {
            tb_forums obj = new tb_forums();
            obj.title = _title;
            obj.dates = _dates;
            obj.authorid = _authorid;
            obj.hf_nums = _hf_nums;
            objList.tb_forums.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, int _hf_nums)
    {
        tbforumsLinqDataContext objList = new tbforumsLinqDataContext();
        using (objList)
        {
            var obj = objList.tb_forums.Single(x => x.id == _id);
            obj.hf_nums = _hf_nums;
            objList.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _id)
    {
        tbforumsLinqDataContext objList = new tbforumsLinqDataContext();
        using (objList)
        {
            var obj = objList.tb_forums.Single(x => x.id == _id);
            objList.tb_forums.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
}