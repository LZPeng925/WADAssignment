<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Assignment.ArtworkManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 453px;
            width: 684px;
            margin-left: 29px;
            margin-right: 0px;
            margin-top: 0px;
        }
        .auto-style5 {
            height: 694px;
        }
        .auto-style7 {
            height: 40px;
            width: 247px;
        }
        .auto-style13 {
            width: 238px;
            height: 27px;
        }
        .auto-style14 {
            height: 10px;
            width: 238px;
        }
        .auto-style15 {
            height: 10px;
            width: 247px;
        }
        .auto-style17 {
            width: 238px;
            height: 40px;
        }
        .auto-style18 {
            width: 238px;
            height: 41px;
        }
        .auto-style19 {
            height: 41px;
            width: 247px;
        }
        .auto-style24 {
            height: 41px;
        }
        .auto-style25 {
            height: 40px;
        }
        .auto-style26 {
            width: 238px;
            height: 39px;
        }
        .auto-style27 {
            height: 39px;
        }
        </style>
</head>


<body style="height: 760px; margin-top: 27px; width: 731px;">

    <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto">
        CREATE
        <br />
    </header>

    <form id="form1" runat="server" class="auto-style5">
        
        <br />
        <br />
        
        <table class="auto-style1">
            <tr>
                 <td class="auto-style14">
                         <asp:Label ID="Label1" runat="server" Text="Artwork ID" Font-Size="Medium"></asp:Label>
                   </td>
                  <td class="auto-style15">
                         <asp:Label ID="lblManageID" runat="server"></asp:Label>
               </td>
        </tr>
            <tr>

                <td class="auto-style18" style="background-color: #D2ECF2">
                      <asp:Label ID="Label3" runat="server" Text="Artwork Name"></asp:Label>

                </td>
                <td class="auto-style19" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtManageName" runat="server" ></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label4" runat="server" Text="Artists"></asp:Label>

                </td>
                <td class="auto-style7">

                    <asp:TextBox ID="txtManageArtists" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label5" runat="server" Text="Painting Categories"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlManagePaintCatego" runat="server">
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

                    <asp:Label ID="lblPaintingStyle" runat="server" Text="Painting Style"></asp:Label>

                </td>
                <td class="auto-style27">

                    <asp:DropDownList ID="ddlManagePaintingStyle" runat="server">
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

                    <asp:Label ID="Label6" runat="server" Text="Painting Techniques"></asp:Label>

                </td>
                <td class="auto-style24" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlManagePaintTechniques" runat="server">
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

                    <asp:Label ID="Label7" runat="server" Text="Price"></asp:Label>

                </td>
                <td class="auto-style25">

                    <asp:TextBox ID="txtManagePrice" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label8" runat="server" Text="Stock"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtManageStock" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style13">

                    <asp:Image ID="Image1" runat="server" Width="279px" Height="322px" />

                </td>
                <td>

                    Please Upload The Photo<br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" ForeColor="Black" />
                    <br />
                    <br />
                    <asp:Label ID="lblUploadPic" runat="server" ForeColor="#CC3300"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            
        </table>

        <br />
&nbsp;&nbsp;
        <asp:Label ID="lblInformation" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label>

        <br />
        
        <div >
             <br />
             &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Height="33px" Width="87px" BackColor="#000066" Font-Bold="True" ForeColor="White" />

        &nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="33px" Width="87px" BackColor="#000066" Font-Bold="True" ForeColor="White" OnClick="btnSubmit_Click"  />

        </div>

        


        

   </form>
</body>
</html>
