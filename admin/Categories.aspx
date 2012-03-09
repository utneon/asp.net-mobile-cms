<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="admin_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <ul>
            <li>
                <asp:HyperLink ID="LinkCategoriesManage" runat="server" NavigateUrl="~/admin/Categories.aspx?view=manage">Categories Managment</asp:HyperLink></li>
            <li>
                <asp:HyperLink ID="LinkCategoriesCreate" runat="server" NavigateUrl="~/admin/Categories.aspx?view=create">Add new category</asp:HyperLink></li>
        </ul>
        <div id="newsManagmentSection">
            <asp:MultiView ID="CategoriesMultiView" runat="server" ActiveViewIndex="0">
                <asp:View runat="server" ID="categoriesManage">
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesManage" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        DeleteCommand="DELETE FROM [categorias] WHERE [idcategoria] = @idcategoria" InsertCommand="INSERT INTO [categorias] ([nome]) VALUES (@nome)"
                        ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT * FROM [categorias] ORDER BY [nome]"
                        UpdateCommand="UPDATE [categorias] SET [nome] = @nome WHERE [idcategoria] = @idcategoria">
                        <DeleteParameters>
                            <asp:Parameter Name="idcategoria" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nome" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nome" Type="String" />
                            <asp:Parameter Name="idcategoria" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataKeyNames="idcategoria" DataSourceID="SqlDataSourceCategoriesManage" ForeColor="#333333"
                        GridLines="None" Width="420px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Category" SortExpression="nome" />
                            <asp:HyperLinkField DataNavigateUrlFields="idcategoria" DataNavigateUrlFormatString="~/admin/Categories.aspx?view=update&amp;id={0}"
                                Text="Edit" />
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
                </asp:View>
                <asp:View runat="server" ID="categoriesCreate">
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesCreate" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        DeleteCommand="DELETE FROM [categorias] WHERE [idcategoria] = @idcategoria" InsertCommand="INSERT INTO [categorias] ([nome]) VALUES (@nome)"
                        ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" SelectCommand="SELECT [idcategoria], [nome] FROM [categorias]"
                        UpdateCommand="UPDATE [categorias] SET [nome] = @nome WHERE [idcategoria] = @idcategoria">
                        <DeleteParameters>
                            <asp:Parameter Name="idcategoria" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nome" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nome" Type="String" />
                            <asp:Parameter Name="idcategoria" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                        DataKeyNames="idcategoria" DataSourceID="SqlDataSourceCategoriesCreate" DefaultMode="Insert"
                        ForeColor="#333333" GridLines="None" HeaderText="Create a new Category" Height="50px"
                        Width="420px" OnItemInserted="insertedCategory" OnItemCommand="commandCategory">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="idcategoria" HeaderText="idcategoria" InsertVisible="False"
                                ReadOnly="True" SortExpression="idcategoria" />
                            <asp:TemplateField HeaderText="Category Name" SortExpression="nome">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                    <br>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="Dynamic" ErrorMessage="The Category name is required!"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                </asp:View>
                <asp:View runat="server" ID="categoriesUpdate">
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="idcategoria"
                        DataSourceID="SqlDataSourceUpdateCategory" DefaultMode="Edit" 
                        Height="50px" Width="420px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" OnItemCommand="commandCategory" OnItemUpdated="updatedCategory">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:TemplateField HeaderText="Category Name" SortExpression="nome">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="The Category Name is required!" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceUpdateCategory" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:connectionloja %>" 
                        ProviderName="<%$ ConnectionStrings:connectionloja.ProviderName %>" 
                        SelectCommand="SELECT * FROM [categorias] WHERE ([idcategoria] = @idcategoria)" 
                        UpdateCommand="UPDATE [categorias] SET [nome] = @nome WHERE [idcategoria] = @idcategoria">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="idcategoria" QueryStringField="id" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
            <asp:Label ID="mensagemErro" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>