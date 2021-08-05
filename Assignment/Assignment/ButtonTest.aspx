<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonTest.aspx.cs" Inherits="Assignment.ButtonTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            UserID:<asp:Label ID="lblUserID" runat="server" Text="1"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Just for Test)<br />
            ID:
            <asp:DropDownList ID="ddlInventoryID" runat="server" DataSourceID="SqlDataSource1" DataTextField="InventoryID" DataValueField="InventoryID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnPayment" runat="server" PostBackUrl="~/ConfirmArtworkDetail.aspx" Text="Go Payment Page" Width="181px" />
            <br />
            <br />
            <asp:Button ID="btnHistory" runat="server" Text="Pay history(Not yet)" Width="182px" />
            <br />
            <br />
            <asp:Button ID="btnAddtoWish" runat="server"  Text="Add to Wish List" OnClick="btnAddtoWish_Click" Width="181px"/>
            <br />
            <br />
            <asp:Button ID="btnViewWishList" runat="server" Text="View Wish Page" PostBackUrl="~/WishListPage.aspx" Width="181px"/>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PreInventory]"></asp:SqlDataSource>
    </form>
</body>
</html>
