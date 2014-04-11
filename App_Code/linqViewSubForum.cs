using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;


public class linqViewSubForum
{
    public IQueryable<View_SubForum> getSubForum()
    {
        linqViewSubForumDataContext obj = new linqViewSubForumDataContext();
        var list = obj.View_SubForum.Select(x => x);
        return list;
    }

    public IQueryable<View_SubForum> getSubForumByID(int _id)
    {
        linqViewSubForumDataContext obj = new linqViewSubForumDataContext();
        var list = obj.View_SubForum.Where(x => x.forumid == _id).Select(x => x);
        return list;
    }

}