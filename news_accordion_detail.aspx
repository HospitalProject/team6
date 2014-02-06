<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_accordion_detail.aspx.cs" Inherits="news_accordion_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div class="accordion_news_detail">
         <asp:FormView ID="frm_accordion_news" runat="server">
            <ItemTemplate>
                <h1><%#Eval("an_title") %></h1>
                <p class="an_posttime"><span>Posted: <%#Eval("an_postedtime", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></span> <span>   |    Last Updated: <%#Eval("an_lastupdate", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></span></p>
                <div><asp:Image ID="img_newsimageV" runat="server" CssClass="an_img" /></div>
                <div class="an_content"><%#Eval("an_content").ToString().Replace(((char)13).ToString(), "<br />") %></div>
            </ItemTemplate>
        </asp:FormView>       
    </div>
    </form>
</body>
</html>
