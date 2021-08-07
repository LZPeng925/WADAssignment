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
                                <asp:BoundField DataField="InventoryID" HeaderText="InventoryID" SortExpression="InventoryID" />
                                <asp:BoundField DataField="InventoryName" HeaderText="InventoryName" SortExpression="InventoryName" />
                                <asp:BoundField DataField="InventoryPrice" HeaderText="InventoryPrice" SortExpression="InventoryPrice" />
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
                    <td style="text-align:center">ID :<asp:DropDownList ID="ddlSelectInventory" runat="server" DataSourceID="SqlDataSource1" DataTextField="InventoryID" DataValueField="WishListID">
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="btnPay" runat="server" PostBackUrl="~/PaymentPage.aspx" Text="Pay" Width="230px" />
                        &nbsp;
                        <asp:Button ID="btnDeleteWish" runat="server" Text="Delete from Wish List" Width="230px" OnClick="btnDeleteWish_Click" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT WishList.WishListID, WishList.InventoryID, PreInventory.InventoryName, PreInventory.InventoryPrice FROM PreInventory INNER JOIN WishList ON PreInventory.InventoryID = WishList.InventoryID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
