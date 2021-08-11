<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="WishListPage.aspx.cs" Inherits="Assignment.WishListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        <style type="text/css">
        .auto-style1 {
            height: 49px;

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
            <table style="width:100%;">
                <tr>
                    <td colspan="2" style="text-align:center" class="auto-style1">
                        <h1>Wish List Page</h1>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="WishListID" class="tablestyle" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" Width="100%" GridLines="Both">
                            <ItemTemplate>
                                Wish List ID:
                                <asp:Label ID="WishListIDLabel" runat="server" Text='<%# Eval("WishListID") %>' />
                                <br />
                                Artwork ID:
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                <br />
                                Artwork Name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                <br />
                                Name of the Artists:
                                <asp:Label ID="artistsLabel" runat="server" Text='<%# Eval("artists") %>' />
                                <br />
                                Artwork Price:
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                <br />
                                Image:<br />&nbsp;
                                <asp:Image ID="Image2" runat="server" Height="300px" ImageUrl='<%# "data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>' Width="300px" />
<br />
                                Stock:
                                <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                                <br />
                                &nbsp;<asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="Add To Cart" Height="40px" Width="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                                <asp:ImageButton ID="DeleteButton" runat="server" CommandName="DeleteWish" Height="40px" ImageUrl="https://vegibit.com/wp-content/uploads/2018/01/How-To-Delete-A-Record-From-The-Database.png" Width="45px" />
                                <br />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <br />
                    &nbsp;
                        <asp:Button ID="Button1" runat="server" PostBackUrl="~/Display.aspx" Text="Back" Width="230px" />
                    </td>
                    <td>
                        <br />
                        &nbsp;<br />
                        &nbsp;
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT WishList.WishListID, WishList.id, artwork.name, artwork.artists, artwork.price, artwork.image, artwork.stock FROM WishList INNER JOIN artwork ON WishList.id = artwork.id WHERE (WishList.UserName = @userName)">
            <SelectParameters>
                <asp:SessionParameter Name="userName" SessionField="Username" />
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>  