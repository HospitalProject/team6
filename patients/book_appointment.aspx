<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="book_appointment.aspx.cs" Inherits="book_appointment" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <asp:Panel ID="pnl_appointmentlist" runat="server">
        <asp:Menu ID="mnu_myappointment" runat="server" StaticDisplayLevels="1" Orientation="Horizontal" OnMenuItemClick="mnu_myappointment_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Active" />
                <asp:MenuItem Text="Archived" />
            </Items>
        </asp:Menu>
        <asp:MultiView ID="mtv_myappointment" runat="server" ActiveViewIndex="0">
            <asp:View ID="vw_activeappointment" runat="server">
                <asp:Repeater ID="rpt_activeappointment" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Doctor</th>
                                <th>&nbsp;</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td><%# (DateTime.Parse(Eval("available_date").ToString())).ToString("MMMM dd, yyyy") %></td>
                                <td><%# (DateTime.Parse(Eval("available_starttime").ToString())).ToString("HH:mm") + " - " + (DateTime.Parse(Eval("available_endtime").ToString())).ToString("HH:mm") %></td>
                                <td><%# Eval("DoctorFirstName") + " " + Eval("DoctorLastName") %></td>
                                <td><asp:LinkButton runat="server" ID="lkb_cancelappointment" OnCommand="subCancelAppointment" Text="Cancel appointment" CommandArgument='<%# Eval("appointment_id") %>' OnClientClick="return confirm('Confirm cancel?');" /></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:View>
            <asp:View ID="vw_archivedappointment" runat="server">
                <asp:Repeater ID="rpt_archivedappointment" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Doctor</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td><%# (DateTime.Parse(Eval("available_date").ToString())).ToString("MMMM dd, yyyy") %></td>
                                <td><%# (DateTime.Parse(Eval("available_starttime").ToString())).ToString("HH:mm") + " - " + (DateTime.Parse(Eval("available_endtime").ToString())).ToString("HH:mm") %></td>
                                <td><%# Eval("DoctorFirstName") + " " + Eval("DoctorLastName") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:View>
        </asp:MultiView>
        <br />
        <asp:Button ID="btn_makeappointment" runat="server" Text="Make a new appointment" OnClick="btn_makeappointment_Click" />
    </asp:Panel>
    <asp:Panel ID="pnl_makeappointment" runat="server" Visible="false">
        <asp:Label ID="lbl_bookappointment" runat="server" Text="Book a new appointment" />
        <br />
        <br />
        <table>
            <tr>
                <td>
                    Doctor:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_doctorlist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_doctorlist_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Date:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_availabledate" runat="server" OnSelectedIndexChanged="ddl_availabledate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Time slot:
                </td>
                <td>
                    <asp:CheckBoxList ID="cbl_timeslot" runat="server"></asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_submitAppointment" runat="server" Text="Submit" OnClick="btn_submitAppointment_Click" />
        &nbsp;
        <asp:Button ID="btn_cancelSubmitAppointment" runat="server" Text="Cancel" OnClick="btn_cancelSubmitAppointment_Click" />
    </asp:Panel>
</asp:Content>



