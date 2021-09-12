<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditGallery.aspx.cs" Inherits="Assignment.EditGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto; background-color: #D2ECF2;">
             Edit
         Gallery
        <br />
    </header>

    
        
        <br />
        <br />
        
        <table class="auto-style1 tablestyle" style="table-layout: fixed;">
            <tr>
                 <td class="auto-style14">
                         <asp:Label ID="Label2" runat="server" Text="Artwork ID" Font-Size="Medium"></asp:Label>
                   </td>
                  <td class="auto-style15">
                         <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
               </td>
        </tr>
            <tr>

                <td class="auto-style18" style="background-color: #D2ECF2">
                      <asp:Label ID="Label10" runat="server" Text="Artwork Name"></asp:Label>

                </td>
                <td class="auto-style19" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtEditName" runat="server" ></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label11" runat="server" Text="Artists"></asp:Label>

                </td>
                <td class="auto-style7">

                    <asp:TextBox ID="txtEditArtists" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label12" runat="server" Text="Painting Categories"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlEditPaintCatego" runat="server">
                        <asp:ListItem>Animals</asp:ListItem>
                        <asp:ListItem>Abstraction</asp:ListItem>
                        <asp:ListItem>Fantasy</asp:ListItem>
                        <asp:ListItem>Landscape</asp:ListItem>
                        <asp:ListItem>Nature</asp:ListItem>
                        <asp:ListItem>Portrait</asp:ListItem>
                        <asp:ListItem>Urban</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="auto-style26">

                    <asp:Label ID="Label13" runat="server" Text="Painting Style"></asp:Label>

                </td>
                <td class="auto-style27">

                    <asp:DropDownList ID="ddlEditPaintingStyle" runat="server">
                        <asp:ListItem>Abstract</asp:ListItem>
                        <asp:ListItem>Comics</asp:ListItem>
                        <asp:ListItem>Fine Art</asp:ListItem>
                        <asp:ListItem>Geometric</asp:ListItem>
                        <asp:ListItem>Vintage</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="auto-style18" style="background-color: #D2ECF2">

                    <asp:Label ID="Label14" runat="server" Text="Painting Techniques"></asp:Label>

                </td>
                <td class="auto-style24" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlEditPaintTechniques" runat="server">
                        <asp:ListItem>Acrylic</asp:ListItem>
                        <asp:ListItem>Chalk</asp:ListItem>
                        <asp:ListItem>Collage</asp:ListItem>
                        <asp:ListItem>Earth</asp:ListItem>
                        <asp:ListItem>Ink</asp:ListItem>
                        <asp:ListItem>Objects</asp:ListItem>
                        <asp:ListItem>Oil Pastel</asp:ListItem>
                        <asp:ListItem>Pencil</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label15" runat="server" Text="Price"></asp:Label>

                </td>
                <td class="auto-style25">

                    <asp:TextBox ID="txtEditPrice" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label16" runat="server" Text="Stock"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtEditStock" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                
                <td>

                    Photo<br />
                    
                     <asp:Image ID="Image1" runat="server" />
                    
                </td>
                <td>
                   

                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" ForeColor="Black" onchange="previewFile()"/>
                    
                    <asp:Label ID="lblUploadPic" runat="server" ForeColor="#CC3300"></asp:Label>
                &nbsp;
                    <asp:Button ID="btnChangePic" runat="server" OnClick="btnChangePic_Click" Text="Change Picture" />
                </td>
            </tr>
            
        </table>

         <br />
         <br />

        <br />
        <div class="center">
        <asp:Label ID="lblInformation" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label>
            <br />
        </div>
        <br />
        
        <div class="center">
            <br/>
             <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="33px" Width="87px" BackColor="#000066" Font-Bold="True" ForeColor="White" OnClick="btnUpload_Click"  />
        </div>
    </form>
</body>
</html>
