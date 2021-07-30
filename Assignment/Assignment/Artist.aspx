<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="Assignment.Artist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style2">
            <tr>
                <td rowspan="5">&nbsp;</td>
                <td colspan="4">Profile:<asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">Profile Picture:</td>
            </tr>
            <tr>
                <td colspan="4"><asp:Image ID="Image1" runat="server" imageurl="~/Picture/Logo.jfif"/>
                </td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                </td>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Username :</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">Phone Number:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1">Email:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
            <asp:Label ID="lblState" runat="server">State</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:DropDownList ID="ddlState" runat="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="True" OnLoad="ddlState_Load" >
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
            </tr>
            <tr>
                <td rowspan="4">&nbsp;</td>
                <td class="auto-style1">
                <asp:Label ID="lblCountry" runat="server">Country</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
            <asp:Label ID="lblCity" runat="server">City</asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblDisplayCity" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlCity" runat="server">
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                <asp:Label ID="lblStreet" runat="server">Street</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                <asp:Label ID="lblCode" runat="server">Code</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Bank:</td>
                <td class="auto-style1">
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
                <td class="auto-style1">
                    Bank Account:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtBankAcc" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
