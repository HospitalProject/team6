using System;
using System.Collections;
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

public partial class ForumList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label7.Text = Session["strtitle"].ToString();          //显示发帖标题信息
            Label8.Text = Session["nums"].ToString();              //显示回复数量信息
            //显示发帖内容及回复信息
            string _connString = WebConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(_connString);
            sqlcon.Open();
            string strsqls = "select * from View_SubForum where forumid=" + Convert.ToInt32(Request["id"].ToString()) + " order by id";
            SqlDataAdapter adsa = new SqlDataAdapter(strsqls, sqlcon);
            DataSet adds = new DataSet();
            adsa.Fill(adds);
            if (adds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = adds;
                DataList1.DataBind();
            }
            sqlcon.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "" || TextBox4.Text == "")
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('Please input the title and the content.')</script>");
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
                //获得回复数量
                string strselect1 = "select * from tb_forums where id='" + Request["id"].ToString() + "'";
                SqlCommand sqlcmd1 = new SqlCommand(strselect1, sqlcon);
                SqlDataReader dr1 = sqlcmd1.ExecuteReader();
                int hfnums = 0;
                if (dr1.Read())
                {
                    hfnums = Convert.ToInt32(dr1["hf_nums"].ToString()) + 1;
                }
                dr1.Close();
                //更改主表中的回复数量
                string Strupdate = "update tb_forums set hf_nums=" + hfnums + " where id='" + Request["id"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(Strupdate, sqlcon);
                cmd.ExecuteNonQuery();
                //向子表中插入数据
                string StrInserts = "insert into tb_Sub_forums(forumid,styleid,title,contents,dates,authorid,first_forum) values(@forumid,@styleid,@title,@contents,@dates,@authorid,0)";
                SqlCommand cmds = new SqlCommand(StrInserts, sqlcon);
                // 添加参数并且设置参数值
                cmds.Parameters.Add("@forumid", SqlDbType.VarChar);
                cmds.Parameters["@forumid"].Value = Request["id"].ToString();
                cmds.Parameters.Add("@styleid", SqlDbType.VarChar);
                cmds.Parameters["@styleid"].Value = GetStyleId(Session["forumstyle"].ToString()).ToString();
                cmds.Parameters.Add("@title", SqlDbType.VarChar);
                cmds.Parameters["@title"].Value = this.TextBox4.Text.ToString();
                cmds.Parameters.Add("@contents", SqlDbType.VarChar);
                cmds.Parameters["@contents"].Value = this.TextBox2.Text.ToString();
                cmds.Parameters.Add("@dates", SqlDbType.VarChar, 50);
                cmds.Parameters["@dates"].Value = DateTime.Now.ToString();
                cmds.Parameters.Add("@authorid", SqlDbType.VarChar);
                cmds.Parameters["@authorid"].Value = ((MasterPage)this.Master).getCurrentUserId().ToString();
                // 执行插入数据的操作
                cmds.ExecuteNonQuery();
                sqlcon.Close();
                this.Page.RegisterStartupScript("ss", "<script>alert('Replied successfully!')</script>");
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox4.Focus();
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
}
