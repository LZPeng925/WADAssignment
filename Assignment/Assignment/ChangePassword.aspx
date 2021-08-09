<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="ChangePassword.aspx.cs" Inherits="Assignment.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2"><p class="paragragh">Change Your Password</p></td>
                </tr>
                <tr>
                    <td class="auto-style1"><p class="rightside">Password:</p></td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><p class="rightside">NewPassword:</p></td>
                    <td>
                        <asp:TextBox ID="txtCPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><p class="rightside">Confirm New Password:</p></td>
                    <td>
                        <asp:TextBox ID="txtCNPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Show Password" AutoPostBack="True" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <div class="paragragh">
                        <asp:Label ID="lblDisplayMsg" runat="server"></asp:Label>
                    </div></td>
                </tr>
                <tr>
                    <td><div class="rightside">
                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                    </div></td>
                    <td>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>  