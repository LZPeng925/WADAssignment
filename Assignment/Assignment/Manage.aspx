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
        .auto-style6 {
            width: 247px;
        }
        .auto-style7 {
            height: 17px;
            width: 247px;
        }
        .auto-style10 {
            width: 238px;
        }
        .auto-style12 {
            height: 17px;
            width: 238px;
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
        </style>
</head>


<body style="height: 760px; margin-top: 27px; width: 731px;">

    <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #008000; right: auto; left: auto">
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

                <td class="auto-style10">
                      <asp:Label ID="Label3" runat="server" Text="Artwork Name"></asp:Label>

                </td>
                <td class="auto-style6">

                    <asp:TextBox ID="txtManageName" runat="server" OnTextChanged="txtManageName_TextChanged"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style12">

                    <asp:Label ID="Label4" runat="server" Text="Artists"></asp:Label>

                </td>
                <td class="auto-style7">

                    <asp:TextBox ID="txtManageArtists" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style10">

                    <asp:Label ID="Label5" runat="server" Text="Painting Categories"></asp:Label>

                </td>
                <td>

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
                <td class="auto-style10">

                    <asp:Label ID="lblPaintingStyle" runat="server" Text="Painting Style"></asp:Label>

                </td>
                <td>

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
                <td class="auto-style10">

                    <asp:Label ID="Label6" runat="server" Text="Painting Techniques"></asp:Label>

                </td>
                <td>

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
                <td class="auto-style10">

                    <asp:Label ID="Label7" runat="server" Text="Price"></asp:Label>

                </td>
                <td>

                    <asp:TextBox ID="txtManagePrice" runat="server"></asp:TextBox>

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
                </td>
            </tr>
            
        </table>

        <br />
&nbsp;&nbsp;
        <asp:Label ID="lblInformation" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>

        <br />
        
        <div >
             <br />
             &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" Height="33px" Width="87px" BackColor="#006666" Font-Bold="True" ForeColor="White" />

        &nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="33px" Width="87px" BackColor="#006666" Font-Bold="True" ForeColor="White"  />

        </div>

        


        

   </form>
</body>
</html>
