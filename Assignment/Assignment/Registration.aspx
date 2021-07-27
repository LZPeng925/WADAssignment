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
        .auto-style10 {
            width: 83px;
            height: 29px;
        }
        .auto-style11 {
            height: 29px;
            width: 170px;
        }
        .auto-style12 {
            width: 170px;
        }
        .auto-style13 {
            width: 83px;
            height: 46px;
        }
        .auto-style14 {
            width: 170px;
            height: 46px;
        }
        .auto-style15 {
            width: 83px;
            height: 25px;
        }
        .auto-style16 {
            width: 170px;
            height: 25px;
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
            <td class="auto-style12">
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label2" runat="server" Text="Last Name: "></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style10">
            <asp:Label ID="Label3" runat="server" Text="Username: "></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style10">
            <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox type="password" ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style13">
            <asp:Label ID="Label8" runat="server" Text="Confirm Password: "></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox type="password" ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style15">
            </td>
            <td class="auto-style16">
                <asp:CheckBox type="checkbox" ID="CheckBox1" runat="server" onclick="myFunction()" Text="Show Password"/>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label5" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label6" runat="server" Text="Phone No: "></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style8">
            <asp:Label ID="Label7" runat="server" Text="User Type: "></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:RadioButtonList ID="radUserType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Artist</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr><td class="auto-style8">
            &nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
        </tr>
    </table>
</td></tr></table>
        <div class="center">

            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />

        </div>
    </form>
<script>
function myFunction() {
    var x = document.getElementById("txtPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
        var x = document.getElementById("TextBox1");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "Password";
    }
}
</script>
</body>
</html>