<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="admin_Products" %>

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
            $("#ContentPlaceHolder1_DetailsView1_TextBox1").datepicker({ dateFormat: 'dd-mm-yy' }).val(d);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul>
        <li>
            <asp:HyperLink ID="LinkProductsManage" runat="server" NavigateUrl="~/admin/Products.aspx?view=manage"
                Text="Product Managment"></asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="LinkProductsCreate" runat="server" NavigateUrl="~/admin/Products.aspx?view=create"
                Text="Add new Product"></asp:HyperLink></li>
    </ul>
    <div id="newsManagmentSection">
        <asp:MultiView ID="ProductsMultiView" runat="server" ActiveViewIndex="0">
            <asp:View runat="server" ID="productsManage">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SqlDataSourceManageProducts" ForeColor="#333333" GridLines="None"
                    Width="440px" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="Product" SortExpression="title" />
                        <asp:TemplateField HeaderText="Inserted Date" SortExpression="posted">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posted","{0:D}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("posted","{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="published" HeaderText="Active?" SortExpression="published" />
                        <asp:BoundField DataField="nome" HeaderText="Category" SortExpression="nome" />
                        <asp:CheckBoxField DataField="stock_status" HeaderText="In Stock?" SortExpression="stock_status" />
                        <asp:BoundField DataField="price" HeaderText="Sell Price" SortExpression="price" />
                        <asp:ImageField DataAlternateTextField="id_product" DataAlternateTextFormatString="image of product {0}"
                            DataImageUrlField="id_product" DataImageUrlFormatString="~/files/products/{0}.jpg"
                            HeaderText="Product Image">
                            <ItemStyle CssClass="product-image" />
                        </asp:ImageField>
                        <asp:HyperLinkField DataNavigateUrlFields="id_product" DataNavigateUrlFormatString="Products.aspx?view=update&amp;id_product={0}"
                            Text="Edit" />
                        <asp:HyperLinkField DataNavigateUrlFields="id_product" DataNavigateUrlFormatString="~/admin/Products.aspx?view=UploadImage&amp;id={0}"
                            Text="Change Image" />
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
                <asp:SqlDataSource ID="SqlDataSourceManageProducts" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    DeleteCommand="DELETE FROM products" SelectCommand="SELECT products.id_product, products.title, products.posted, products.published, categorias.nome, products.stock_status, products.price FROM products INNER JOIN categorias ON products.id_category = categorias.idcategoria">
                </asp:SqlDataSource>
            </asp:View>
            <asp:View runat="server" ID="productsCreate">
                <asp:SqlDataSource ID="SqlDataSourceProductsInsert" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    InsertCommand="INSERT INTO [products] ([title], [description], [posted], [published], [id_category], [stock_status], [price]) VALUES (@title, @description, @posted, @published, @id_category, @stock_status, @price); SELECT @id_product = @@IDENTITY"
                    OnInserted="pInsert" ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>"
                    SelectCommand="SELECT [id_product], [title], [description], [posted], [published], [id_category], [stock_status] FROM [products]">
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="posted" Type="DateTime" />
                        <asp:Parameter Name="published" Type="Boolean" />
                        <asp:Parameter Name="id_category" Type="Int32" />
                        <asp:Parameter Name="stock_status" Type="Boolean" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Direction="Output" Name="id_product" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="id_product" DataSourceID="SqlDataSourceProductsInsert" DefaultMode="Insert"
                    ForeColor="#333333" GridLines="None" HeaderText="Insert a new Product" Height="50px"
                    Width="440px" OnItemCommand="commandNews">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id_product" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="id_product" />
                        <asp:TemplateField HeaderText="Product Name" SortExpression="title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Title is required!"
                                    ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Description" SortExpression="description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                                    ErrorMessage="Please enter a product description."></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="P. Post Date" SortExpression="posted">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("posted") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="published" HeaderText="Is published?" SortExpression="published" />
                        <asp:TemplateField HeaderText="Category" SortExpression="id_category">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceGetCategories"
                                    DataTextField="nome" DataValueField="idcategoria" SelectedValue='<%# Bind("id_category") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="stock_status" HeaderText="Is in stock?" SortExpression="stock_status" />
                        <asp:TemplateField HeaderText="Sell Price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
                                    ErrorMessage="The price value is required!"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4"
                                    Display="Dynamic" ErrorMessage="Price must be between 1 and 100" MaximumValue="100"
                                    MinimumValue="1" Type="Double"></asp:RangeValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <div>
                    <asp:Label runat="server" Text="Product Image: "> </asp:Label><asp:FileUpload ID="imageUpload"
                        runat="server"></asp:FileUpload>
                    <br>
                    <p>
                        File Type Supported: JPG image.</p>
                </div>
                <asp:SqlDataSource ID="SqlDataSourceGetCategories" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    DeleteCommand="DELETE FROM [categorias] WHERE [idcategoria] = @idcategoria" InsertCommand="INSERT INTO [categorias] ([nome]) VALUES (@nome)"
                    ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [idcategoria], [nome] FROM [categorias] ORDER BY [nome]"
                    UpdateCommand="UPDATE [categorias] SET [nome] = @nome WHERE [idcategoria] = @idcategoria">
                </asp:SqlDataSource>
            </asp:View>
            <asp:View runat="server" ID="productsUpdate">
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="id_product" DataSourceID="SqlDataSourceEditProduct" DefaultMode="Edit"
                    ForeColor="#333333" GridLines="None" Height="50px" Width="440px" OnItemCommand="commandNews"
                    OnItemUpdated="updatedProduct">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id_product" HeaderText="Product ID" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_product" />
                        <asp:TemplateField HeaderText="Product Name" SortExpression="title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="The product title is required!"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="Please enter a product description!"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="published" HeaderText="Is published?" 
                            SortExpression="published" />
                        <asp:TemplateField HeaderText="Category" SortExpression="id_category">
                            <EditItemTemplate>
                                 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceGetCategoriesEdit"
                                    DataTextField="nome" DataValueField="idcategoria" SelectedValue='<%# Bind("id_category") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="stock_status" HeaderText="Is in stock?" 
                            SortExpression="stock_status" />
                        <asp:TemplateField HeaderText="Sell Price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="The price value is required!"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ErrorMessage="RangeValidator" MaximumValue="100" MinimumValue="1" Type="Double"></asp:RangeValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSourceGetCategoriesEdit" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    DeleteCommand="DELETE FROM [categorias] WHERE [idcategoria] = @idcategoria" InsertCommand="INSERT INTO [categorias] ([nome]) VALUES (@nome)"
                    ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [idcategoria], [nome] FROM [categorias] ORDER BY [nome]"
                    UpdateCommand="UPDATE [categorias] SET [nome] = @nome WHERE [idcategoria] = @idcategoria">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEditProduct" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    DeleteCommand="DELETE FROM [products] WHERE [id_product] = @id_product" InsertCommand="INSERT INTO [products] ([title], [description], [published], [id_category], [stock_status], [price]) VALUES (@title, @description, @published, @id_category, @stock_status, @price)"
                    ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [id_product], [title], [description], [published], [id_category], [stock_status], [price] FROM [products] WHERE ([id_product] = @id_product)"
                    UpdateCommand="UPDATE [products] SET [title] = @title, [description] = @description, [published] = @published, [id_category] = @id_category, [stock_status] = @stock_status, [price] = @price WHERE [id_product] = @id_product">
                    <DeleteParameters>
                        <asp:Parameter Name="id_product" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="published" Type="Boolean" />
                        <asp:Parameter Name="id_category" Type="Int32" />
                        <asp:Parameter Name="stock_status" Type="Boolean" />
                        <asp:Parameter Name="price" Type="Double" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="id_product" QueryStringField="id_product"
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="published" Type="Boolean" />
                        <asp:Parameter Name="id_category" Type="Int32" />
                        <asp:Parameter Name="stock_status" Type="Boolean" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Name="id_product" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View runat="server" ID="ChangeImage">
                <asp:Label ID="Label2" runat="server" Text="New Image: "> </asp:Label><asp:FileUpload
                    ID="FileUploadChangeImage" runat="server" ControlToValidate="FileUploadChangeImage"></asp:FileUpload><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <br>
                <asp:Button ID="submitUploadBtn" runat="server" Text="Upload New Image" OnClick="submitUploadBtn_Click" />
            </asp:View>
        </asp:MultiView>
        <asp:Label ID="mensagemErro" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
