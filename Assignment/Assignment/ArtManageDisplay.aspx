﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtManageDisplay.aspx.cs" Inherits="Assignment.ArtManageDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 1169px;
            height: 82px;
        }
        .auto-style3 {
            width: 223px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            width: 129px;
        }
        .auto-style6 {
            width: 49px;
        }
        .auto-style9 {
            width: 250px;
        }
        .auto-style10 {
            height: 60px;
        }
        .auto-style11 {
            margin-top: 31px;
        }
        .auto-style12 {
            width: 4px;
        }
        .auto-style13 {
            height: 24px;
        }
        .auto-style14 {
            margin-left: 40px;
        }
    </style>
    </head>
<body>

    <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #339966; right: auto; left: auto">
        Search
        <br />
    </header>

    <form id="form1" runat="server" class="auto-style11">
        <table class ="auto-style2">
            <tr>
                <td class="auto-style6">

                </td>
             
                <td class="auto-style5">
                     <asp:Label ID="Label1" runat="server" Text="Please Enter The Artwork ID"></asp:Label>
                    
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtManageSearchID" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                </td>
                <td class="auto-style5">
                      <asp:Label ID="Label2" runat="server" Text="Artists"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtManageSearchArtists" runat="server"></asp:TextBox>

                </td>
            </tr>
             
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                      
                <td class="auto-style10">
               
              
                    <asp:Button ID="btnManageSearch" runat="server" Text="Search" Width="117px" BackColor="#006666" Font-Bold="True" ForeColor="White" Height="36px" />
               
              
            </tr>
            

        </table>
       <table>
           <tr>
               <td class="auto-style9">

               </td>
                
               <td>
                   <asp:Image ID="Image1" runat="server" Height="182px" Width="373px" CssClass="auto-style4" />
               </td>
           </tr>

           <tr>
               <td class="auto-style9">

               </td>
               <td class="auto-style12">
                   <table>
                       <tr>
                           <td>

                               <asp:Label ID="Label3" runat="server" Text="Artword ID"></asp:Label></td>
                           <td>
                               <asp:Label ID="lblManageSearchID" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label ID="Label4" runat="server" Text="Artwork Name"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblManageSearchName" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label ID="Label5" runat="server" Text="Artists"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblManageSearchArtists" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label ID="Label6" runat="server" Text="Painting Categories"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblManageSearchCateg" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style13">
                               <asp:Label ID="Label7" runat="server" Text="Painting Style"></asp:Label>
                           </td>
                           <td class="auto-style13">
                               <asp:Label ID="lblManageSearchStyle" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label ID="Label8" runat="server" Text="Painting Techniques"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblManageSearchTechniq" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:Label ID="Label9" runat="server" Text="Price"></asp:Label>
                           </td>
                           <td>
                               <asp:Label ID="lblManageSearchPrice" runat="server"></asp:Label>
                           </td>
                       </tr>

                   </table>
               </td>
           </tr>
          
       </table>
      
        <div class="auto-style14">
            <asp:Button ID="btnBack" runat="server" Text="Back" BackColor="#006666" Font-Bold="True" ForeColor="White" Height="35px" Width="104px" />

        </div>
       
    </form>
</body>
</html>