using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news_accordion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strNewsAccordionContent = string.Empty;
        string strAnTitle = string.Empty;
        string strAnContent = string.Empty;
        linqNewsAccordion objAccordionNews = new linqNewsAccordion();

        var objRecentNews = objAccordionNews.getRecentNewsAccordion();
        foreach (var objNews in objRecentNews)
        {
            strAnTitle = objNews.an_title.ToString();
            strAnContent = objNews.an_content.ToString();
            strNewsAccordionContent += "<h3>" + strAnTitle.Substring(0, strAnTitle.Length > 15 ? 15 : strAnTitle.Length) + (strAnTitle.Length > 15 ? "..." : "") + "</h3>";
            strNewsAccordionContent += "<div>" + strAnContent.Substring(0, strAnContent.Length > 200 ? 200 : strAnContent.Length) + (strAnContent.Length > 200 ? "..." : "") + "<br /><br />";
            strNewsAccordionContent += "<a href='news_accordion_detail.aspx?an_id=" + objNews.an_id + "'>Read full story</a></div>";
        }

        ltl_news_accordion.Text = strNewsAccordionContent;
    }
}