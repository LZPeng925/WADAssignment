<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Project.Master" CodeBehind="PaymentHistory.aspx.cs" Inherits="Assignment.PaymentHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
</asp:Content>  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div>
            <table style="width:100%;">
                <tr>
                    <td style="text-align:center" colspan="2"><h1>Payment History</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="historyID" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
                            <ItemTemplate>
                                History ID:
                                <asp:Label ID="historyIDLabel" runat="server" Text='<%# Eval("historyID") %>' />
                                <br />
                                Payment Date:
                                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                                <br />
                                Pay Time:
                                <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                                <br />
                                TotalPrice:
                                <asp:Label ID="TotalPriceLabel" runat="server" Text='<%# Eval("TotalPrice") %>' />
                                <br />
                                Quantity:
                                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <asp:Button ID="Button1" runat="server" PostBackUrl="~/Display.aspx" Text="Back" Width="230px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT historyID, FORMAT(dateTime, 'dd-MM-yyyy') AS Date, FORMAT(dateTime, 'hh:mm tt') AS Time, FORMAT(price, '.00') AS TotalPrice, quantity FROM History WHERE (UserName = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>  