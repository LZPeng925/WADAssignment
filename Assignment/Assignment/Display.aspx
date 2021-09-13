<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Display.aspx.cs" Inherits="Assignment.Display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        <style type="text/css">
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
            .auto-style1 {
                margin-top: 38px;
            }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
     <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto; background-color: #D2ECF2;">
        
         All Gallery<br />
    </header>
        <div>
            <br />
            <asp:Button ID="Button3" runat="server" BackColor="#000066" Font-Bold="True" ForeColor="White" Text="Edit" Width="125px" OnClick="Button3_Click" />
            <br />
            <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server"></asp:TextBox>
                    <br />
            <asp:Label ID="lblNotice" runat="server"></asp:Label>
                    <br />
            <asp:Button ID="btnManageSearch"  runat="server" Text="Search" Width="117px" BackColor="#006666" Font-Bold="True" ForeColor="White" Height="36px" OnClick="btnManageSearch_Click" />
            
            <asp:DataList class="tablestyle" ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" GridLines="Both" BackColor="AntiqueWhite" BorderColor="#999999" BorderWidth="1px" CellPadding="3" OnItemCommand="DataList1_ItemCommand" RepeatColumns="5" CssClass="auto-style1" Height="608px">
                <ItemTemplate>
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
                    <br />
                          <asp:ImageButton ID="Button1" runat="server" CommandName="AddToCart" Text="Add To Cart" Height="40px" Width="40px" ImageUrl="https://cdn.iconscout.com/icon/free/png-256/add-in-shopping-cart-461858.png" />
                          &nbsp;<asp:ImageButton ID="Button2" runat="server" CommandName="AddToWishlist" Text="Add To WishList" Height="40px" Width="40px" ImageUrl="https://icons-for-free.com/iconfiles/png/512/heart-131965017458786724.png" />
                          
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [artwork]"></asp:SqlDataSource>
            
            <asp:DataList ID="DataList3" runat="server" RepeatColumns="3" CellPadding="3" CellSpacing="3">
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







            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [artwork] WHERE ([artists] = @artists)">
                <SelectParameters>
                    <asp:SessionParameter Name="artists" SessionField="Username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList2" class="tablestyle" runat="server" DataKeyField="id" DataSourceID="SqlDataSource2" GridLines="Both" RepeatDirection="Horizontal" BackColor="AntiqueWhite" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <ItemTemplate>
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
                    <asp:Image ID="Image3" runat="server" width ="300px" Height="300px" ImageUrl='<%#"data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>'/>
                    <br />
                    stock:
                    <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
</asp:Content>  