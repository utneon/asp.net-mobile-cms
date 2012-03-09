<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="mobile_NewsDetails" %>

<form id="form1" runat="server">
<asp:datalist id="DataList1" runat="server" datakeyfield="id_content" datasourceid="SqlDataSourceGetNewsArticle"
    repeatlayout="Flow" showfooter="False" showheader="False">
    <ItemTemplate>
        <div class="toolbar">
            <h1>
                <%# Eval("title") %></h1>
                <a class="button back" href="#">News</a>
        </div>
        <div id="field-details">
            <ul>
                <li>
                    <p><%# Eval("mobile_body") %></p>
                    <br />
                    <p><%# Eval("postdate", "{0:d}") %></p>
                </li>
            </ul>
            
        </div>
    </ItemTemplate>
</asp:datalist>
<asp:sqldatasource id="SqlDataSourceGetNewsArticle" runat="server" connectionstring="<%$ ConnectionStrings:connectionloja %>"
    providername="<%$ ConnectionStrings:connectionloja.ProviderName %>" 
    selectcommand="SELECT [id_content], [title], [postdate], [mobile_body] FROM [content] WHERE ([id_content] = @id_content)">
    <SelectParameters>
        <asp:QueryStringParameter Name="id_content" QueryStringField="id" 
            Type="Int32" />
    </SelectParameters>
</asp:sqldatasource>
</form>
