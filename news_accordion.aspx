<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_accordion.aspx.cs" Inherits="news_accordion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="scripts/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="scripts/themes/base/jquery.ui.accordion.css" rel="stylesheet" />
    <script src="scripts/jquery-1.10.2.js"></script>
    <script src="scripts/ui/jquery.ui.core.js"></script>
    <script src="scripts/ui/jquery.ui.widget.js"></script>
    <script src="scripts/ui/jquery.ui.accordion.js"></script>
    <script>
    	    $(function () {
    	        $("#news_accordion").accordion({
    	            heightStyle: "fill",
                    icons: null
    	        });
    	    });
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="news_accordion">
        <asp:Literal ID="ltl_news_accordion" runat="server" />
<%--	<h3>Section 3</h3>
	<div>
		Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
		Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
		ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
		lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
	</div>
	<h3>Section 4</h3>
	<div>
		Cras dictum. Pellentesque habitant morbi tristique senectus et netus
		et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
		faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
		mauris vel est.
	</div>
	<h3>Section 5</h3>
	<div>
		Cras dictum. Pellentesque habitant morbi tristique senectus et netus
		et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
		faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
		mauris vel est.
	</div>--%>
     </div>       
    </form>
</body>
</html>
