<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="ConfirmArtworkDetail.aspx.cs" Inherits="Assignment.ConfirmArtworkDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <style type="text/css">


        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 25px;
            width: 420px;
        }
        .auto-style4 {
            width: 420px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
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
                    <td class="auto-style5" colspan="2">
                        <asp:Label ID="lblArtistsName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Unit Price:</td>
                    <td class="auto-style5" colspan="2">
                        RM<asp:Label ID="lblArtworkPrice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>UserID:<br />
                        <br />
                        Email: </td>
                    <td>
                        <asp:Label ID="lblUserID" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Way for Pay:</td>
                    <td>
                        <asp:RadioButtonList ID="rblWayToPay" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblWayToPay_SelectedIndexChanged1">
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
                    <td>
                        Quantity</td>
                    <td>
                        <asp:TextBox ID="txtNumber" runat="server" Width="120px">1</asp:TextBox>
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
        <asp:Button ID="btnPay" runat="server" Text="Pay" Width="100%" Enabled="False" OnClick="btnPay_Click" />
                        <br />
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Cancel" PostBackUrl="~/ButtonTest.aspx" Width="100%" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        </div>
</asp:Content>  