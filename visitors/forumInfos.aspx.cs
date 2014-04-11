using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security; //所有用到session["userId"]的地方
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class forumInfos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDatas();
        }
    }
    /// <summary>
    /// 加载数据，在GridView控件中显示数据信息
    /// </summary>
    private void LoadDatas()
    {
        forumInfosLinq f = new forumInfosLinq();
        GridView1.DataSource = f.getForumInfos();
        GridView1.DataBind();
        GridView1.DataKeyNames = new string[] { "id" };
        // Label1.Text = "用户名称： " + Session["username"].ToString();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        LoadDatas();
        //评论编号
        int ids = Convert.ToInt32(GridView1.Rows[e.NewSelectedIndex].Cells[0].Text);
        //回复数量
        Session["nums"] = GridView1.Rows[e.NewSelectedIndex].Cells[5].Text;
        //评论标题
        Session["strtitle"] = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
        //评论类型编号
        Session["forumstyle"] = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
        Response.Redirect("ForumList.aspx?id=" + ids + "");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadDatas();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PublishForum.aspx");

    }
}
