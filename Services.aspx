<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="_services" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <script src="scripts/ui.tabs.jquery.json"></script>
     
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">

    <%-- Ben: The following ticker area is for the news ticker--%>
    <div id="tabs">
            <%-- the ul following is for the scrolled news ticker, using the webticker plugin --%>
            <ul id="tabs">

            </ul>
        <%-- get the ticker news item from the RSS feed (dynamically created), re-check the rss feed every 1 minute --%>
        <script>
            $(function () {
                $("#tabs").tabs({
                    beforeLoad: function (event, ui) {
                        ui.jqXHR.error(function () {
                            ui.panel.html(
                            "Couldn't load this tab. We'll try to fix this as soon as possible. "
                            );
                        });
                    }
                });
            });
</script>
    </div>
    <%-- Ben: end of the news ticker --%>
    <div id="home_slideshow">
        <asp:ScriptManager ID="scm_main" runat="server" />
        <asp:UpdatePanel ID="upd_main" runat="server">
            <ContentTemplate>
                <asp:Label ID="lbl_timer" runat="server"  />
                <asp:Timer ID="tmr_main" runat="server" Interval="3000" OnTick="subTick" />
           

                <asp:Image ID="img_slider" runat="server" Width="797px" Height="260px" />
                <br />

                <asp:Label ID="lbl_slider" runat="server" /><br />
                <asp:Button ID="btn_slide" runat="server" Text="Stop" Font-Bold="true" CssClass="btnslider" OnClick="Btn_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        
    </div>
    
    <div id ="home_welcome">
        <asp:Literal ID="ltl_welcome" runat="server" Mode="PassThrough" Text="<h1>WELCOME</h1>" />
        <h5>The community of Nipigon is located at the cross roads of Highway 11/17. We are minutes away from beautiful
            Lake Superior, rugged Lake Nipigon, and famous Nipigon River. Nipigon District Memorial Hospital opened its
            current site in 1992 serving the catchment area in Acute , Emergency and Long Term care services.</h5>
    </div>

</asp:Content>


