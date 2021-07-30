<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreHomePage.aspx.cs" Inherits="Assignment.PreHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RSD ARTWORK</title>
    <link href="StyleSheets/Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 105px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        RSD ARTWORK GALLERY
        <br />
        <asp:Image ID="Image1" runat="server" imageurl="Picture/Logo.jfif" BorderStyle="Solid" Height="200px" Width="329px"/>
    </header>
    <div>
        <h3 class="paragragh">Welcome To RSD ArtWork Gallery. <br/>
        Here you can find any ArtWork and Artist that you wants.<br/>
        Please Log In.</h3>
    </div>

        <table style="width:100%;">
            <tr>
                <td><h2 class="paragragh">RSD ArtWork Gallery Log in</h2>
                </td>
            </tr>
            <tr>
            <td class="auto-style1"><p class="paragragh">Username: <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                  <br/>Password: <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </p>
                <p class="paragragh">
                    <asp:Label ID="lblDisplayMsg" runat="server"></asp:Label>
            </p>
                <div class="center"><asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Registration.aspx">Don't have an account? Click here to register.</asp:LinkButton></div>
                </td>
            </tr>
            </table>
            <div class="center">
                <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" style="height: 29px" />
                &nbsp;<asp:Button ID="btnRegister" runat="server" Text="Sing Up" style="height: 29px" PostBackUrl="~/Registration.aspx" />
            </div>
    </form>
</body>
</html>
