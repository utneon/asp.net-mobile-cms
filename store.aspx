<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="store.aspx.cs" Inherits="storeaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_product" DataSourceID="SqlDataSourceGetProductsFromCategory"
        EmptyDataText="There are no products available in the requested category." ForeColor="#333333"
        GridLines="None" Width="440px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id_product" 
                DataNavigateUrlFormatString="~/ProductAdd.aspx?id={0}" Text="Add to Cart" />
            <asp:BoundField DataField="title" HeaderText="Product Name" SortExpression="title" />
            <asp:TemplateField HeaderText="Sell Price" SortExpression="price">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ImageField DataAlternateTextField="id_product" DataAlternateTextFormatString="image of product {0}"
                DataImageUrlField="id_product" DataImageUrlFormatString="~/files/products/{0}.jpg"
                HeaderText="Product Image">
                <ItemStyle CssClass="product-image" />
            </asp:ImageField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceGetProductsFromCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
        SelectCommand="SELECT [id_product], [title], [price] FROM [products] WHERE ([id_category] = @id_category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_category" QueryStringField="category" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
