using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resultSearch : System.Web.UI.Page
{
    linqSearchengine objLinqSE = new linqSearchengine();
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyword = Session["search"].ToString();
        

        if (string.IsNullOrEmpty(keyword))
        {
            label1.Text = "No keywords entered, please try again";
        }

        //else if (SearchID == 0)
        //{
           //label1.Text = "No result found";
        //}

        else
        {
            label1.Text = "The fowllowing are the results of " + keyword;
            dtlSearch.DataSource = objLinqSE.getContentBySearch(keyword); 
            dtlSearch.DataBind();
        }

    }
}