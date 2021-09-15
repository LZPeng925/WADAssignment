<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Artist.aspx.cs" Inherits="Assignment.Artist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <style type="text/css">
        .auto-style1 {
            height:50px;
            width:auto;
        }
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <table class="auto-style1 tablestyle">
            <tr>
                <td class="auto-style1" colspan="2">Profile Picture:</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Image ID="imgPicture" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnUpload" runat="server" CssClass="auto-style7" OnClick="btnUpload_Click" Text="Change Picture" Width="125px" CausesValidation="false"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblDisplayError" runat="server"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" OnClick="btnEdit_Click"/>
                </td>
            </tr>
                </table>
        <table class="auto-style1 tablestyle">
            <tr>
                <td class="auto-style1" colspan="2">First Name:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtFName" ErrorMessage="Must be alphabet only" ForeColor="Red" ValidationExpression="[A-Z/a-z\s]*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style1">Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtLName" ErrorMessage="Must be alphabet only" ForeColor="Red" ValidationExpression="[A-Z/a-z\s]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">Name Display:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtDisplayName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDisplayName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">Phone Number:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Format: xxxxxxxxxx" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">Email:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Format: xxxx@xxxx.xxx" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style1">
            <asp:Label ID="lblState" runat="server">State:</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnLoad="ddlState_Load" >
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlState" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                <asp:Label ID="lblCountry" runat="server">Country:</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCountry" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
            <asp:Label ID="lblCity" runat="server">City</asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblDisplayCity" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlCity" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlCity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                <asp:Label ID="lblStreet" runat="server">Street:</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtStreet" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                <asp:Label ID="lblCode" runat="server">Code:</asp:Label>
                </td>
                <td class="auto-style1">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCode" ErrorMessage="Must be 5 digits" ForeColor="Red" ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label ID="lblBank" runat="server" Text="Bank:"></asp:Label>
                </td>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlBank"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblBankAcc" runat="server" Text="Bank Account:"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtBankAcc" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBankAcc"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" CausesValidation="false"/>
                </td>
            </tr>
        </table>
</asp:Content>  