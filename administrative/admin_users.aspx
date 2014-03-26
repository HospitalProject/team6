<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_users.aspx.cs" Inherits="admin_users" %>
<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminUsers.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <AJAX:ToolkitScriptManager ID="tsm_users" runat="server" />
    <ajax:TabContainer runat="server" ID="tab_users"  style="width:800px">
        <ajax:TabPanel ID="tbp_doctors" runat="server" HeaderText="Doctors" Width="100%">
            <ContentTemplate>
                <asp:Repeater ID="rpt_doctors" runat="server">
                    <HeaderTemplate>
                        <table Width="100%">
                            <tr>
                                <th class="tabHead">First Name</th>
                                <th class="tabHead">Last Name</th>
                                <th class="tabHead">Email</th>
                                <th class="tabHead">Phone</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td class="tabContent"><%#Eval("FirstName") %></td>
                                <td class="tabContent"><%#Eval("LastName") %></td>
                                <td class="tabContent"><%#Eval("Email") %></td>
                                <td class="tabContent"><%#Eval("Phone") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </ajax:TabPanel>
        <ajax:TabPanel ID="tbp_registeredUsers" runat="server" HeaderText="Registered Users"  Width="100%">
            <ContentTemplate>
                <asp:Repeater ID="rpt_registeredUsers" runat="server">
                    <HeaderTemplate>
                        <table  Width="100%">
                            <tr>
                                <th class="tabHead">First Name</th>
                                <th class="tabHead">Last Name</th>
                                <th class="tabHead">Email</th>
                                <th class="tabHead">Phone</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td class="tabContent"><%#Eval("FirstName") %></td>
                                <td class="tabContent"><%#Eval("LastName") %></td>
                                <td class="tabContent"><%#Eval("Email") %></td>
                                <td class="tabContent"><%#Eval("Phone") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </ajax:TabPanel>

    </ajax:TabContainer>
    <br />
    <br />

    <asp:Panel ID="pnl_create_doctor" runat="server" GroupingText="Add a new doctor">
    <asp:CreateUserWizard ID="cuw_main" runat="server" OnCreatedUser="cuw_main_CreatedUser" NavigationButtonStyle-CssClass="centeralign" ContinueDestinationPageUrl="~/administrative/admin_users.aspx" LoginCreatedUser="false" >
        <WizardSteps>
            <asp:WizardStep>
                
                <table border="0" style="font-size: 100%; font-family: Verdana" id="TABLE1" >
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_firstName" runat="server" AssociatedControlID="txt_firstName" Text="First Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_firstName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_firstName" runat="server" ControlToValidate="txt_firstName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_lastName" runat="server" AssociatedControlID="txt_lastName" Text="Last Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lastName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_lastName" runat="server" ControlToValidate="txt_LastName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_phone" runat="server" AssociatedControlID="txt_phone" Text="Phone: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_phone" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*" Display="Dynamic" CssClass="validatefail" />
                            <br /><asp:RegularExpressionValidator ID="rev_phone" runat="server" ControlToValidate="txt_phone" Text="Invalid phone number" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" CssClass="validatefail" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:CreateUserWizardStep Title="">
                <CustomNavigationTemplate>
                  <table>
                      <tr>
                        <td>
                          <asp:Button ID="StepPreviousButton" runat="server" 
                                         CommandName="MovePrevious" Text="Previous" CausesValidation="false" />
                          <asp:Button ID="StepNextButton" runat="server" 
                                         CommandName="MoveNext" Text="Create User"
                                         ValidationGroup="CreateUserWizard1" />
                        </td>
                      </tr>
                  </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </asp:Panel>

</asp:Content>

