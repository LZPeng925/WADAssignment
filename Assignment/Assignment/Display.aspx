﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Display.aspx.cs" Inherits="Assignment.Display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        <style type="text/css">
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
        </style>
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
     <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto; background-color: #D2ECF2;">
        
         All Gallery<br />
    </header>
        <div>
            <br />
            <asp:DataList class="tablestyle" ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" GridLines="Both" BackColor="antiquewhite" BorderColor="#999999" BorderWidth="1px" CellPadding="3">
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
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [artwork]"></asp:SqlDataSource>
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