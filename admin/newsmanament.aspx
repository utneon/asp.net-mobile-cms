<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="newsmanament.aspx.cs" Inherits="admin_newsmanament" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../jquery-ui-1.8.13.custom/js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../jquery-ui-1.8.13.custom/js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
    <script src="../jquery-ui-1.8.13.custom/development-bundle/ui/jquery.ui.core.js"
        type="text/javascript"></script>
    <script src="../jquery-ui-1.8.13.custom/development-bundle/ui/jquery.ui.datepicker.js"
        type="text/javascript"></script>
    <link href="../jquery-ui-1.8.13.custom/css/ui-lightness/jquery-ui-1.8.13.custom.css"
        rel="stylesheet" type="text/css" />
    <script>
        var currentTime = new Date();
        var month = currentTime.getMonth() + 1;
        var day = currentTime.getDate();
        var year = currentTime.getFullYear();
        var d = year + "-" + month + "-" + day;
        var d = day + "-" + month + "-" + year;
        $(function () {
            $("#ContentPlaceHolder1_DetailsView1_dateposted").datepicker({ dateFormat: 'dd-mm-yy' }).val(d);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <ul>
            <li>
                <asp:HyperLink ID="LinkNewsManage" runat="server" NavigateUrl="~/admin/newsmanament.aspx?view=manage">News Managment</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="LinkNewsCreate" runat="server" NavigateUrl="~/admin/newsmanament.aspx?view=create">Create News Article</asp:HyperLink></li>
        </ul>
        <div id="newsManagmentSection">
            <asp:MultiView ID="NewsMultiView" runat="server" ActiveViewIndex="0">
                <asp:View runat="server" ID="newsManage">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="id_new" DataSourceID="SqlDataSourceNewsManage"
                        EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None"
                        Width="420px" OnRowDeleted="deletedNews">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                            <asp:BoundField DataField="body" HeaderText="Article" SortExpression="body" />
                            <asp:TemplateField HeaderText="Date" SortExpression="posted">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("posted","{0:D}") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="id_new" DataNavigateUrlFormatString="newsmanament.aspx?view=update&amp;id_new={0}"
                                Text="Edit" />
                            <asp:CommandField ShowDeleteButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSourceNewsManage" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        DeleteCommand="DELETE FROM [news] WHERE [id_new] = @id_new" ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>"
                        SelectCommand="SELECT [id_new], [title], [body], [posted], [published] FROM [news] ORDER BY [posted] DESC, [id_new] DESC">
                        <DeleteParameters>
                            <asp:Parameter Name="id_new" Type="Int32" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View runat="server" ID="newsCreate">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_new"
                        DataSourceID="SqlDataSourceNewsCreate" DefaultMode="Insert" Height="50px" Width="440px"
                        OnItemInserted="insertedNews" OnItemCommand="commandNews" CellPadding="4" ForeColor="#333333"
                        GridLines="None" HeaderText="Create a News Article">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="id_new" HeaderText="id_new" InsertVisible="False" ReadOnly="True"
                                SortExpression="id_new" />
                            <asp:TemplateField HeaderText="News Title" SortExpression="title">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                        Display="Dynamic" ErrorMessage="The news title is required"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Article" SortExpression="body">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("body") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                                        Display="Dynamic" ErrorMessage="The news body is required"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date of Article" SortExpression="posted">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="dateposted" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ControlToValidate="dateposted"
                                        Display="Dynamic" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidatorPosted" runat="server" ErrorMessage="Enter a valid date!"
                                        Type="Date" ControlToValidate="dateposted" MaximumValue="1-1-2012" MinimumValue="1-1-2010"></asp:RangeValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Published?" SortExpression="published">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("published") %>'>
                                        <asp:ListItem Selected="True" Value="1">Published</asp:ListItem>
                                        <asp:ListItem Value="0">Unpublished</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceNewsCreate" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        InsertCommand="INSERT INTO [news] ([title], [body], [posted], [published]) VALUES (@title, @body, @posted, @published)"
                        ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [id_new], [title], [body], [posted], [published] FROM [news]">
                        <InsertParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="body" Type="String" />
                            <asp:Parameter DbType="Date" Name="posted" />
                            <asp:Parameter Name="published" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View runat="server" ID="NewsUpdate">
                    <asp:SqlDataSource ID="SqlDataSourceNewsUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        DeleteCommand="DELETE FROM [news] WHERE [id_new] = @id_new" InsertCommand="INSERT INTO [news] ([title], [body], [posted], [published]) VALUES (@title, @body, @posted, @published)"
                        ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [id_new], [title], [body], [posted], [published] FROM [news] WHERE [id_new] = @id_new"
                        UpdateCommand="UPDATE [news] SET [title] = @title, [body] = @body, [published] = @published WHERE [id_new] = @id_new">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id_new" QueryStringField="id_new" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="title" Type="String" />
                            <asp:Parameter Name="body" Type="String" />
                            <asp:Parameter DbType="Date" Name="posted" />
                            <asp:Parameter Name="published" Type="Int32" />
                            <asp:Parameter Name="id_new" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4"
                        DataKeyNames="id_new" DataSourceID="SqlDataSourceNewsUpdate" DefaultMode="Edit" HeaderText="Edit News Article"
                        ForeColor="#333333" GridLines="None" Height="50px" Width="440px" OnItemCommand="commandNews"
                        OnItemUpdated="updatedNews">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:TemplateField HeaderText="News Title" SortExpression="title">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Body" SortExpression="body">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("body") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" SortExpression="posted" ShowHeader="False" InsertVisible="True"
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Published" SortExpression="published">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("published") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                </asp:View>
            </asp:MultiView>
            <asp:Label ID="mensagemErro" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
