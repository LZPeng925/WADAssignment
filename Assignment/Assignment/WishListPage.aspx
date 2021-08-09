<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WishListPage.aspx.cs" Inherits="Assignment.WishListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2" style="text-align:center" class="auto-style1">
                        <h1>Wish List Page</h1>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align:center">UserID:
                        <asp:Label ID="lblUserID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="WishListID" DataSourceID="SqlDataSource1" Enabled="False" ForeColor="#333333" GridLines="None" Height="65px" Width="777px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="WishListID" HeaderText="WishListID" SortExpression="WishListID" ReadOnly="True" />
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">ID :<asp:DropDownList ID="ddlSelectInventory" runat="server" DataSourceID="SqlDataSource1" DataTextField="WishListID" DataValueField="WishListID">
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="btnPay" runat="server" PostBackUrl="~/ConfirmArtworkDetail.aspx" Text="Pay" Width="230px" />
                        &nbsp;
                        <asp:Button ID="btnDeleteWish" runat="server" Text="Delete from Wish List" Width="230px" OnClick="btnDeleteWish_Click" />
                    &nbsp;
                        <asp:Button ID="Button1" runat="server" PostBackUrl="~/ButtonTest.aspx" Text="Back" Width="230px" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT WishList.WishListID, WishList.id, artwork.name, artwork.price FROM artwork INNER JOIN WishList ON artwork.id = WishList.id WHERE (WishList.UserID = @userID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblUserID" Name="userID" PropertyName="Text" />
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
