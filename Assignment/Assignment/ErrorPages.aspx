<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPages.aspx.cs" Inherits="Assignment.ErrorPages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        RSD Gallery ERROR.<br />
        <br />
        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        <br />
        <br />
        Please try again later, admin is solving the problem.<br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Display.aspx">Return to Home Page</asp:HyperLink>
    </form>
</body>
</html>
