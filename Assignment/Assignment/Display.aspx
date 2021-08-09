<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Display.aspx.cs" Inherits="Assignment.Display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
     <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto">
        
         All Gallery<br />
    </header>
        <div>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3">
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    artists:
                    <asp:Label ID="artistsLabel" runat="server" Text='<%# Eval("artists") %>' />
                    <br />
                    paintCate:
                    <asp:Label ID="paintCateLabel" runat="server" Text='<%# Eval("paintCate") %>' />
                    <br />
                    paintStyle:
                    <asp:Label ID="paintStyleLabel" runat="server" Text='<%# Eval("paintStyle") %>' />
                    <br />
                    paintTech:
                    <asp:Label ID="paintTechLabel" runat="server" Text='<%# Eval("paintTech") %>' />
                    <br />
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    image:
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
            <asp:DataList ID="DataList2" runat="server" DataKeyField="id" DataSourceID="SqlDataSource2" GridLines="Vertical" RepeatDirection="Horizontal" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    artists:
                    <asp:Label ID="artistsLabel" runat="server" Text='<%# Eval("artists") %>' />
                    <br />
                    paintCate:
                    <asp:Label ID="paintCateLabel" runat="server" Text='<%# Eval("paintCate") %>' />
                    <br />
                    paintStyle:
                    <asp:Label ID="paintStyleLabel" runat="server" Text='<%# Eval("paintStyle") %>' />
                    <br />
                    paintTech:
                    <asp:Label ID="paintTechLabel" runat="server" Text='<%# Eval("paintTech") %>' />
                    <br />
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    image:
                    <asp:Image ID="Image3" runat="server" width ="300px" Height="300px" ImageUrl='<%#"data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>'/>
                    <br />
                    stock:
                    <asp:Label ID="stockLabel" runat="server" Text='<%# Eval("stock") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText ="Artwork ID    " />
                     <asp:BoundField DataField="name" HeaderText ="Artwork Name    " />
                     <asp:BoundField DataField="artists" HeaderText ="Artists    " />
                     <asp:BoundField DataField="paintCate" HeaderText ="Painting Categories    " />
                    <asp:BoundField DataField="paintStyle" HeaderText ="Painting Style    " />
                    <asp:BoundField DataField="paintTech" HeaderText ="Painting Techniques    " />
                      <asp:BoundField DataField="price" HeaderText ="Price    " />
                      <asp:BoundField DataField="stock" HeaderText ="Stock" />


                    <asp:TemplateField HeaderText ="Image" >
                        <ItemTemplate>

                            <asp:Image ID="Image1" runat="server" width ="300px" Height="300px" ImageUrl='<%#"data:image/png;base64, "+Convert.ToBase64String((byte [])Eval ("image")) %>'/>

                        </ItemTemplate>


                    </asp:TemplateField>

                </Columns>


                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />


            </asp:GridView>
            <br />
            <br />
        </div>
</asp:Content>  