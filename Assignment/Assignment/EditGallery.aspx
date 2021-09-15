<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="EditGallery.aspx.cs" Inherits="Assignment.EditGallery" %>

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
                         <asp:Label ID="lblID" runat="server" ></asp:Label>
               </td>
        </tr>
            <tr>

                <td class="auto-style18" style="background-color: #D2ECF2">
                      <asp:Label ID="Label10" runat="server" Text="Artwork Name"></asp:Label>

                </td>
                <td class="auto-style19" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtEditName" runat="server" ></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegName" runat="server" ControlToValidate="txtEditName" ValidationExpression="^[a-zA-Z'.\s]{1,50}" Text="Only Alphabet." ForeColor="Red" ></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="ReqName" runat="server" ErrorMessage="Cannot Empyt." ControlToValidate="txtEditName" CssClass="error" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label11" runat="server" Text="Artists"></asp:Label>

                </td>
                <td class="auto-style7">

                    <asp:TextBox ID="txtEditArtists" runat="server"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEditArtists" CssClass="error" Display="Dynamic" ErrorMessage="Only Alphabet." ForeColor="Red" ></asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="ReqArtists" runat="server" ErrorMessage="Cannot Empyt." ControlToValidate="txtEditArtists" CssClass="error" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

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

                    <br />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please make a selection" ControlToValidate="ddlEditPaintCatego" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
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

                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please make a selection" ControlToValidate="ddlEditPaintingStyle" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style18" style="background-color: #D2ECF2">

                    <asp:Label ID="Label14" runat="server" Text="Size"></asp:Label>

                </td>
                <td class="auto-style24" style="background-color: #D2ECF2">

                    <asp:DropDownList ID="ddlEditPaintTechniques" runat="server">
                        <asp:ListItem Value="Mini (8'' x 10'')">Mini (8&#39;&#39; x 10&#39;&#39;)</asp:ListItem>
                        <asp:ListItem>Small (12&#39;&#39;x18&#39;&#39;)</asp:ListItem>
                        <asp:ListItem>Medium (18&#39;&#39;x24&#39;&#39;)</asp:ListItem>
                        <asp:ListItem>Large (24&#39;&#39;x36&#39;&#39;)</asp:ListItem>
                        <asp:ListItem>Oversized (36&#39;&#39;x48&#39;&#39;)</asp:ListItem>
                        <asp:ListItem>Gaint (48&#39;&#39;x64&#39;&#39;)</asp:ListItem>
                    </asp:DropDownList>

                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please make a selection" ControlToValidate="ddlEditPaintTechniques" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>


                </td>
            </tr>
            <tr>
                <td class="auto-style17">

                    <asp:Label ID="Label15" runat="server" Text="Price"></asp:Label>

                </td>
                <td class="auto-style25">

                    <asp:TextBox ID="txtEditPrice" runat="server"></asp:TextBox>

                    <br />

                    <asp:RegularExpressionValidator ID="regPrice" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" runat="server" ErrorMessage="Only numeric allowed." ControlToValidate="txtEditPrice" Display="Dynamic" ForeColor="Red" ></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="ReqPrice" runat="server" ErrorMessage="Cannot Empyt." ControlToValidate="txtEditPrice" CssClass="error" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

                </td>
            </tr>
            
            <tr>
                <td class="auto-style17" style="background-color: #D2ECF2">

                    <asp:Label ID="Label16" runat="server" Text="Stock"></asp:Label>

                </td>
                <td class="auto-style25" style="background-color: #D2ECF2">

                    <asp:TextBox ID="txtEditStock" runat="server"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegStock" ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate" runat="server" ControlToValidate="txtEditStock" ErrorMessage="Only numeric allowed."  ForeColor="Red" ></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="ReqStock" runat="server" ErrorMessage="Cannot Empyt." ControlToValidate="txtEditStock" CssClass="error" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

                </td>
            </tr>
            
            <tr>
                
                <td class="auto-style1">

                    Photo<br />
                    
                     <asp:Image ID="Image1" runat="server" width ="300px" Height="300px" />
                    
                </td>
                <td class="auto-style1">
                   

                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" ForeColor="Black" onchange="previewFile()" CausesValidation = "false"/>
                    
                    <asp:Label ID="lblUploadPic" runat="server" ForeColor="#CC3300"></asp:Label>
                &nbsp;
                    </td>
            </tr>
            
        </table>

         <br />
         <br />
         <br />

        <br />
        <div class="center">
            <center>

            
        <asp:Label ID="lblInformation" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label>
            <br />
            </center>
        </div>
        <br />
        
        <div class="center">
            <center>

            
            <br/>
             <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="40px" Width="127px" BackColor="#000066" Font-Bold="True" ForeColor="White" OnClick="btnUpload_Click"  />
         &nbsp;&nbsp;
         <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("id") %>' Text="Delete" BackColor="#000066" Font-Bold="True" ForeColor="White" Height="40px" OnClick="btnDelete_Click" Width="127px" />
         </center>
       
            </div>
</asp:Content>  