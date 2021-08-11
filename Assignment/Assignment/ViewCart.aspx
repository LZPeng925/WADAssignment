<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" MasterPageFile="~/Project.Master" Inherits="Assignment.ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        </asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style type="text/css">
        .auto-style2 {
            height: 48px;
        }
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
        </style>
        <div>
            <table style="width:100%;">
                <tr>
                    <td style="text-align:center" class="auto-style2" colspan="2"><h1>View Cart</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="cartID" class="tablestyle" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
                                Cart ID:
                                <asp:Label ID="cartIDLabel" runat="server" Text='<%# Eval("cartID") %>' />
                                <br />
                                Artwork ID:
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                <br />
                                Artwork Name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                <br />
                                Artwork Unit Price: RM<asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                <br />
                                Quantity:
                                <asp:LinkButton  ID="LinkButton1" runat="server"  CommandName="MinusQty" CommandArgument='<%# Container.DataItem %>' Font-Size="XX-Large" >-</asp:LinkButton>
                                <asp:TextBox ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' Width="45px"></asp:TextBox>
                                ...<asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>'></asp:Label>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="AddQty" CommandArgument='<%# Container.DataItem %>' Font-Size="XX-Large" >+</asp:LinkButton>
                                <br />
                                Total Price for this Artwork: RM<asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' />
                                <br />
                                image:<br />
                                <asp:Image ID="Image2" runat="server" Height="300px" ImageUrl='<%# "data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>' Width="300px" />
                                <br />
                                <asp:ImageButton ID="DeleteButton" runat="server" CommandName="DeleteWish" Height="40px" ImageUrl="https://vegibit.com/wp-content/uploads/2018/01/How-To-Delete-A-Record-From-The-Database.png" Width="45px" />
                                <br />
<br />
                            </ItemTemplate>
                        </asp:DataList>

                        <asp:Button ID="btnCount" runat="server" OnClick="btnCount_Click" Text="Calculate" Width="115px" />
&nbsp; Total Price for all artwork in cart:
                        <asp:Label ID="lblTotalPrice" runat="server" Text="(not yet calculate)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <asp:Button ID="btnPay" runat="server" PostBackUrl="~/ConfirmArtworkDetail.aspx" Text="Pay for all item in cart" Width="230px" />
&nbsp;<asp:Button ID="btnBack" runat="server" PostBackUrl="~/Display.aspx" Text="Back" Width="230px" />
                    &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Cart.cartID, Cart.id, artwork.name, artwork.price, Cart.quantity, artwork.price * Cart.quantity AS total, artwork.image, artwork.stock FROM artwork INNER JOIN Cart ON artwork.id = Cart.id WHERE (Cart.UserName = @UserName)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>  
