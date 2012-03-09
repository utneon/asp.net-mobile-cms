<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Support.aspx.cs" Inherits="Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginView ID="LoginViewSupport" runat="server">
        <AnonymousTemplate>
            <p>
                Please Login First to send a support ticket or
                <asp:HyperLink ID="registerSupport" runat="server" Text="register here" NavigateUrl="~/Register.aspx"></asp:HyperLink>.</p>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:MultiView ID="SupportMultiview" runat="server" ActiveViewIndex="0">
                <asp:View ID="SendTicket" runat="server">
                    <table>
                        <tr>
                            <td>
                                <label>
                                    Subject:
                                </label>
                            </td>
                            <td>
                                <asp:DropDownList ID="assunto" runat="server">
                                    <asp:ListItem Value="info" Text="General Information" Enabled="true" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="techsupport" Text="Technical Support" Enabled="true"></asp:ListItem>
                                    <asp:ListItem Value="orderssales" Text="Orders & Sales" Enabled="true"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Support Ticket:
                                </label>
                            </td>
                            <td>
                                <asp:TextBox ID="message" runat="server" TextMode="MultiLine">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Please enter a message." ControlToValidate="message" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="SubmitSupportTicketBtn" runat="server" Text="Send Ticket" OnClick="SubmitSupportTicketBtn_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="TicketReport" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="SqlDataSourceCostumerTicketView" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="assunto" HeaderText="assunto" SortExpression="assunto" />
                            <asp:BoundField DataField="mensagem" HeaderText="mensagem" SortExpression="mensagem" />
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
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
                    <asp:SqlDataSource ID="SqlDataSourceCostumerTicketView" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        SelectCommand="SELECT [assunto], [mensagem], [date], [status] FROM [support] WHERE ([direction] = @direction) AND ([userid] = @userid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="direction" Type="Int32" />
                            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="requestConfirmationView" runat="server">
                    <asp:Label ID="confirmationLabel" runat="server"></asp:Label>
                </asp:View>
            </asp:MultiView>
            <br />
            <asp:HyperLink ID="supportViewUserSupportTickers" runat="server" Text="Click Here to view your support tickets"
                NavigateUrl="~/Support.aspx?view=viewtickets"></asp:HyperLink>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
