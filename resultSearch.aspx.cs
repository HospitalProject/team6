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

        else if ((objLinqSE.getContentBySearch(keyword).Count() == 0))
        {
            label1.Text = "No result found of "+ keyword +", please try again";
        }

        else
        {
            int searchCount = objLinqSE.getContentBySearch(keyword).Count();
            label1.Text = searchCount + " result(s) of " + keyword + " found";
            dtlSearch.DataSource = objLinqSE.getContentBySearch(keyword); 
            dtlSearch.DataBind();
        }

    }
}