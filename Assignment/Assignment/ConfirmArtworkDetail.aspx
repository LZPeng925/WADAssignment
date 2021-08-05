<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmArtworkDetail.aspx.cs" Inherits="Assignment.ConfirmArtworkDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 25px;
            width: 219px;
        }
        .auto-style4 {
            width: 219px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style3 {
            width: 219px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1" colspan="3" style="text-align:center">
                        <h1>Artwork Detail</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">ID:</td>
                    <td class="auto-style1" colspan="2">
                        <asp:Label ID="lblArtworkID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name of Artwork:&nbsp; </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblArtworkName" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Name of Artists:</td>
                    <td class="auto-style5" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Price:</td>
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="lblArtworkPrice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <br />
                        <asp:Button ID="btnSubmit" runat="server" Text="Confirm" PostBackUrl="~/PaymentPage.aspx" />
                        <br />
                        <br />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                    <td>&nbsp;</td>
                    <td style="text-align:center">
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        </div>
    </form>
</body>
</html>
