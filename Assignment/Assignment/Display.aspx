<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="Assignment.Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

     <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto">
        
         All Gallery<br />
    </header>

    <form id="form1" runat="server">
        <div>
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
    </form>
</body>
</html>
