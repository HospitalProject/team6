<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_message_board.aspx.cs" Inherits="administrative_admin_message_board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
        <table>
            <tr>
                <td><asp:Label ID="lbl_No" runat="server" Text="No." Font-Bold="true" /></td>
                <td><asp:Label ID="lbl_title" runat="server" Text="Title" Font-Bold="true" /></td>
                <td><asp:Label ID="lbl_category" runat="server" Text="Category" Font-Bold="true" /></td>
                <td><asp:Label ID="lbl_user" runat="server" Text="User" Font-Bold="true" /></td>
                <td><asp:Label ID="lbl_publish_date" runat="server" Text="Publish Date" Font-Bold="true" /></td>
            </tr>
            <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subAdmin">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="hdf_id" runat="server" Value='<%#Eval("id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_title" runat="server" Text='<%#Bind("title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_forum_style" runat="server" Text='<%#Bind("forum_style") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_fname" runat="server" Text='<%#Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_date" runat="server" Text='<%#Bind("Dates") %>' />
                        </td>
                        <td>
                            <asp:Button ID="btn_del" runat="server" Text="Delete" CommandName="del" CommandArgument = '<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete?')" CausesValidation="false" /></td>
                        </td>
                    </tr>
                </ItemTemplate>
        </asp:ListView>
    </table>
    <br />
    <asp:Label ID="lbl_msg" runat="server" />

</asp:Content>


