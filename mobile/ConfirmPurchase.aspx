<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="mobile_NewsDetails" %>

<form id="formProductsConfirm" runat="server">
<asp:datalist id="DataList1" runat="server" datakeyfield="id_product"
    repeatlayout="Flow" showfooter="False" showheader="False" 
    DataSourceID="SqlDataSourceGetProductDetailsConfirmation">
    <ItemTemplate>
        <div class="toolbar">
            <h1>
                Purchase <%# Eval("title") %>?</h1>
                <a class="button back" href="#">No</a>
        </div>
        <img src="../files/products/<%# Eval("id_product") %>.jpg" width="100px" height="100px" style="padding-top:10px; padding-left:30px;" />
        <div id="field-details">
            <ul>
                <li>
                    <p>Do you really want to purchase this item?</p>
                    <br />
                    <p>Total price: <span style="color:#ff6666;"><%# Eval("price") %> €</span></p>
                    <a class="button" href="#userauthenticate" onclick="loadXMLDocUserAuth(<%# Eval("id_product") %>)">Yes</a>
                </li>
            </ul>
        </div>
    </ItemTemplate>
</asp:datalist>
<asp:SqlDataSource ID="SqlDataSourceGetProductDetailsConfirmation" 
    runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>" 
    SelectCommand="SELECT [id_product], [title], [price] FROM [products] WHERE ([id_product] = @id_product)">
    <SelectParameters>
        <asp:QueryStringParameter Name="id_product" QueryStringField="id" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</form>