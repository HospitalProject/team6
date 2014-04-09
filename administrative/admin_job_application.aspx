<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_job_application.aspx.cs" Inherits="administrative_admin_job_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">

        <p>Manage Job Applications</p><br />
            <table border="1">
                <thead>
                    <tr>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_ID" runat="server" Text="ID" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_email" runat="server" Text="Email" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_phone" runat="server" Text="Phone Number" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_city" runat="server" Text="City" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_job_type" runat="server" Text="Job Name" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_way_find_us" runat="server" Text="Way to find us" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_recieveInfo" runat="server" Text="Recieve Info" />
                        </th>
                        <th align="center" style="width:100px">
                            <asp:Label ID="lbl_resume" runat="server" Text="Resume" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_main" runat="server">
                        <itemtemplate>
                            <tr>
                                <td><%#Eval("Id") %></td>
                                <td><%#Eval("firstname") %></td>
                                <td><%#Eval("lastname") %></td>
                                <td><%#Eval("email") %></td>
                                <td><%#Eval("phone") %></td>
                                <td><%#Eval("city") %></td>
                                <td><%#Eval("job_type") %></td>
                                <td><%#Eval("way_find_us") %></td>
                                <td><%#Eval("recieveInfo") %></td>
                                <td><asp:LinkButton ID="lkb_select" runat="server" Text="Download Resume" CommandArgument='<%#Eval("Id") %>' OnCommand="Button1_Click" /></td>
                            </tr>
                        </itemtemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        

        <br />


</asp:Content>
