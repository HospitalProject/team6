<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Careers_list.aspx.cs" Inherits="Careers_list" %>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div>
        <asp:Panel ID="pnl_careers_list" runat="server" GroupingText="Careers List">
            <div>
                <a href="Careers_applications.aspx">Apply Now !</a>
            </div>
            <br />
            <div id="gridview" style="float:left;width:50%">
                <asp:GridView ID="grv_main" runat="server" DataSourceID="sds_all" AllowSorting="True" DataKeyNames="Id" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" InsertVisible="False" SortExpression="Id" />
                        <asp:BoundField DataField="job_title" HeaderText="job_title" SortExpression="job_title" />
                        <asp:BoundField DataField="job_type" HeaderText="job_type" SortExpression="job_type" />
                        <asp:BoundField DataField="job_description" HeaderText="job_description" SortExpression="job_description" />
                        <asp:BoundField DataField="requirements" HeaderText="requirements" SortExpression="requirements" />
                        <asp:BoundField DataField="recruiting_num" HeaderText="recruiting_num" SortExpression="recruiting_num" />
                        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                        <asp:BoundField DataField="deadline" HeaderText="deadline" SortExpression="deadline" />
                    </Columns>
                </asp:GridView>   
            </div>
            <asp:SqlDataSource ID="sds_all" runat="server" ConnectionString="<%$ ConnectionStrings:DB_69755_aspclassConnectionString %>" SelectCommand="SELECT * FROM [careers_list]" />
        </asp:Panel>
    </div>

</asp:Content>


