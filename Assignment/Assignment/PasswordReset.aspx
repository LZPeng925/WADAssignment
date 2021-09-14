<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="PasswordReset.aspx.cs" Inherits="Assignment.PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
      <style type="text/css">
        .headercolor {
            font-style: italic;
            font-size: x-large;
            text-align: center;
            background-color: dodgerblue;
            color: black;
        }
          .auto-style1 {
              width: 7px;
          }
          .auto-style2 {
              height: 44px;
          }
          .auto-style3 {
              width: 7px;
              height: 44px;
          }
          .auto-style4 {
              height: 36px;
          }
          .auto-style5 {
              width: 7px;
              height: 36px;
          }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div>
        <h3 class="paragragh">Password Reset<br/>
        </h3>
    </div>
    <table style="width:100%" border="0"><tr><td>
        <table style="width:auto;" align="center">
            <tr>
                <td class="auto-style4">Username : </td>
                <td class="auto-style5">
                    <asp:Label ID="lblUsername" runat="server"></asp:Label>
                </td>
                <td class="auto-style5">
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">New Password : </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtNPassword" runat="server"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style1">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must more than 6" ForeColor="Red" ValidationExpression=".{6}.*" ControlToValidate="txtNPassword"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style1">
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Confirm New<br />
                    Password : </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCNPassword" runat="server"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCNPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNPassword" ControlToValidate="txtCNPassword" ErrorMessage="Must Same with New Password" ForeColor="Red"></asp:CompareValidator>
                </td>
                <td class="auto-style3">
                        &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="rightside">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
        </td>
        </table>
</asp:Content>  