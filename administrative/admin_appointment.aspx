<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_appointment" %>

<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminUsers.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <AJAX:ToolkitScriptManager ID="tsm_users" runat="server" />
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
                        <asp:LinkButton ID="lkb_viewAppointment" runat="server" Text="View appointments" CommandArgument='<%# Eval("UserId")%>' CommandName="ViewAppointment" OnCommand="subAdmin" />
                    </td>
                    <td class="tabContent">
                        <asp:LinkButton ID="lkb_viewTimeSlot" runat="server" Text="Time slots" CommandArgument='<%# Eval("UserId")%>'  CommandName="ViewTimeslot" OnCommand="subAdmin"  />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="pnl_appointments" runat="server" Visible="false">
        <asp:Menu ID="mnu_appointment" runat="server" StaticDisplayLevels="1" Orientation="Horizontal">
            <Items>
                <asp:MenuItem Text="Active" />
                <asp:MenuItem Text="Archived" />
            </Items>
        </asp:Menu>
        <br />
        <asp:LinkButton ID="lkb_backtodoclist1" runat="server" OnClick="lkb_backtodoclist_Click" Text="Back" />
    </asp:Panel>
    <asp:Panel ID="pnl_timeslot" runat="server" Visible="false">
        <asp:Label ID="lbl_doctimeslot" runat="server" />
        <br />
        <table>
            <tr>
                <td>Date:</td>
                <td><asp:Button ID="btn_addtimeslot" runat="server" Text="Add new available time slot" OnClick="btn_addtimeslot_Click" /></td>
            </tr>
            <tr>
                <td>
                    Time slots:
                </td>
                <td>

                </td>
            </tr>
        </table>
        <asp:LinkButton ID="lkb_backtodoclist2" runat="server" OnClick="lkb_backtodoclist_Click" Text="Back" />
    </asp:Panel>
    <asp:Panel ID="pnl_addtimeslot" runat="server" Visible="false">
        <asp:Label ID="lbl_docaddtimeslot" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    Date:
                </td>
                <td>
                    <asp:TextBox ID="txt_timeslotdate" runat="server" />
                    <AJAX:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_timeslotdate"></AJAX:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Start time:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_starttime" runat="server">
                        <asp:ListItem Text="00:00" Value="00:00" />
                        <asp:ListItem Text="00:30" Value="00:30" />
                        <asp:ListItem Text="01:00" Value="01:00" />
                        <asp:ListItem Text="01:30" Value="01:30" />
                        <asp:ListItem Text="02:00" Value="02:00" />
                        <asp:ListItem Text="02:30" Value="02:30" />
                        <asp:ListItem Text="03:00" Value="03:00" />
                        <asp:ListItem Text="03:30" Value="03:30" />
                        <asp:ListItem Text="04:00" Value="04:00" />
                        <asp:ListItem Text="04:30" Value="04:30" />
                        <asp:ListItem Text="05:00" Value="05:00" />
                        <asp:ListItem Text="05:30" Value="05:30" />
                        <asp:ListItem Text="06:00" Value="06:00" />
                        <asp:ListItem Text="06:30" Value="06:30" />
                        <asp:ListItem Text="07:00" Value="07:00" />
                        <asp:ListItem Text="07:30" Value="07:30" />
                        <asp:ListItem Text="08:00" Value="08:00" />
                        <asp:ListItem Text="08:30" Value="08:30" />
                        <asp:ListItem Text="09:00" Value="09:00" Selected="True" />
                        <asp:ListItem Text="09:30" Value="09:30" />
                        <asp:ListItem Text="10:00" Value="10:00" />
                        <asp:ListItem Text="10:30" Value="10:30" />
                        <asp:ListItem Text="11:00" Value="11:00" />
                        <asp:ListItem Text="11:30" Value="11:30" />
                        <asp:ListItem Text="12:00" Value="12:00" />
                        <asp:ListItem Text="12:30" Value="12:30" />
                        <asp:ListItem Text="13:00" Value="13:00" />
                        <asp:ListItem Text="13:30" Value="13:30" />
                        <asp:ListItem Text="14:00" Value="14:00" />
                        <asp:ListItem Text="14:30" Value="14:30" />
                        <asp:ListItem Text="15:00" Value="15:00" />
                        <asp:ListItem Text="15:30" Value="15:30" />
                        <asp:ListItem Text="16:00" Value="16:00" />
                        <asp:ListItem Text="16:30" Value="16:30" />
                        <asp:ListItem Text="17:00" Value="17:00" />
                        <asp:ListItem Text="17:30" Value="17:30" />
                        <asp:ListItem Text="18:00" Value="18:00" />
                        <asp:ListItem Text="18:30" Value="18:30" />
                        <asp:ListItem Text="19:00" Value="19:00" />
                        <asp:ListItem Text="19:30" Value="19:30" />
                        <asp:ListItem Text="20:00" Value="20:00" />
                        <asp:ListItem Text="20:30" Value="20:30" />
                        <asp:ListItem Text="21:00" Value="21:00" />
                        <asp:ListItem Text="21:30" Value="21:30" />
                        <asp:ListItem Text="22:00" Value="22:00" />
                        <asp:ListItem Text="22:30" Value="22:30" />
                        <asp:ListItem Text="23:00" Value="23:00" />
                        <asp:ListItem Text="23:30" Value="23:30" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Start time:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_endtime" runat="server">
                        <asp:ListItem Text="00:30" Value="00:30" />
                        <asp:ListItem Text="01:00" Value="01:00" />
                        <asp:ListItem Text="01:30" Value="01:30" />
                        <asp:ListItem Text="02:00" Value="02:00" />
                        <asp:ListItem Text="02:30" Value="02:30" />
                        <asp:ListItem Text="03:00" Value="03:00" />
                        <asp:ListItem Text="03:30" Value="03:30" />
                        <asp:ListItem Text="04:00" Value="04:00" />
                        <asp:ListItem Text="04:30" Value="04:30" />
                        <asp:ListItem Text="05:00" Value="05:00" />
                        <asp:ListItem Text="05:30" Value="05:30" />
                        <asp:ListItem Text="06:00" Value="06:00" />
                        <asp:ListItem Text="06:30" Value="06:30" />
                        <asp:ListItem Text="07:00" Value="07:00" />
                        <asp:ListItem Text="07:30" Value="07:30" />
                        <asp:ListItem Text="08:00" Value="08:00" />
                        <asp:ListItem Text="08:30" Value="08:30" />
                        <asp:ListItem Text="09:00" Value="09:00" />
                        <asp:ListItem Text="09:30" Value="09:30" Selected="True" />
                        <asp:ListItem Text="10:00" Value="10:00" />
                        <asp:ListItem Text="10:30" Value="10:30" />
                        <asp:ListItem Text="11:00" Value="11:00" />
                        <asp:ListItem Text="11:30" Value="11:30" />
                        <asp:ListItem Text="12:00" Value="12:00" />
                        <asp:ListItem Text="12:30" Value="12:30" />
                        <asp:ListItem Text="13:00" Value="13:00" />
                        <asp:ListItem Text="13:30" Value="13:30" />
                        <asp:ListItem Text="14:00" Value="14:00" />
                        <asp:ListItem Text="14:30" Value="14:30" />
                        <asp:ListItem Text="15:00" Value="15:00" />
                        <asp:ListItem Text="15:30" Value="15:30" />
                        <asp:ListItem Text="16:00" Value="16:00" />
                        <asp:ListItem Text="16:30" Value="16:30" />
                        <asp:ListItem Text="17:00" Value="17:00" />
                        <asp:ListItem Text="17:30" Value="17:30" />
                        <asp:ListItem Text="18:00" Value="18:00" />
                        <asp:ListItem Text="18:30" Value="18:30" />
                        <asp:ListItem Text="19:00" Value="19:00" />
                        <asp:ListItem Text="19:30" Value="19:30" />
                        <asp:ListItem Text="20:00" Value="20:00" />
                        <asp:ListItem Text="20:30" Value="20:30" />
                        <asp:ListItem Text="21:00" Value="21:00" />
                        <asp:ListItem Text="21:30" Value="21:30" />
                        <asp:ListItem Text="22:00" Value="22:00" />
                        <asp:ListItem Text="22:30" Value="22:30" />
                        <asp:ListItem Text="23:00" Value="23:00" />
                        <asp:ListItem Text="23:30" Value="23:30" />
                        <asp:ListItem Text="24:00" Value="24:00" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btn_savetimeslot" runat="server" Text="Submit" OnClick="btn_savetimeslot_Click" /> <asp:Button ID="btn_cancelsave" runat="server" Text="Cancel" OnClick="btn_cancelsave_Click" /></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

