<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="ConfirmArtworkDetail.aspx.cs" Inherits="Assignment.ConfirmArtworkDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <style type="text/css">
        .auto-style6 {
            height: 24px;
        }
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6" style="text-align:center">
                        <h1>Artwork Detail</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="cartID" class="tablestyle" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
                            <ItemTemplate>
                                Artwork ID:
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                <br />
                                Artwork Name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                <br />
                                Artwork Unit Price:
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                <br />
                                Quantity:
                                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                <br />
                                Total Price:
                                <asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' />
                                <br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td>
        <div>
            <table style="width:100%;">
                <tr>
                    <td>UserName:<br />
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
                        Total
                        Quantity</td>
                    <td>
                        <asp:TextBox ID="txtNumber" runat="server" Width="120px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td>RM<asp:TextBox ID="txtAmount" runat="server" Enabled="False" Width="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Cart.cartID, Cart.id, artwork.name, artwork.price, Cart.quantity, artwork.price * Cart.quantity AS total, artwork.stock FROM artwork INNER JOIN Cart ON artwork.id = Cart.id WHERE (Cart.UserName = @Username)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Username" SessionField="Username" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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