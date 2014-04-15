<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_job_application.aspx.cs" Inherits="administrative_admin_job_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    
.Rep_tab{
width:100%;
margin: 0px auto;
font: Georgia 11px;
font-size: 12px;
font-family: Tahoma, Arial, Helvetica, Sans-serif, Times New Roman;
color:#333333;
text-align:center;
vertical-align:middle;
border-collapse:collapse;
}

/* Repeater - Table - td style */
.Rep_tab td {
border:1px solid #4d9ab0;
height:25px;
}
/* Repeater - Table - caption style */
.Rep_tab caption {
text-align:center;
font-size:12px;
font-weight:bold;
margin: 0 auto;}

/* Repeater - Table - TR - odd row style */
.Rep_Tab_OddTr{
background-color:#f8fbfc;
color:#000000;
height:25px;
}
/* Repeater - Table - TR - even row style */
.Rep_Tab_EvenTr{
background-color:#e5f1f4;
color:#000000;
height:25px;
}
.Rep_Tab_HeaderTr{
background-color:#ffffee;
color:#000000;
}
/*cursor move color*/
.Rep_Tr_Move
{
	background-color:#ecfbd4;
	color:#000000;
	height:25px;}
/* cursor click color*/
.Rep_Tr_Click{
background-color:#bce774;
color:#333333;
height:25px;}
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <script src="../scripts/JSCommon.js" type="text/javascript" />
    <h2>Manage Job Applications</h2>
    <div style="width:800px">   
            <asp:Repeater ID="rpt_main" runat="server">
                <HeaderTemplate>
                    <table id="Tab" class="Rep_tab">
                        <tr>
                            <th style="width:120px">
                            <asp:Label ID="lbl_ID" runat="server" Text="ID" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_email" runat="server" Text="Email" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_phone" runat="server" Text="Phone Number" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_city" runat="server" Text="City" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_job_type" runat="server" Text="Job Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_way_find_us" runat="server" Text="Way to find us" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_recieveInfo" runat="server" Text="Recieve Info" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_resume" runat="server" Text="Resume" />
                        </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
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
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div style="width:80%"></div>   
        </div>

        <br />
            <script type="text/javascript" language="javascript">
                window.onload = SetTableColor("Tab");
    </script>


</asp:Content>
