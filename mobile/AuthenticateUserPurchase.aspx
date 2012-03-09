<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AuthenticateUserPurchase.aspx.cs" Inherits="mobile_AuthenticateUserPurchase" %>

<form id="Authenticate" runat="server">
<asp:datalist id="DataList1" runat="server" datakeyfield="id_product" datasourceid="SqlDataSourceConfirmProductPurchase"
    repeatlayout="Flow" showfooter="False" showheader="False">
    <ItemTemplate>
        <div class="toolbar">
            <h1>
                Authenticate</h1>
                <a class="button back" href="#">Cancel</a>
        </div>
        <div id="field-details">
            <ul>
                <li>
                    <label>Username: </label> <input type="text" style="border-style:solid; border-width:1px;" required="required" id="userAuthLog" />
                    <br />
                    <label>Password: </label> <input type="password" style="border-style:solid; border-width:1px;" required="required" id="userPassLog" />

                    <a class="button" href="#purchaseCompleted" onclick="loadXMLDocAuthenticate('<%# Eval("id_product") %>','<%# Eval("price") %>')">Login</a>
                </li>
            </ul>
        </div>
    </ItemTemplate>
</asp:datalist>
<asp:SqlDataSource ID="SqlDataSourceConfirmProductPurchase" runat="server" 
    ConnectionString="<%$ ConnectionStrings:connectionloja %>" 
    SelectCommand="SELECT [id_product], [price] FROM [products] WHERE ([id_product] = @id_product)">
    <SelectParameters>
        <asp:QueryStringParameter Name="id_product" QueryStringField="id" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</form>