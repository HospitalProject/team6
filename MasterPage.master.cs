using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string _title = "Welcome To Nipigon District Memorial Hospital";
    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            initAccordionNews();
        }
    }

    //initial the accordion news content
    private void initAccordionNews()
    {
        int MAXTITLEWORDS = 15;
        int MAXCONTENTWORDS = 300;
        int i = 0; //the order of the accordion
        string strNewsAccordionContent = string.Empty;
        string strAnTitle = string.Empty;
        string strAnContent = string.Empty;
        linqNewsAccordion objAccordionNews = new linqNewsAccordion();

        var objRecentNews = objAccordionNews.getRecentNewsAccordion();
        foreach (var objNews in objRecentNews)
        {
            strAnTitle = objNews.an_title.ToString();
            strAnContent = objNews.an_content.ToString();
            strNewsAccordionContent += "<h3>" + strAnTitle.Substring(0, strAnTitle.Length > MAXTITLEWORDS ? MAXTITLEWORDS : strAnTitle.Length) + (strAnTitle.Length > MAXTITLEWORDS ? "..." : "") + "</h3>";
            strNewsAccordionContent += "<div>" + strAnContent.Substring(0, strAnContent.Length > MAXCONTENTWORDS ? MAXCONTENTWORDS : strAnContent.Length) + (strAnContent.Length > MAXCONTENTWORDS ? "..." : "") + "<br /><br />";
            strNewsAccordionContent += "<a href='news_accordion_detail_view.aspx?accordionid=" + i + "&an_id=" + objNews.an_id + "'>Read full story</a></div>";
            i++;
        }

        ltl_news_accordion.Text = strNewsAccordionContent;
    
    }

}
