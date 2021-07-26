<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Assignment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RSD ArtWork Registration</title>
        <link href="StyleSheets/Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style8 {
            width: 83px;
        }
        .auto-style9 {
            width: 100%;
            height: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            RSD ARTWORK GALLERY REGISTRATION<br/>
            <asp:Image ID="Image1" runat="server" imageurl="Picture/Logo.jfif" BorderStyle="Solid" Height="200px" Width="329px" />
        </header>
<table style="width:100%" border="0"><tr><td class="auto-style9">
    <table style="width:auto" border="0" align="center">
        <tr><td class="auto-style8">
            <asp:Label ID="Label1" runat="server" Text="First Name: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label2" runat="server" Text="Last Name: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label3" runat="server" Text="Username: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label8" runat="server" Text="Confirm Password: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label5" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label6" runat="server" Text="Phone No: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label7" runat="server" Text="User Type: "></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="radUserType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Artist</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
</td></tr></table>
        <div class="center">

            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />

        </div>
    </form>
</body>
</html>
