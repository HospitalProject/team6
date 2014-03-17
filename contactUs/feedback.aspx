<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link rel="stylesheet" href="../App_Themes/Theme/FeedbackStyleSheet.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div id="feedback_title">
        <div id="feedback_titleL">
            <asp:Image ID="img_feedback" runat="server" ImageUrl="~/App_Themes/Theme/img/feedback.png" AlternateText="feedback logo" />
        </div>
        <div id="feedback_titleR">
            <h2>Feedback</h2>
        </div>
    </div>

    <div class="txtmsg">
        <asp:Label ID="lbl_txtMsg" runat="server"/>
    </div>

    <br /><br />

    <div id="header_view">
        <table>
            <tr>
                <th><asp:Button ID="btn_complains" runat="server" Text="Complains" OnClick="btnComplains_Click" CssClass="btn_link" /></th>
                <th><asp:Button ID="btn_comments" runat="server" Text="Comments" OnClick="btnComments_Click" CssClass="btn_link" /></th>
                <th><asp:Button ID="btn_appreciations" runat="server" Text="Appreciations" OnClick="btnAppreciations_Click" CssClass="btn_link" /></th>
            </tr>
        </table>
    </div>

    <div id="content_view">

        <div id="sideLeft">
            <asp:MultiView ID="MultiView" runat="server">
                             <%------------------------------- Complaints Section---------------------------------%>
                <asp:View ID="View1" runat="server">
                    <asp:HiddenField ID="hdfView1_section" runat="server" Value="complaint"  />
                    <asp:Label ID="lblView1_title" runat="server" Text="<h1>Your Complains<h1>" />
                    <asp:Label ID="lblview1_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <h5>Full Name:
                    <asp:TextBox ID="txtView1_fname" runat="server" /></h5>
                    <br />
                    
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView1_email" runat="server" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView1_email" SetFocusOnError="true" ValidationGroup="view1" />
                    <asp:RegularExpressionValidator ID="rev_email_view1" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView1_email" Display="Dynamic" ValidationGroup="view1"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br />

                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView1_rdepartment" runat="server">
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <br />
                    <h5>Subject<span style='color:red;'>*</span>:
                     <asp:TextBox ID="txtView1_title" runat="server" Width="350px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView1_title" SetFocusOnError="true" ValidationGroup="view1" />
                    <br />
                    <h5>Explain the issue(s)<span style='color:red;'>*</span>:</h5>
                    <asp:TextBox ID="txtView1_content" rows="8" Width="450px" runat="server" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfv_content_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView1_content" SetFocusOnError="true" ValidationGroup="view1" />
                    <br />

                    <asp:Button ID="btnView1_submit" runat="server" Text="Send" CommandName="InsertComp" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view1" />
                    <asp:Button ID="btnView1_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                    
                </asp:View>
                                     <%------------------------------- Comments Section---------------------------------%>
                <asp:View ID="View2" runat="server">
                    <asp:HiddenField ID="hdfView2_section" runat="server" Value="comment"  />
                    <asp:Label ID="lblView2_title" runat="server" Text="<h1>Your Comments<h1>" />
                    <asp:Label ID="lblView2_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <h5>Full Name:
                    <asp:TextBox ID="txtView2_fname" runat="server" /></h5>
                    <br />
                    
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView2_email" runat="server" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_email" SetFocusOnError="true" ValidationGroup="view2" />
                    <asp:RegularExpressionValidator ID="rev_email_view2" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView2_email" Display="Dynamic" ValidationGroup="view2"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br />

                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView2_rdepartment" runat="server">
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <br />
                    <h5>Subject<span style='color:red;'>*</span>:
                     <asp:TextBox ID="txtView2_title" runat="server" Width="350px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_title" SetFocusOnError="true" ValidationGroup="view2" />
                    <br />
                    <h5>Explain the comment(s)<span style='color:red;'>*</span>:</h5>
                    <asp:TextBox ID="txtView2_content" rows="8" Width="450px" runat="server" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfv_content_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_content" SetFocusOnError="true" ValidationGroup="view2" />
                    <br />
                    
                    <asp:Button ID="btnView2_submit" runat="server" Text="Send" CommandName="InsertComm" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view2" />
                    <asp:Button ID="btnView2_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                   
                </asp:View>
                                    <%------------------------------- Appreciation Section---------------------------------%>
                <asp:View ID="View3" runat="server">
                   <asp:HiddenField ID="hdfView3_section" runat="server" Value="appreciation"  />
                   <asp:Label ID="lblView3_title" runat="server" Text="<h1>Your Appreciation<h1>" /> 
                   <asp:Label ID="lblView3_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <h5>Full Name:
                    <asp:TextBox ID="txtView3_fname" runat="server" /></h5>
                    <br />
                    
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView3_email" runat="server" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_email" SetFocusOnError="true" ValidationGroup="view3" />
                    <asp:RegularExpressionValidator ID="rev_email_view3" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView3_email" Display="Dynamic" ValidationGroup="view3"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br />

                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView3_rdepartment" runat="server">
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <br />
                    <h5>Subject<span style='color:red;'>*</span>:
                     <asp:TextBox ID="txtView3_title" runat="server" Width="350px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_title" SetFocusOnError="true" ValidationGroup="view3" />
                    <br />
                    <h5>Explain the case<span style='color:red;'>*</span>:</h5>
                    <asp:TextBox ID="txtView3_content" rows="8" Width="450px" runat="server" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfv_content_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_content" SetFocusOnError="true" ValidationGroup="view3" />
                    <br />
                    
                    <asp:Button ID="btnView3_submit" runat="server" Text="Send" CommandName="InsertApp" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view3" />
                    <asp:Button ID="btnView3_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                   
                </asp:View>             
            </asp:MultiView>
        </div>

        <div id="sideRight">

        </div>
    </div>
</asp:Content>

