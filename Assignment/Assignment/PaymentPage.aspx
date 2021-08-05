<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="Assignment.PaymentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2" style="text-align:center">
                        <h1>Payment Page (Not Yet)</h1>
                    </td>
                </tr>
                <tr>
                    <td>Telefon No:<br />
                        <br />
                        Email: </td>
                    <td>
                        <asp:TextBox ID="txtTelefonNo" runat="server" Width="300px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Way for Pay:</td>
                    <td>
                        <asp:RadioButtonList ID="rblWayToPay" runat="server" AutoPostBack="True">
                            <asp:ListItem>FPX</asp:ListItem>
                            <asp:ListItem>TnG</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Name of Bank:" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNameofBank" runat="server" Visible="False">
                            <asp:ListItem>CIMB</asp:ListItem>
                            <asp:ListItem>Hong Leong Bank</asp:ListItem>
                            <asp:ListItem>Public Bank</asp:ListItem>
                            <asp:ListItem>Maybank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td>RM<asp:TextBox ID="txtAmount" runat="server" Enabled="False" Width="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:Button ID="btnPay" runat="server" Text="Pay" Width="1357px" />
        </div>
    </form>
</body>
</html>
