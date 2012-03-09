<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_order" DataSourceID="SqlDataSourceGetOrders"
            EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
            Width="440px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id_order" HeaderText="Order Number" InsertVisible="False"
                    ReadOnly="True" SortExpression="id_order" />
                <asp:BoundField DataField="date" HeaderText="Order Date" SortExpression="date" />
                <asp:BoundField DataField="title" HeaderText="Product" SortExpression="title" />
                <asp:BoundField DataField="order_total" HeaderText="Total €" SortExpression="order_total" />
                <asp:BoundField DataField="UserName" HeaderText="Costumer" SortExpression="UserName" />
                <asp:BoundField DataField="order_status" HeaderText="Status" SortExpression="order_status" />
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
        <asp:SqlDataSource ID="SqlDataSourceGetOrders" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
            SelectCommand="SELECT orders.id_order, orders.date, orders.order_total, orders.order_status, products.title, aspnet_Users.UserName FROM aspnet_Users INNER JOIN aspnet_Profile ON aspnet_Users.UserId = aspnet_Profile.UserId INNER JOIN orders ON aspnet_Users.UserId = orders.userid INNER JOIN products ON orders.id_product = products.id_product">
        </asp:SqlDataSource>
        <br />
</asp:Content>
