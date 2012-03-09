<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="mobile_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="jqtouch/jqtouch.css" rel="stylesheet" type="text/css" />
    <link href="themes/apple/theme.css" rel="stylesheet" type="text/css" />
    <script src="jqtouch/jquery.js" type="text/javascript"></script>
    <script src="jqtouch/jqtouch.js" type="text/javascript"></script>
    <link href="css/mobilecms.css" rel="stylesheet" type="text/css" />
    <script src="scripts/mobilecms.js" type="text/javascript"></script>
    <link rel="apple-touch-startup-image" href="images/startup.png" />
    <link rel="apple-touch-icon" href="images/icon.png" />
    <title>Interface Mobile</title>
</head>
<body>
    <div id="home">
        <form id="form1" runat="server">
        <div class="toolbar">
            <h1>
                Mobile</h1>
            <a class="button slideup" href="#about">About</a>
        </div>
        <ul class="edgetoedge">
            <li class="arrow"><a href="#news">News</a></li>
            <li class="arrow"><a href="#products">Products</a></li>
        </ul>
        <img src="images/mobilecms.png" style="width: 100%" />
    </div>
    <div id="about">
        <div class="toolbar">
            <h1>
                About</h1>
            <a class="button back" href="#">Home</a>
        </div>
        <div>
            <div id="field-details">
                <ul>
                    <li>
                        <p>
                            Trabalho Prático<br />
                            <br />
                            Desenvolvimento de aplicações web.
                            <br />
                            <br />
                            ASP.Net
                            <br />
                            <br />
                            Using JQTouch Mobile Interface
                            <br />
                            <br />
                            Author:
                        </p>
                        <ul class="rounded">
                            <li class="arrow"><a target="_blank" href="http://www.utneon.com">Paulo Carvalho</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="news">
        <div class="toolbar">
            <h1>
                News</h1>
            <a class="button back" href="#">Home</a>
        </div>
        <ul class="edgetoedge">
            <asp:Repeater ID="RepeaterNewsList" runat="server" DataSourceID="SqlDataSourceGetContentTypeNoticias">
                <ItemTemplate>
                    <li class="sep">
                        <%#Eval("postdate", "{0:d}") %></li>
                    <li class="arrow"><a href="#newsDetails" onclick="loadXMLDocNews(<%# Eval("id_content") %>)">
                        <%# Eval("title") %></a></li></ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceGetContentTypeNoticias" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                SelectCommand="SELECT [id_content], [title], [postdate], [mobile_body] FROM [content] WHERE ([IsMobileActive] = @IsMobileActive) AND ([id_contentType] = 1) ORDER BY [postdate] DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="IsMobileActive" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ul>
    </div>
    <div id="newsDetails">
    </div>
    <div id="products">
        <div class="toolbar">
            <h1>
                Products</h1>
            <a class="button back" href="#">Home</a>
        </div>
        <ul class="edgetoedge">
            <asp:DataList ID="DataListListProducts" runat="server" DataKeyField="id_product"
                DataSourceID="SqlDataSourceGetProductsList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <li class="sep">
                        <%#Eval("posted", "{0:d}") %>
                        -
                        <%#Eval("price") %>
                        €</li>
                    <li class="arrow">
                        <img src="../files/products/<%#Eval("id_product") %>.jpg" width="25px" height="25px"
                            style="display: inline-block; padding-right: 10px;" /><a href="#productDetails" style="display: inline-block;"
                                onclick="loadXMLDocProducts(<%# Eval("id_product") %>)">
                                <%# Eval("title") %></a></li>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceGetProductsList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                SelectCommand="SELECT [id_product], [title], [posted], [price] FROM [products] WHERE ([published] = @published)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="published" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ul>
    </div>
    <div id="productDetails">
    </div>
    <div id="purchase">
    </div>
    <div id="userauthenticate">
    </div>
    <div id="purchaseCompleted">
    </div>
    <!-- div para futuro uso -->
    <div id="support">
        <div class="toolbar">
            <h1>
                Support</h1>
            <a class="button back" href="#">Home</a>
        </div>
        <ul class="edgetoedge">
            <li class="arrow"><a href="#send-ticket">Send Ticket</a></li>
            <li class="arrow"><a href="#view-ticket">View Support Tickets</a></li>
        </ul>
    </div>
    </div> </form>
</body>
</html>
