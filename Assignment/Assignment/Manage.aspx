<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="Manage.aspx.cs" Inherits="Assignment.ArtworkManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
     <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Image2.ClientID %>');
            var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                preview.src = reader.result;
            }
            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 453px;
            width: 684px;
            margin-left: 29px;
            margin-right: 0px;
            margin-top: 0px;
        position: relative;
    }
        .auto-style7 {
            height: 40px;
            width: 247px;
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
        .tablestyle {
            margin-left: auto;
            margin-right: auto;
        }
        </style>
</asp:Content>  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
     <header style="font-size: xx-large; font-weight: bold; font-family: Georgia, 'Times New Roman', Times, serif; text-transform: uppercase; color: #000080; right: auto; left: auto; background-color: #D2ECF2;">
         Upload
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
                         <asp:Label ID="lblManageID" runat="server"></asp:Label>
               </td>
        </tr>
            <tr>

                <td class="auto-style18" style="background-color: #D2ECF2">
                      <asp:Label ID="Label10" runat="server" Text="Artwork Name"></asp:Label>

                </td>
                <td class="auto-style19" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtManageName" runat="server" ></asp:TextBox>

                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label11" runat="server" Text="Artists"></asp:Label>

                </td>
                <td class="auto-style7">

                    <asp:TextBox ID="txtManageArtists" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label12" runat="server" Text="Painting Categories"></asp:Label>

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

                    <asp:Label ID="Label13" runat="server" Text="Painting Style"></asp:Label>

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

                    <asp:Label ID="Label14" runat="server" Text="Painting Techniques"></asp:Label>

                </td>
                <td class="auto-style24" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlManagePaintTechniques" runat="server" OnSelectedIndexChanged="ddlManagePaintTechniques_SelectedIndexChanged">
                        <asp:ListItem>Acrylic</asp:ListItem>
                        <asp:ListItem>Chalk</asp:ListItem>
                        <asp:ListItem>Earth</asp:ListItem>
                        <asp:ListItem>Ink</asp:ListItem>
                        <asp:ListItem>Objects</asp:ListItem>
                        <asp:ListItem>Oil Pastel</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label15" runat="server" Text="Price"></asp:Label>

                </td>
                <td class="auto-style25">

                    <asp:TextBox ID="txtManagePrice" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label16" runat="server" Text="Stock"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtManageStock" runat="server"></asp:TextBox>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style26" style="background-color: #FAEBD7">

                    &nbsp;</td>
                <td class="auto-style27" style="background-color: #FAEBD7">

                    &nbsp;</td>
            </tr>
            
            <tr>
                
                <td>

                    Please Upload The Photo<br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" ForeColor="Black" onchange="previewFile()" Width="321px"/>
                    <br />
                    <br />
                    <asp:Label ID="lblUploadPic" runat="server" ForeColor="#CC3300"></asp:Label>
                    <br />
                    <br />
                </td>
                <td>

                    <asp:Image ID="Image2" runat="server" />

                </td>
            </tr>
            
        </table>

        <br />
        <div class="center">
        <asp:Label ID="lblInformation" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label>
        </div>
        <br />
        
        <div class="center">
            <br/>
             <asp:Button ID="Button2" runat="server" Text="Submit" Height="33px" Width="87px" BackColor="#000066" Font-Bold="True" ForeColor="White" OnClick="btnSubmit_Click"  />
        </div>
</asp:Content>  