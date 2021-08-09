<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="PaymentHistory.aspx.cs" Inherits="Assignment.PaymentHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="2">Payment History<br />
                        UserID:<asp:Label ID="lblUserID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="historyID">
                            <ItemTemplate>
                                historyID:
                                <asp:Label ID="historyIDLabel" runat="server" Text='<%# Eval("historyID") %>' />
                                <br />
                                userID:
                                <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                                <br />
                                artworkID:
                                <asp:Label ID="artworkIDLabel" runat="server" Text='<%# Eval("artworkID") %>' />
                                <br />
                                Column1:
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
                                <br />
                                Column2:
                                <asp:Label ID="Column2Label" runat="server" Text='<%# Eval("Column2") %>' />
                                <br />
                                Column3:
                                <asp:Label ID="Column3Label" runat="server" Text='<%# Eval("Column3") %>' />
                                <br />
                                quantity:
                                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                <br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT historyID, userID, artworkID, FORMAT(dateTime, 'dd-MM-yyyy'), FORMAT(dateTime, 'hh:mm tt'), FORMAT(price, '.00'), quantity FROM History WHERE (userID = @userID)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblUserID" Name="userID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>  