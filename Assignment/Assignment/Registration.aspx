<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Assignment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RSD ArtWork Registration</title>
        <link href="StyleSheets/Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
            height: 24px;
        }
        .auto-style16 {
            width: 170px;
            height: 24px;
        }
        .auto-style17 {
            width: 83px;
            height: 48px;
        }
        .auto-style18 {
            width: 170px;
            height: 48px;
        }
        .auto-style19 {
            width: 83px;
            height: 20px;
        }
        .auto-style20 {
            width: 170px;
            height: 20px;
        }
        .auto-style21 {
            width: 91px;
            height: 20px;
        }
        .auto-style22 {
            width: 91px;
            height: 48px;
        }
        .auto-style23 {
            height: 29px;
            width: 91px;
        }
        .auto-style24 {
            width: 91px;
            height: 46px;
        }
        .auto-style25 {
            width: 91px;
            height: 24px;
        }
        .auto-style27 {
            width: 83px;
            height: 26px;
        }
        .auto-style28 {
            width: 170px;
            height: 26px;
        }
        .auto-style29 {
            width: 91px;
            height: 26px;
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
        <tr><td class="auto-style19">
            <asp:Label ID="Label1" runat="server" Text="First Name: "></asp:Label>
            </td>
            <td class="auto-style20">
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style21">
            <asp:Label ID="Label2" runat="server" Text="Last Name: "></asp:Label>
            </td>
            <td class="auto-style20">
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style17">
            <asp:Label ID="Label3" runat="server" Text="Username: "></asp:Label>
            </td>
            <td class="auto-style18">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style22">
            <asp:Label ID="lblDisplayName" runat="server">Name Display:</asp:Label>
            </td>
            <td class="auto-style18">
                <asp:TextBox ID="txtDisplayName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style10">
            <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox type="password" ID="txtPassword" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style23">
            <asp:Label ID="Label8" runat="server" Text="Confirm Password: "></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox type="password" ID="txtCPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style10">
            <asp:Label ID="Label7" runat="server" Text="User Type: "></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="radUserType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="radUserType_SelectedIndexChanged">
                    <asp:ListItem>Artist</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style11">
                <asp:CheckBox type="checkbox" ID="chkShowPassword" runat="server" onclick="myFunction()" Text="Show Password"/>
            </td>
        </tr>
        <tr><td class="auto-style13">
            <asp:Label ID="Label5" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style24">
            <asp:Label ID="Label6" runat="server" Text="Phone No: "></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style15">
            <asp:Label ID="lblState" runat="server">State</asp:Label>
            </td>
            <td class="auto-style16">
                <asp:DropDownList ID="ddlState" runat="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="True" >
                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Malacca</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Penang</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>
                    <asp:ListItem>WP.Kuala Lumpur</asp:ListItem>
                    <asp:ListItem>WP.Labuan</asp:ListItem>
                    <asp:ListItem>WP.Putrajaya</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style25">
                <asp:Label ID="lblCountry" runat="server">Country</asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style10">
            <asp:Label ID="lblCity" runat="server">City</asp:Label>
            </td>
            <td class="auto-style11">
                <asp:DropDownList ID="ddlCity" runat="server" >
                </asp:DropDownList>
            </td>
            <td class="auto-style23">
                <asp:Label ID="lblStreet" runat="server">Street</asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="auto-style27">
                <asp:Label ID="lblCode" runat="server">Code</asp:Label>
            </td>
            <td class="auto-style28">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style29">
                &nbsp;</td>
            <td class="auto-style28">
                &nbsp;</td>
        </tr>
        <tr><td class="auto-style27">
            <asp:Label ID="lblBank" runat="server" Text="Bank"></asp:Label>
            </td>
            <td class="auto-style28">
                <asp:DropDownList ID="ddlBank" runat="server">
                    <asp:ListItem>Public Bank</asp:ListItem>
                    <asp:ListItem>Maybank</asp:ListItem>
                    <asp:ListItem>RHB Bank</asp:ListItem>
                    <asp:ListItem>AmBank</asp:ListItem>
                    <asp:ListItem>HSBC Bank</asp:ListItem>
                    <asp:ListItem>Hong Leong Bank</asp:ListItem>
                    <asp:ListItem>CIMB</asp:ListItem>
                    <asp:ListItem>OCBC Bank</asp:ListItem>
                    <asp:ListItem>UOB</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29">
            <asp:Label ID="lblBankAcc" runat="server" Text="Bank Account"></asp:Label>
                </td>
            <td class="auto-style28">
                <asp:TextBox ID="txtBankAcc" runat="server"></asp:TextBox>
            </td>
        </tr>
        </table>
</td></tr></table>
        <div class="center">

            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />

        </div>
    </form>
<script src="JavaScripts/function.js"></script>
</body>
</html>