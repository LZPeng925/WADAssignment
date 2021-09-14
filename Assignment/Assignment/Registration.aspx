<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Registration.aspx.cs" Inherits="Assignment.Registration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        <style type="text/css">
        .auto-style19 {
            width: 250px;
            height: 50px;
        }
        .auto-style20 {
            width: 100px;
            height: 50px;
        }
    </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <header>
            RSD ARTWORK GALLERY REGISTRATION<br/>
            <asp:Image ID="Image1" runat="server" imageurl="Picture/Logo.jfif" BorderStyle="Solid" Height="200px" Width="329px" />
        </header>
<table style="width:100%" border="0"><tr><td class="auto-style9">
    <table style="width:auto" border="0" align="center">
        <tr><td class="auto-style20">
            <asp:Label ID="Label1" runat="server" Text="First Name: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtFName" ErrorMessage="Must be alphabet only" ForeColor="Red" ValidationExpression="[A-Z/a-z\s]*"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style20">
            <asp:Label ID="Label2" runat="server" Text="Last Name: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtLName" ErrorMessage="Must be alphabet only" ForeColor="Red" ValidationExpression="[A-Z/a-z\s]*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="Label3" runat="server" Text="Username: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsername" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
            <asp:Label ID="lblDisplayName" runat="server">Name Display:</asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtDisplayName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDisplayName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must more than 6" ForeColor="Red" ValidationExpression=".{6}.*"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style20">
            <asp:Label ID="Label8" runat="server" Text="Confirm Password: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtCPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Must same with Password" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="Label7" runat="server" Text="User Type: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:RadioButtonList ID="radUserType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="radUserType_SelectedIndexChanged">
                    <asp:ListItem>Artist</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="radUserType" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
                &nbsp;</td>
            <td class="auto-style19">
                <asp:CheckBox type="checkbox" ID="chkShowPassword" runat="server" AutoPostBack="true" Text="Show Password"/>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="Label5" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Format: xxxx@xxxx.xxx" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style20">
            <asp:Label ID="Label6" runat="server" Text="Phone No: "></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Format: xxx-xxxxxxx" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="lblState" runat="server">State</asp:Label>
            </td>
            <td class="auto-style19">
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlState" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
                <asp:Label ID="lblCountry" runat="server">Country</asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCountry" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="lblCity" runat="server">City</asp:Label>
            </td>
            <td class="auto-style19">
                <asp:DropDownList ID="ddlCity" runat="server" >
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlCity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
                <asp:Label ID="lblStreet" runat="server">Street</asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtStreet" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td class="auto-style20">
                <asp:Label ID="lblCode" runat="server">Code</asp:Label>
            </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCode" ErrorMessage="Must be 5 digits" ForeColor="Red" ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style20">
                &nbsp;</td>
            <td class="auto-style19">
                &nbsp;</td>
        </tr>
        <tr><td class="auto-style20">
            <asp:Label ID="lblBank" runat="server" Text="Bank"></asp:Label>
            </td>
            <td class="auto-style19">
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20">
            <asp:Label ID="lblBankAcc" runat="server" Text="Bank Account"></asp:Label>
                </td>
            <td class="auto-style19">
                <asp:TextBox ID="txtBankAcc" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
</td></tr></table>
        <div class="center">

            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false"/>

        </div>
</asp:Content>  