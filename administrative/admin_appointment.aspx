<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_appointment" %>

<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminUsers.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Panel ID="pnl_doctorList" runat="server">
        <asp:Repeater ID="rpt_doctorlist" runat="server">
            <HeaderTemplate>
                <table>
                    <tr>
                        <th class="tabHead">Name</th>
                        <th class="tabHead">&nbsp;</th>
                        <th class="tabHead">&nbsp;</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tabContent">
                        <asp:Label ID="lbl_doctorName" runat="server" Text='<%# Eval("FirstName") + " " + Eval("LastName")%>' /> 
                    </td>
                    <td class="tabContent">
                        <asp:LinkButton ID="lkb_viewAppointment" runat="server" Text="View appointments" CommandArgument='<%# Eval("UserId")%>' />
                    </td>
                    <td class="tabContent">
                        <asp:LinkButton ID="lkb_viewTimeSlot" runat="server" Text="Time slots" CommandArgument='<%# Eval("UserId")%>' />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
</asp:Content>

