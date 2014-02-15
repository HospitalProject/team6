<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link href="Theme/IndexStyleSheet.css" rel="stylesheet" media="screen" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    
    <div id="home_slideshow">
          <asp:ScriptManager ID="scm_main" runat="server" />
        <asp:UpdatePanel ID="upd_main" runat="server">
            <ContentTemplate>
                <asp:Label ID="lbl_timer" runat="server"  />
                <asp:Timer ID="tmr_main" runat="server" Interval="5000" OnTick="subTick" />
           

        <asp:Image ID="img_slider" runat="server" Width="797px" Height="250px" />
                <br />
                <asp:Label ID="lbl_slider" runat="server" />
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


