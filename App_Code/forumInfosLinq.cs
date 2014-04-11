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
public class forumInfosLinq
{
    public IQueryable<View_forum> getForumInfos()
    {
        linqForumInfosDataContext obj = new linqForumInfosDataContext();
        var list = obj.View_forum.Select(x => x);
        return list;
    }

    public IQueryable<View_forum> getForumInfosByID(int _id)
    {
        linqForumInfosDataContext obj = new linqForumInfosDataContext();
        var list = obj.View_forum.Where(x => x.id == _id).Select(x => x);
        return list;
    }

}