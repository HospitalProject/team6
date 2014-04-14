<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_event_calendar.aspx.cs" Inherits="administrative_admin_event_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
<div>
    <asp:Label ID="lbl" runat="server" Text="Insert a record" />
        <br />
        <table>
            <tr>
                <td><asp:Label ID="lbl_event_titleI" runat="server" Text="Event Title:" /></td>
                <td>
                    <asp:TextBox ID="txt_event_titleI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_event_titleI" runat="server" Text="*Required" ControlToValidate="txt_event_titleI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_event_contentI" runat="server" Text="Description: " /></td>
                <td>
                    <asp:TextBox ID="txt_event_contentI" runat="server" TextMode="MultiLine" Wrap="true" />
                    <asp:RequiredFieldValidator ID="rfv_event_contentI" runat="server" Text="*Required" ControlToValidate="txt_event_contentI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_dateI" runat="server" Text="Date: " /></td>
                <td>
                    <asp:TextBox ID="txt_dateI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_dateI" runat="server" Text="*Required" ControlToValidate="txt_dateI" ValidationGroup="insert" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="rev_dateI" runat="server" ErrorMessage="Not a date" ControlToValidate="txt_dateI" 
                    ValidationExpression="^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$"
                    />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_start_timeI" runat="server" Text="Start Time: " /></td>
                <td>
                    <asp:TextBox ID="txt_start_timeI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_start_timeI" runat="server" Text="*Required" ControlToValidate="txt_start_timeI" ValidationGroup="insert" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="rev_start_timeI" runat="server" ErrorMessage="Not a time" ControlToValidate="txt_start_timeI" 
                    ValidationExpression="^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$ " />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_end_timeI" runat="server" Text="End Time: " /></td>
                <td>
                    <asp:TextBox ID="txt_end_timeI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_end_timeI" runat="server" Text="*Required" ControlToValidate="txt_end_timeI" ValidationGroup="insert" SetFocusOnError="true" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="rev_end_time" runat="server" ErrorMessage="Not a time" ControlToValidate="txt_end_timeI" 
                    ValidationExpression="^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$ " />
                </td>
            </tr>
        </table>
        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" />
        <br />
        <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <table>
            <tr>
                <th>Event Id</th>
                <th>Event Title</th>
                <th>Description</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Option</th>
            </tr>
        </table>
        <table>
            <asp:DataList ID="dtl_all" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Bind("event_id") %>' />
                            <asp:TextBox ID="txt_event_titleE" runat="server" Text='<%#Bind("event_title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_event_contentE" runat="server" Text='<%#Bind("event_content") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind("date") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_start_timeE" runat="server" Text='<%#Bind("start_time") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_end_timeE" runat="server" Text='<%#Bind("end_time") %>' />
                        </td>
                        <td>
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>
    </div>
</asp:Content>


