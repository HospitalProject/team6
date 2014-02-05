<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link href="Theme/IndexStyleSheet.css" rel="stylesheet" media="screen" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">

    <div id="content_index">
        
        <asp:Label ID="lbl_index" runat="server" Text="<h1>THIS IS THE CONTENT SECTION</h1>" />
        
    </div>

</asp:Content>


