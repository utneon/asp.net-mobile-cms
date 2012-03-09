<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="admin_Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul>
        <li>
            <asp:HyperLink ID="LinkSupportManage" runat="server" NavigateUrl="~/admin/support.aspx?view=manage"
                CssClass="selectedview">View Ticket Requests</asp:HyperLink></li>
    </ul>
    <div id="newsManagmentSection">
        <asp:MultiView ID="MultiViewSupport" runat="server" ActiveViewIndex="0">
            <asp:View ID="manage" runat="server">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceSupportRequestsManage"
                    ForeColor="#333333" GridLines="None" Width="440px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField Text="View Ticket" DataNavigateUrlFields="id_mensagem" DataNavigateUrlFormatString="~/admin/Support.aspx?view=viewticketdetails&amp;id={0}" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="assunto" HeaderText="Subject" SortExpression="assunto" />
                        <asp:BoundField DataField="UserName" HeaderText="Costumer" SortExpression="UserName" />
                        <asp:BoundField DataField="status" HeaderText="Ticket Status" SortExpression="status" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:Label ID="messageDetails" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceSupportRequestsManage" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    SelectCommand="SELECT support.id_mensagem, support.date, support.assunto, aspnet_Users.UserName, support.status FROM support INNER JOIN aspnet_Users ON support.userid = aspnet_Users.UserId WHERE support.direction = 1 ORDER BY support.date DESC">
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="reply" runat="server">
                <asp:DetailsView ID="DetailsViewTicketDetails" runat="server" AutoGenerateRows="False"
                    CellPadding="4" DataKeyNames="id_mensagem" DataSourceID="SqlDataSourceGetTicketDetails"
                    ForeColor="#333333" GridLines="None" Height="50px" Width="440px" HeaderText="Support Ticket Details">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id_mensagem" HeaderText="Ticket Number" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_mensagem" />
                        <asp:BoundField DataField="UserName" HeaderText="Costumer Username" SortExpression="UserName" />
                        <asp:BoundField DataField="assunto" HeaderText="Subject" SortExpression="assunto" />
                        <asp:BoundField DataField="mensagem" HeaderText="Ticket Message" SortExpression="mensagem" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <asp:HyperLink ID="replyTicketLink" runat="server" Text="Reply to this Ticket"></asp:HyperLink>
                <asp:SqlDataSource ID="SqlDataSourceGetTicketDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    SelectCommand="SELECT support.id_mensagem, aspnet_Users.UserName, support.assunto, support.mensagem, support.date, support.status FROM aspnet_Users INNER JOIN support ON aspnet_Users.UserId = support.userid WHERE support.id_mensagem = @id_ticket">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id_ticket" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="ticketreplyview" runat="server">
                <p>
                    Support Request Reply:
                </p>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="useridLabel" runat="server" CssClass="dontdisplay"></asp:Label>
                            <asp:TextBox ID="resposta" runat="server" TextMode="MultiLine" Width="440px" Height="200px"></asp:TextBox>
                            <asp:Label ID="mensagemidLabel" runat="server" CssClass="dontdisplay"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <asp:Label ID="mensagemErro" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
