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
                        <asp:TemplateField HeaderText="Event Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("event_title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("event_content") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,9) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Time">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("start_time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="End Time">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("end_time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>   
            </div>
    </div>
</asp:Content>


