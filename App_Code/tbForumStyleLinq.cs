using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;


public class tbForumStyleLinq
{
    public IQueryable<tb_forum_style> getTbForumStyle()
    {
        linqTbForumStyleDataContext obj = new linqTbForumStyleDataContext();
        var list = obj.tb_forum_style.Select(x => x);
        return list;
    }

    public IQueryable<tb_forum_style> getTbForumStyleByStyle(string _style)
    {
        linqTbForumStyleDataContext obj = new linqTbForumStyleDataContext();
        var list = obj.tb_forum_style.Where(x => x.forum_style == _style).Select(x => x);
        return list;
    }
    /*
    public bool commitInsert(int _forumid, int _styleid, string _title, string _contents, DateTime _dates, Guid _authorid, int _first_forum)
    {
        linqTbSubForumsDataContext objList = new linqTbSubForumsDataContext();
        using (objList)
        {
            tb_Sub_forums obj = new tb_Sub_forums();
            obj.forumid = _forumid;
            obj.styleid = _styleid;
            obj.title = _title;
            obj.contents = _contents;
            obj.dates = _dates;
            obj.authorid = _authorid;
            obj.first_forum = _first_forum;
            objList.tb_Sub_forums.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, int _forumid, int _styleid, string _title, string _contents, DateTime _dates, Guid _authorid, int _first_forum)
    {
        linqTbSubForumsDataContext objList = new linqTbSubForumsDataContext();
        using (objList)
        {
            var obj = objList.tb_Sub_forums.Single(x => x.id == _id);
            obj.forumid = _forumid;
            obj.styleid = _styleid;
            obj.title = _title;
            obj.contents = _contents;
            obj.dates = _dates;
            obj.authorid = _authorid;
            obj.first_forum = _first_forum;
            objList.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _id)
    {
        linqTbSubForumsDataContext objList = new linqTbSubForumsDataContext();
        using (objList)
        {
            var obj = objList.tb_Sub_forums.Single(x => x.id == _id);
            objList.tb_Sub_forums.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
     * */
}