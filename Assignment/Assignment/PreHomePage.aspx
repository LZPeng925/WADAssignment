<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Project.master" CodeBehind="PreHomePage.aspx.cs" Inherits="Assignment.PreHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
      <style type="text/css">
        .headercolor {
            font-style: italic;
            font-size: x-large;
            text-align: center;
            background-color: dodgerblue;
            color: black;
        }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <header class="headercolor">
        RSD ARTWORK GALLERY
        <br />
        <asp:Image ID="Image2" runat="server" imageurl="Picture/Logo.jfif" BorderStyle="Solid" Height="200px" Width="329px"/>
    </header>
    <div>
        <h3 class="paragragh">Welcome To RSD ArtWork Gallery. <br/>
        Here you can find any ArtWork and Artist that you wants.<br/>
        </h3>
    </div>

        <table style="width:100%;">
            <tr>
                <td><h2 class="paragragh">RSD ArtWork Gallery<br/>Log in</h2>
                </td>
            </tr>
            <tr>
            <td class="auto-style1"><p class="paragragh">
                    <asp:Label ID="lblDisplayMsg" runat="server" ForeColor="Red"></asp:Label>
            </p>
                <p class="paragragh">Username: <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                  <br/>Password: <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br/>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Show Password" AutoPostBack="True" />
            </p>
                <p class="paragragh">
                    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/PasswordRecover.aspx">Forgot Password?</asp:LinkButton>
            </p>
                <div class="center"><asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Registration.aspx">Do not own an account? Click here</asp:LinkButton></div>
                </td>
            </tr>
            </table>
            <div class="center">
                <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" style="height: 29px" />
                &nbsp;<asp:Button ID="btnRegister" runat="server" Text="Sign Up" style="height: 29px" PostBackUrl="~/Registration.aspx" OnClick="btnRegister_Click" />
            </div>
</asp:Content>  