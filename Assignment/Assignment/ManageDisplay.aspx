<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="ManageDisplay.aspx.cs" Inherits="Assignment.ArtManageDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <style type="text/css">
        .auto-style2 {
            width: 1169px;
            height: 82px;
        }
        .auto-style3 {
            width: 223px;
        }
        .auto-style5 {
            width: 129px;
        }
        .auto-style6 {
            width: 49px;
        }
        .auto-style10 {
            height: 60px;
        }
        .auto-style14 {
            margin-left: 40px;
        }
    </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #339966; right: auto; left: auto">
        Search
        <br />
    </header>

   <center>
        <table class ="auto-style2">
            <tr>
                <td class="auto-style6">

                </td>
             
                <td class="auto-style5">
                     
                    
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server"></asp:TextBox>

                    <br />
                    <asp:Label ID="lblNotice" runat="server"></asp:Label>
                </td>
            </tr>
             
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                      
                <td class="auto-style10">
               
              
                    <asp:Button ID="btnManageSearch"  runat="server" Text="Search" Width="117px" BackColor="#006666" Font-Bold="True" ForeColor="White" Height="36px" OnClick="btnManageSearch_Click" />
               </td>
              
            </tr>
            

        </table>
       
          
              <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CellPadding="3" CellSpacing="3">
                  <ItemTemplate>
                      <table>
                          <tr>
                              <td>
                                  ID:
                                  <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                  <br />
                                  Name:
                                  <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                  <br />
                                  Artists:
                                  <asp:Label ID="artistsLabel" runat="server" Text='<%# Eval("artists") %>' />
                                  <br />
                                  Painting Categories:
                                  <asp:Label ID="paintCateLabel" runat="server" Text='<%# Eval("paintCate") %>' />
                                  <br />
                                  Painting Style:
                                  <asp:Label ID="paintStyleLabel" runat="server" Text='<%# Eval("paintStyle") %>' />
                                  <br />
                                  Painting Technique:
                                  <asp:Label ID="paintTechLabel" runat="server" Text='<%# Eval("paintTech") %>' />
                                  <br />
                                   Price:RM
                                  <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                  <br />
                                  Image:
                                  <asp:Image ID="Image2" runat="server" width ="300px" Height="300px" ImageUrl='<%#"data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>'/>
                                  <br />
                                  stock:
                                  <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                              </td>
                          </tr>
                      </table>
                  </ItemTemplate>
              </asp:DataList>

          </center>
</asp:Content>  