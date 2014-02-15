<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slideradmin.aspx.cs" Inherits="slideradmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lbl_msg" runat="server" />
    <asp:Label ID="lbl_sliderimgI" runat="server"  Text="Select Image" AssociatedControlID="fud_sliderimgI" Font-Bold="true" />
        <br />
        <asp:FileUpload ID="fud_sliderimgI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_sliderimgI" runat="server" Text="*Required field" ControlToValidate="fud_sliderimgI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_nameI" runat="server" Text="Image Name" AssociatedControlID="txt_nameI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_nameI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required field" ControlToValidate="txt_nameI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_orderI" runat="server" Text="Order" AssociatedControlID="txt_orderI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_orderI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_orderI" runat="server" Text="*Required field" ControlToValidate="txt_orderI" ValidationGroup="insert" />
        <br />
        <asp:RequiredFieldValidator ID="rfv_titleI" runat="server" Text="*Required field" ControlToValidate="txt_titleI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_textI" runat="server" Text="Text" AssociatedControlID="txt_textI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_textI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_textI" runat="server" Text="*Required field" ControlToValidate="txt_textI" ValidationGroup="insert" />
        <br />
        <asp:Label ID="lbl_titleI" runat="server" Text="Title" AssociatedControlID="txt_titleI" Font-Bold="true" />
        <br />
        <asp:TextBox ID="txt_titleI" runat="server" /> 
         
        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" ValidationGroup="insert" OnCommand="btn_insert_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
        <br />
        <br />
        <table>
        <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subAdmin">
            
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("sliderID") %>' />
                        <asp:TextBox ID="txt_name" runat="server" Text='<%#Bind("simageName") %>' ></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_title" runat="server" Text='<%#Bind("simageTitle") %>' ></asp:TextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="txt_text" runat="server" Text='<%#Bind("simageText") %>' ></asp:TextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="txt_order" runat="server" Text='<%#Bind("simageOrder") %>' ></asp:TextBox>

                    </td>
                    
                    <td>
                        <asp:Button ID="btn_upd" runat="server" Text="Update" CommandName="Upd" CommandArgument = '<%#Eval("sliderID") %>' ValidationGroup="update" />
                    <asp:Button ID="btn_del" runat="server" Text="Delete" CommandName="del" CommandArgument = '<%#Eval("sliderID") %>' OnClientClick="return confirm('You are about to delete a record, Continue?')" CausesValidation="false" /></td>
                    </td>

                </tr>
                
            </ItemTemplate>
            <EmptyItemTemplate>
            <tr>
                <asp:Label ID="lbl_emptyitem" runat="server" Text="No Items to display" />
            </tr>
        </EmptyItemTemplate>
        <EmptyDataTemplate>
            <tr><asp:Label ID="lbl_emptydata" runat="server" Text="No Data provided" /></tr>
        </EmptyDataTemplate>
        </asp:ListView>
            </table>
    </div>
    </form>
</body>
</html>
