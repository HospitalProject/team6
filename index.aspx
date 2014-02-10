<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link href="Theme/IndexStyleSheet.css" rel="stylesheet" media="screen" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    
    <div id="home_slideshow">
        "This is the section of slide show"
    </div>
    
    <div id ="home_welcome">
        <asp:Literal ID="ltl_welcome" runat="server" Mode="PassThrough" Text="<h1>WELCOME</h1>" />
        <h5>The community of Nipigon is located at the cross roads of Highway 11/17. We are minutes away from beautiful
            Lake Superior, rugged Lake Nipigon, and famous Nipigon River. Nipigon District Memorial Hospital opened its
            current site in 1992 serving the catchment area in Acute , Emergency and Long Term care services.</h5>
    </div>

</asp:Content>


