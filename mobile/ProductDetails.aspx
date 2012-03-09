<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="mobile_NewsDetails" %>

<form id="formProducts" runat="server">
<asp:datalist id="DataList1" runat="server" datakeyfield="id_product" datasourceid="SqlDataSourceGetProduct"
    repeatlayout="Flow" showfooter="False" showheader="False">
    <ItemTemplate>
        <div class="toolbar">
            <h1>
                <%# Eval("title") %></h1>
                <a class="button back" href="#">Products</a>
        </div>
        <img src="../files/products/<%# Eval("id_product") %>.jpg" width="100px" height="100px" style="padding-top:10px; padding-left:30px;" />
        <div id="field-details">
            <ul>
                <li>
                    <p>Added in: <%# Eval("posted", "{0:d}") %>.</p>
                    <br />
                    <p>Description: <%# Eval("description") %></p>
                    <a class="button" href="#purchase" onclick="loadXMLDocProductConfirmPurchase(<%# Eval("id_product") %>)"><%# Eval("price") %> €</a>
                </li>
            </ul>
        </div>
    </ItemTemplate>
</asp:datalist>
<asp:sqldatasource id="SqlDataSourceGetProduct" runat="server" connectionstring="<%$ ConnectionStrings:connectionloja %>"
    providername="<%$ ConnectionStrings:connectionloja.ProviderName %>" selectcommand="SELECT [id_product], [title], [description], [posted], [id_category], [price] FROM [products] WHERE ([id_product] = @id_product)">
    <SelectParameters>
        <asp:QueryStringParameter Name="id_product" QueryStringField="id" 
            Type="Int32" />
    </SelectParameters>
</asp:sqldatasource>
</form>