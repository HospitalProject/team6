<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_message_board.aspx.cs" Inherits="administrative_admin_message_board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <h2>Manage Topics</h2>
    <br />
            <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subAdmin" DataKeyNames="id" ItemContainerID="ItemPlaceHolder">
                <LayoutTemplate>
                    <table border="1" style="border-color:#00ff00; border-collapse:collapse" width="500" >
                        <thead>
                            <tr>
                                <td><asp:Label ID="lbl_title" runat="server" Text="Title" Font-Bold="true" /></td>
                                <td><asp:Label ID="lbl_category" runat="server" Text="Category" Font-Bold="true" /></td>
                                <td><asp:Label ID="lbl_user" runat="server" Text="User" Font-Bold="true" /></td>
                                <td><asp:Label ID="lbl_publish_date" runat="server" Text="Publish Date" Font-Bold="true" /></td>
                                <td><asp:Label ID="lbl_option" runat="server" Text="Option" Font-Bold="true" /></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                        </tbody>
                    </table>
                    <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="1">
                        <Fields>    
                            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" 
                            FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous"/>
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("id") %>' />
                            <asp:Label ID="txt_title" runat="server" Text='<%#Bind("title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_forum_style" runat="server" Text='<%#Bind("forum_style") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_fname" runat="server" Text='<%#Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_date" runat="server" Text='<%#Bind("Dates") %>' />
                        </td>
                        <td>
                            <asp:Button ID="btn_del" runat="server" Text="Delete" CommandName="del" CommandArgument = '<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete?')" CausesValidation="false" /></td>
                        </td>
                    </tr>
                </ItemTemplate>
        </asp:ListView>
    <br />
    <asp:Label ID="lbl_msg" runat="server" />

</asp:Content>


