using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;//所有用到session["userId"]的地方
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class PublishForum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindDatasOptionStyle(DropDownList1); //显示论坛类型信息
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('Please input the comment's title and content')</script>");
            return;
        }
        else
        {
            //判断输入的验证码是否正确
            string num = this.TextBox3.Text.Trim();
            if (Session["ValidNums"].ToString() == num.ToUpper())
            {
                // 连接数据库
                SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString);
                sqlcon.Open();
                // 向主表中插入数据信息
                string StrInsert = "insert into tb_forums(title,dates,authorid,hf_nums) values(@title,@dates,@authorid,0)";
                SqlCommand cmd = new SqlCommand(StrInsert, sqlcon);
                // 添加参数并且设置参数值
                cmd.Parameters.Add("@title", SqlDbType.VarChar);
                cmd.Parameters["@title"].Value = this.TextBox1.Text.ToString();
                cmd.Parameters.Add("@dates", SqlDbType.VarChar, 50);
                cmd.Parameters["@dates"].Value = DateTime.Now.ToString();
                cmd.Parameters.Add("@authorid", SqlDbType.VarChar);
                //cmd.Parameters["@authorid"].Value = Session["userid"].ToString();
                cmd.Parameters["@authorid"].Value = ((MasterPage)this.Master).getCurrentUserId().ToString();
                // 执行插入数据的操作
                cmd.ExecuteNonQuery();
                //获取主表中的编号
                string strselect1 = "select * from tb_forums where title='" + TextBox1.Text.Trim() + "'";
                SqlCommand sqlcmd1 = new SqlCommand(strselect1, sqlcon);
                SqlDataReader dr1 = sqlcmd1.ExecuteReader();
                if (dr1.Read())
                {
                    Session["forumid"] = dr1["id"].ToString();
                }
                dr1.Close();
                //向子表中插入数据
                string StrInserts = "insert into tb_Sub_forums(forumid,styleid,title,contents,dates,authorid,first_forum) values(@forumid,@styleid,@title,@contents,@dates,@authorid,1)";
                SqlCommand cmds = new SqlCommand(StrInserts, sqlcon);
                // 添加参数并且设置参数值
                cmds.Parameters.Add("@forumid", SqlDbType.VarChar);
                cmds.Parameters["@forumid"].Value = Session["forumid"].ToString();
                cmds.Parameters.Add("@styleid", SqlDbType.VarChar);
                cmds.Parameters["@styleid"].Value = GetStyleId(DropDownList1.Text).ToString();
                cmds.Parameters.Add("@title", SqlDbType.VarChar);
                cmds.Parameters["@title"].Value = this.TextBox1.Text.ToString();
                cmds.Parameters.Add("@contents", SqlDbType.VarChar);
                cmds.Parameters["@contents"].Value = this.TextBox2.Text.ToString();
                cmds.Parameters.Add("@dates", SqlDbType.VarChar, 50);
                cmds.Parameters["@dates"].Value = DateTime.Now.ToString();
                cmds.Parameters.Add("@authorid", SqlDbType.VarChar);
                cmds.Parameters["@authorid"].Value = ((MasterPage)this.Master).getCurrentUserId().ToString();
                // 执行插入数据的操作
                cmds.ExecuteNonQuery();
                sqlcon.Close();
                this.Page.RegisterStartupScript("ss", "<script>alert('Posted successfully!')</script>");
                Response.Redirect("forumInfos.aspx");
            }
            else
            {
                this.Page.RegisterStartupScript("ss", "<script>alert('You entered a wrong captcha!')</script>");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("forumInfos.aspx");
    }
    /// <summary>
    /// 获得论坛类型编号
    /// </summary>
    /// <param name="instr">类型名称</param>
    /// <returns>返回类型编号</returns>
    public int GetStyleId(string instr)
    {
        int Numsid = 0;
        if (instr == "")
        {
            Numsid = 1;
        }
        else
        {
            SqlConnection sqlcons = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString);
            sqlcons.Open();
            SqlDataAdapter adsas = new SqlDataAdapter("select id,forum_style from tb_forum_style where forum_style='" + instr + "'", sqlcons);
            DataSet addss = new DataSet();
            adsas.Fill(addss);
            if (addss.Tables[0].Rows.Count > 0)
            {
                Numsid = Convert.ToInt32(addss.Tables[0].Rows[0][0].ToString());
            }
            sqlcons.Close();
        }
        return Numsid;
    }
    /// <summary>
    /// 绑定论坛类型
    /// </summary>
    /// <param name="droplist">DropDownList控件名称</param>
    public void BindDatasOptionStyle(DropDownList droplist)
    {
        SqlConnection sqlcons = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString);
        sqlcons.Open();
        SqlDataAdapter adsas = new SqlDataAdapter("select id,forum_style from tb_forum_style order by id", sqlcons);
        DataSet addss = new DataSet();
        adsas.Fill(addss);
        droplist.Items.Clear();
        if (addss.Tables[0].Rows.Count > 0)
        {
            droplist.Items.Add("");
            for (int i = 0; i < addss.Tables[0].Rows.Count; i++)
            {
                droplist.Items.Add(addss.Tables[0].Rows[i][1].ToString());
            }
        }
        sqlcons.Close();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
