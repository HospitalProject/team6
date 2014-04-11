<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="visitors_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div>
        <asp:Calendar ID="Calendar1" runat="server" Width="400px" Height="300px" ondayrender="MyDayRenderer" OnSelectionChanged="Calender1_SelectionChanged" />
        <br />
        <asp:Label ID="lbl_output" runat="server" />
        <br />
        <div id="gridview" style="float:left;width:50%">
            <asp:GridView ID="grv_main" runat="server" BorderStyle="Solid" AllowSorting="True" DataKeyNames="event_id" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="event_id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                    <asp:BoundField DataField="event_title" HeaderText="Event Title" />
                    <asp:BoundField DataField="event_content" HeaderText="Event Content" />
                    <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="Start Date" />
                    <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="End Date" />
                </Columns>
            </asp:GridView>   
        </div>
    </div>
</asp:Content>


