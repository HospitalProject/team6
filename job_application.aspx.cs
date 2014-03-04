using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Xml.Linq;
using System.Data;


public partial class job_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            rbl.Items[0].Selected = true;
            rbl_1.Items[4].Selected = true;
            bindDropdownlist();
        }

    }
    protected void bindDropdownlist()
    {
        string _connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(_connString);
        DataSet ds = new DataSet();
        using (conn)
        {
            string sqlstr = "select distinct job_title from Careers_list_Admin";
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlstr, conn);
            sda.Fill(ds);
            ddl_job_type.DataSource = ds;
            ddl_job_type.DataTextField = "job_title";
            //ddl_job_type.DataValueField = "Id";
            ddl_job_type.DataBind();
        }
    }

    protected void subSubmit(object sendor, EventArgs e)
    {
        if (rbl.SelectedValue == "")
        {
            rbl.SelectedIndex = 0;
        }
        if (rbl_1.SelectedValue == "")
        {
            rbl_1.SelectedIndex = 4;
        }

        //upload resume
        string savePath;
        string savePath2;

        string str1 = this.file_upload_resume.PostedFile.FileName;//获取上传文件选择框中的文本内容
        string str2 = this.file_upload_cover_letter.PostedFile.FileName;
        if (str1 == "")
        {
            Response.Write("<script language=javascript>alert('Please choose one file')</script>");
        }
        else if (str2 == "")
        {
            Response.Write("<script language=javascript>alert('Please choose one file')</script>");
        }
        else
        {
            int fileLength = this.file_upload_resume.PostedFile.ContentLength;//获取文件的大小，以字节为单位
            string getName = str1.Substring(str1.LastIndexOf("\\") + 1);//获取文件的名称，包括后缀名
            string exeName = str1.Substring(str1.LastIndexOf(".") + 1).ToUpper();//获取上传文件的后缀名并转换为大写形式，如得到.EXE
            string saveName = DateTime.Now.ToString("yyyymmddhhmmssfff") + "." + exeName;//将文件保存为当前上传时间
            savePath = Server.MapPath(@"\resumes\" + saveName);//设置保存路径（可以把这个值存在数据库中，就可以进行下载了）

            //upload cover_letter
            int fileLength2 = this.file_upload_resume.PostedFile.ContentLength;
            string getName2 = str2.Substring(str2.LastIndexOf("\\") + 1);
            string exeName2 = str2.Substring(str2.LastIndexOf(".") + 1).ToUpper();
            string saveName2 = DateTime.Now.ToString("yyyymmddhhmmssfff") + "." + exeName2;
            savePath2 = Server.MapPath(@"\cover_letters\" + saveName2);

            try
            {
                if ((exeName == "TXT" || exeName == "DOC") && (exeName2 == "TXT" || exeName2 == "DOC"))
                {
                    if (File.Exists(savePath) || File.Exists(savePath2))
                    {
                        Response.Write("<script language=javascript>alert('This file name ia already exist, please rename !')</script>");
                    }
                    else
                    {
                        this.file_upload_resume.PostedFile.SaveAs(savePath);
                        this.file_upload_cover_letter.PostedFile.SaveAs(savePath2);
                        Response.Write("<script>alert('Thank you for applying our hospital !')</script>");
                        //上传的文件地址插入数据库
                        string _connString = WebConfigurationManager.ConnectionStrings["db_connect"].ConnectionString;
                        SqlConnection con2 = new SqlConnection(_connString);
                        con2.Open();
                        SqlCommand cmd2 = new SqlCommand("insert into Careers_applications (firstname,lastname,email,phone,city,job_type,way_find_us,resume,cover_letter,recieveInfo) values('" + txt_fname.Text + "','" + txt_lname.Text + "','" + txt_email.Text + "','" + txt_phone.Text + "','" + txt_city.Text + "','" + ddl_job_type.SelectedItem.Text.ToString() + "','" + rbl_1.SelectedItem.Text.ToString() + "','" + savePath + "','" + savePath2 + "','" + rbl.SelectedItem.Text.ToString() + "')", con2);
                        cmd2.ExecuteNonQuery();
                        //Response.Write("<script>alert('Thank you for applying our hospital !')</script>");
                        //clear output
                        txt_fname.Text = string.Empty;
                        txt_lname.Text = string.Empty;
                        txt_email.Text = string.Empty;
                        txt_phone.Text = string.Empty;
                        txt_city.Text = string.Empty;
                        rbl.SelectedIndex = 0;
                        rbl_1.SelectedIndex = 4;
                        ddl_job_type.SelectedItem.Selected = false;
                        con2.Close();
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Please upload txt or word type')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert(ex.Message.ToString())</script>");
            }

            output.Text = "Thank you for applying our hospital! ";
        }
    }
    protected void upload_resume(object sender, EventArgs e)
    {

    }

    protected void upload_cover_letter(object sender, EventArgs e)
    {

    }

    protected void bindDropdownlist(object sender, EventArgs e)
    {

    }

    protected void subClear(object sendor, EventArgs e)
    {
        output.Text = string.Empty;
        txt_fname.Text = string.Empty;
        txt_lname.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_phone.Text = string.Empty;
        txt_city.Text = string.Empty;
        rbl.SelectedIndex = 0;
        rbl_1.SelectedIndex = 0;
        ddl_job_type.SelectedItem.Selected = false;
    }



}