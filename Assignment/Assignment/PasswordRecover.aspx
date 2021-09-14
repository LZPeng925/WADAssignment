<%@ Page Language="C#" MasterPageFile="Project.master" AutoEventWireup="true" CodeBehind="PasswordRecover.aspx.cs" Inherits="Assignment.PasswordRecover" %>

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
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div>
        <h3 class="paragragh">Password Recovery<br/>
        </h3>
    </div>
    <table style="width:100%" border="0"><tr><td>
        <table style="width:auto;" align="center">
            <tr>
                <td>Username : </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Email : </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                    <asp:ScriptManager runat="server" ID="ScriptManager1" />
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" Enabled="False">
        </asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblTimer" runat="server" Text="0.1"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td>Verification Code : </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblCodeMsg" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style1">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </td>
        </table>
</asp:Content>  