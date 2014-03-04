<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Careers_list_Admin.aspx.cs" Inherits="Careers_list_Admin" %>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 158px;
        }
        .auto-style5 {
            width: 140px;
        }
        .auto-style6 {
            width: 123px;
        }
        .auto-style7 {
            width: 79px;
        }
        .auto-style11 {
            width: 152px;
        }
        .auto-style12 {
            width: 141px;
        }
        .auto-style13 {
            width: 142px;
        }
    </style>

     <br />
        <asp:Label ID="lbl" runat="server" Text="Insert a record" />
        <br />
        <table>
            <tr>
                <td><asp:Label ID="lbl_job_titleI" runat="server" Text="Job Title:" /></td>
                <td>
                    <asp:TextBox ID="txt_job_titleI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_job_titleI" runat="server" Text="*Required" ControlToValidate="txt_job_titleI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_job_typeI" runat="server" Text="Job Type: " /></td>
                <td>
                    <asp:TextBox ID="txt_job_typeI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_job_typeI" runat="server" Text="*Required" ControlToValidate="txt_job_typeI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_job_descriptionI" runat="server" Text="Description: " /></td>
                <td>
                    <asp:TextBox ID="txt_job_descriptionI" runat="server" TextMode="MultiLine" Wrap="true" />
                    <asp:RequiredFieldValidator ID="rfv_job_descriptionI" runat="server" Text="*Required" ControlToValidate="txt_job_descriptionI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_requirementsI" runat="server" Text="Requirements: " /></td>
                <td>
                    <asp:TextBox ID="txt_requirementsI" runat="server" TextMode="MultiLine" Wrap="true" />
                    <asp:RequiredFieldValidator ID="rfv_requirementsI" runat="server" Text="*Required" ControlToValidate="txt_requirementsI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_recruiting_numI" runat="server" Text="Recruiting Number: " /></td>
                <td>
                    <asp:TextBox ID="txt_recruiting_numI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_recruiting_numI" runat="server" Text="*Required" ControlToValidate="txt_recruiting_numI" ValidationGroup="insert" SetFocusOnError="true" Display="Dynamic" />
                    <asp:CompareValidator ID="cpv_recruiting_numI" runat="server" Text="*Not a number" ControlToValidate="txt_recruiting_numI" Operator="DataTypeCheck" Type="Currency" ValidationGroup="insert" Display="Dynamic" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_locationI" runat="server" Text="Location: " /></td>
                <td> 
                    <asp:TextBox ID="txt_locationI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" Text="*Required" ControlToValidate="txt_locationI" ValidationGroup="insert" SetFocusOnError="true" Display="Dynamic" />
                </td>                   
            </tr>
            <tr>
                <td><asp:Label ID="lbl_deadlineI" runat="server" Text="Deadline: " /></td>
                <td> 
                    <asp:TextBox ID="txt_deadlineI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_deadlineI" runat="server" Text="*Required" ControlToValidate="txt_deadlineI" ValidationGroup="insert" SetFocusOnError="true" Display="Dynamic" />
                    <asp:CompareValidator ID="cpv_deadlineI" runat="server" Text="*Not a date" ControlToValidate="txt_deadlineI" Operator="DataTypeCheck" Type="Date" ValidationGroup="insert" Display="Dynamic" SetFocusOnError="true" />
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
                <th class="auto-style11">Job Title</th>
                <th class="auto-style12">Job Type</th>
                <th class="auto-style13">Description</th>
                <th class="auto-style13">Requirements</th>
                <th class="auto-style5">Recruiting Number</th>
                <th class="auto-style4">Location</th>
                <th class="auto-style6">Deadline</th>
                <th class="auto-style7">Option</th>
            </tr>
        </table>
        <table>
            <asp:DataList ID="dtl_all" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Bind("Id") %>' />
                            <asp:TextBox ID="txt_job_titleE" runat="server" Text='<%#Bind("job_title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_job_typeE" runat="server" Text='<%#Bind("job_type") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_job_descriptionE" runat="server" Text='<%#Bind("job_description") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_requirementsE" runat="server" Text='<%#Bind("requirements") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_recruiting_numE" runat="server" Text='<%#Bind("recruiting_num") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_locationE" runat="server" Text='<%#Bind("location") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_deadlineE" runat="server" Text='<%#Bind("deadline") %>' />
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
       

</asp:Content>


