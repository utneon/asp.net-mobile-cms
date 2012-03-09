<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="admin_Content" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul>
        <li>
            <asp:HyperLink ID="LinkContentManage" runat="server" NavigateUrl="~/admin/Content.aspx?view=manage">Listar Conteúdo</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="LinkContentCreate" runat="server" NavigateUrl="~/admin/Content.aspx?view=create">Criar Conteúdo</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="LinkContentUploadImages" runat="server" NavigateUrl="~/admin/Content.aspx?view=UploadImages">Carregar Imagens nos Conteúdos</asp:HyperLink></li>
    </ul>
    <div id="newsManagmentSection">
        <asp:MultiView ID="ContentMultiview" runat="server" ActiveViewIndex="0">
            <asp:View ID="ContentListView" runat="server">
                <asp:GridView ID="GridViewContent" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_content" DataSourceID="SqlDataSourceGetContentListGridView"
                    ForeColor="#333333" GridLines="None" PageSize="25" Width="800px" EmptyDataText="Não existe conteúdo criado.">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="id_content" DataNavigateUrlFormatString="~/admin/Content.aspx?view=create&amp;mode=edit&amp;id={0}"
                            HeaderText="Edit Content" Text="Edit Content" />
                        <asp:BoundField DataField="id_content" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id_content" />
                        <asp:BoundField DataField="contentType" HeaderText="Tipo de Conteúdo" SortExpression="contentType"
                            ReadOnly="True" />
                        <asp:HyperLinkField DataNavigateUrlFields="id_content" DataNavigateUrlFormatString="~/admin/Content.aspx?view=preview&amp;id={0}"
                            DataTextField="title" DataTextFormatString="{0}" HeaderText="Título" SortExpression="title" />
                        <asp:BoundField DataField="postdate" HeaderText="Data de Publicação" SortExpression="postdate"
                            ReadOnly="True" />
                        <asp:BoundField DataField="modified_date" HeaderText="Última modificação" SortExpression="modified_date"
                            ReadOnly="True" />
                        <asp:BoundField DataField="language" HeaderText="Língua" SortExpression="language"
                            ReadOnly="True" />
                        <asp:CheckBoxField DataField="published" HeaderText="Publicado?" SortExpression="published" />
                        <asp:CheckBoxField DataField="promoted" HeaderText="Em Destaque?" SortExpression="promoted" />
                        <asp:CheckBoxField DataField="IsMobileActive" HeaderText="Publicado em Mobile?" SortExpression="IsMobileActive" />
                        <asp:CommandField EditText="Quick Edit" ShowEditButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceGetContentListGridView" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    SelectCommand="SELECT [content].id_content, content_types.contentType, [content].title, [content].postdate, [content].modified_date, languages.language, [content].published, [content].promoted, [content].IsMobileActive FROM [content] INNER JOIN content_types ON [content].id_contentType = content_types.id_contentType INNER JOIN languages ON [content].id_lang = languages.id_lang"
                    UpdateCommand="UPDATE [content] SET modified_date= getdate(), published = @published, promoted = @promoted, IsMobileActive = @IsMobileActive WHERE [id_content] = @id_content">
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="ContentCreateView" runat="server">
                <div id="headerteste" style="display: block; background-color: rgb(28, 94, 85); width: 800px;
                    height: 30px;">
                    <label style="color: White; font-weight: bold">
                        Using a Formview ASP.NET control</label>
                </div>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_content" DataSourceID="SqlDataSourceCreateContent"
                    DefaultMode="Insert" Width="800px" OnItemInserting="FormView1_OnInserting" OnItemUpdating="FormView1_OnUpdating"
                    OnItemCommand="commandContent" OnItemInserted="insertedContent" OnItemUpdated="updatedContent">
                    <InsertItemTemplate>
                        Tipo de Conteudo:
                        <br />
                        <asp:DropDownList ID="DropDownListContentType" runat="server" DataSourceID="SqlDataSourceGetContentTypeList"
                            DataTextField="contentType" DataValueField="id_contentType" SelectedValue='<%# Bind("id_contentType") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGetContentTypeList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT * FROM [content_types] ORDER BY [contentType]"></asp:SqlDataSource>
                        <br />
                        <br />
                        Language:
                        <br />
                        <asp:DropDownList ID="DropDownListLanguage" runat="server" SelectedValue='<%# Bind("id_lang") %>'
                            DataSourceID="SqlDataSourceGetLanguageList" DataTextField="language" DataValueField="id_lang">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGetLanguageList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT [id_lang], [language] FROM [languages] WHERE ([status] = @status) ORDER BY [language]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        Título:
                        <br />
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' Width="800" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O título é obrigatório."
                            ControlToValidate="titleTextBox" Display="Dynamic" ForeColor="#FF6666"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        Teaser:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditor3" runat="server" Text='<%# Bind("teaser") %>'
                            Toolbar="Basic" Height="100"></CKEditor:CKEditorControl>
                        <br />
                        <br />
                        Corpo principal do conteúdo:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Text='<%# Bind("body") %>'></CKEditor:CKEditorControl>
                        <br />
                        <asp:GridView ID="GridViewContentImages" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" DataSourceID="SqlDataSourceGetContentAllImageListing" ForeColor="#333333"
                            GridLines="None" Width="800px" EmptyDataText="Este Conteúdo ainda não tem imagens associadas."
                            AllowPaging="True" AllowSorting="True" PageSize="5">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filename") %>' ToolTip='<%# Eval("filename", "filename") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("filename", "filename") %>'
                                            ImageUrl='<%# Eval("filename", "~/files/content/images/{0}") %>' Width="200" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("filename", "~/files/content/images/{0}") %>'
                                            Text='<%# Eval("filename", "{0}") %>' Target="_blank"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="alt" HeaderText="Alternate Text" SortExpression="alt" />
                                <asp:BoundField DataField="title" HeaderText="Image Title" SortExpression="title" />
                                <asp:BoundField DataField="description" HeaderText="Description" />
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
                        <asp:SqlDataSource ID="SqlDataSourceGetContentAllImageListing" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT [filename], [alt], [title], [description] FROM [images] ORDER BY [postdate] DESC">
                        </asp:SqlDataSource>
                        <br />
                        Thumbnail de conteúdo para listagem:
                        <br />
                        <asp:FileUpload ID="FileUploadThumbnail" runat="server" FileName='<%# Bind("thumbnail_image") %>'
                            Width="400" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FileUploadThumbnail"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Imagem principal do conteúdo:
                        <br />
                        <asp:FileUpload ID="FileUploadContentImage" runat="server" FileName='<%# Bind("content_image") %>'
                            Width="400" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="FileUploadContentImage"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Corpo principal do conteúdo para o interface Mobile:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditorControl2" runat="server" Text='<%# Bind("mobile_body") %>'
                            Toolbar="Basic" Height="100"></CKEditor:CKEditorControl>
                        <br />
                        Thumbnail de conteúdo para listagem no interface Mobile:
                        <br />
                        <asp:FileUpload ID="FileUploadMobileThumbnail" runat="server" FileName='<%# Bind("mobile_thumbnail") %>'
                            Width="400" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="FileUploadMobileThumbnail"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Imagem principal do conteúdo no interface Mobile:
                        <br />
                        <asp:FileUpload ID="FileUploadMobileImage" runat="server" FileName='<%# Bind("mobile_image") %>'
                            Width="400" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="FileUploadMobileImage"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Publicado?
                        <asp:CheckBox ID="publishedCheckBox" runat="server" Checked='<%# Bind("published") %>' />
                        <br />
                        Em Destaque?
                        <asp:CheckBox ID="promotedCheckBox" runat="server" Checked='<%# Bind("promoted") %>' />
                        <br />
                        Activo em Mobile?
                        <asp:CheckBox ID="IsMobileActiveCheckBox" runat="server" Checked='<%# Bind("IsMobileActive") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        Tipo de Conteudo:
                        <br />
                        <asp:DropDownList ID="DropDownListContentType" runat="server" DataSourceID="SqlDataSourceGetContentTypeList"
                            DataTextField="contentType" DataValueField="id_contentType" SelectedValue='<%# Bind("id_contentType") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGetContentTypeList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT * FROM [content_types] ORDER BY [contentType]"></asp:SqlDataSource>
                        <br />
                        <br />
                        Language:
                        <br />
                        <asp:DropDownList ID="DropDownListLanguage" runat="server" SelectedValue='<%# Bind("id_lang") %>'
                            DataSourceID="SqlDataSourceGetLanguageList" DataTextField="language" DataValueField="id_lang">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGetLanguageList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT [id_lang], [language] FROM [languages] WHERE ([status] = @status) ORDER BY [language]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        Título:
                        <br />
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' Width="800" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O título é obrigatório."
                            ControlToValidate="titleTextBox" Display="Dynamic" ForeColor="#FF6666"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        Teaser:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditor3" runat="server" Text='<%# Bind("teaser") %>'
                            Toolbar="Basic" Height="100"></CKEditor:CKEditorControl>
                        <br />
                        <br />
                        Corpo principal do conteúdo:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Text='<%# Bind("body") %>'></CKEditor:CKEditorControl>
                        <br />
                        <asp:GridView ID="GridViewContentImages" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" DataSourceID="SqlDataSourceGetContentImageListing" ForeColor="#333333"
                            GridLines="None" Width="800px" EmptyDataText="Este Conteúdo ainda não tem imagens associadas.">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filename") %>' ToolTip='<%# Eval("filename", "filename") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("filename", "filename") %>'
                                            ImageUrl='<%# Eval("filename", "~/files/content/images/{0}") %>' Width="200" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("filename", "~/files/content/images/{0}") %>'
                                            Text='<%# Eval("filename", "{0}") %>' Target="_blank"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="alt" HeaderText="Alternate Text" SortExpression="alt" />
                                <asp:BoundField DataField="title" HeaderText="Image Title" SortExpression="title" />
                                <asp:BoundField DataField="description" HeaderText="Description" />
                                <asp:BoundField DataField="weight" HeaderText="Weight (order)" SortExpression="weight" />
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
                        <asp:SqlDataSource ID="SqlDataSourceGetContentImageListing" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT [filename], [alt], [title], [description], [weight] FROM [images] WHERE ([id_content] = @id_content) ORDER BY [weight]">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id_content" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        Thumbnail de conteúdo para listagem:
                        <br />
                        <asp:Image ID="ImageThumbnail" runat="server" AlternateText="Thumbnail Preview" ImageUrl='<%#  Eval("thumbnail_image", "~/files/content/thumbnails/{0}") %>'
                            Width="100" Height="100" />
                        <asp:FileUpload ID="FileUploadThumbnail" runat="server" Width="400" />
                        <asp:Label ID="ThumbnailImageLoad" runat="server" Text='<%# Bind("thumbnail_image") %>'
                            Visible="false"></asp:Label>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FileUploadThumbnail"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Imagem principal do conteúdo:
                        <br />
                        <asp:Image ID="ImageContent" runat="server" AlternateText="Content Image" ImageUrl='<%#  Eval("content_image", "~/files/content/images/{0}") %>'
                            Width="100" Height="100" />
                        <asp:FileUpload ID="FileUploadContentImage" runat="server" Width="400" />
                        <asp:Label ID="ImageLoad" runat="server" Text='<%# Bind("content_image") %>' Visible="false"></asp:Label>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="FileUploadContentImage"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Corpo principal do conteúdo para o interface Mobile:
                        <br />
                        <CKEditor:CKEditorControl ID="CKEditorControl2" runat="server" Text='<%# Bind("mobile_body") %>'
                            Toolbar="Basic" Height="100"></CKEditor:CKEditorControl>
                        <br />
                        Thumbnail de conteúdo para listagem no interface Mobile:
                        <br />
                        <asp:Image ID="MobileThumbnailPreview" runat="server" AlternateText="Mobile Thunbnail Preview"
                            ImageUrl='<%# Eval("mobile_thumbnail", "~/files/content/mobile_thumbnails/{0}") %>'
                            Width="100" Height="100" />
                        <asp:FileUpload ID="FileUploadMobileThumbnail" runat="server" Width="400" />
                        <asp:Label ID="MobileThumbnailLoad" runat="server" Text='<%# Bind("mobile_thumbnail") %>'
                            Visible="false"></asp:Label>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="FileUploadMobileThumbnail"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Imagem principal do conteúdo no interface Mobile:
                        <br />
                        <asp:Image ID="MobileImageContent" runat="server" AlternateText="Mobile Image" ImageUrl='<%#  Eval("mobile_image", "~/files/content/mobile_images/{0}") %>'
                            Width="100" Height="100" />
                        <asp:FileUpload ID="FileUploadMobileImage" runat="server" Width="400" />
                        <asp:Label ID="MobileImageLoad" runat="server" Text='<%# Bind("mobile_image") %>'
                            Visible="false"></asp:Label>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="FileUploadMobileImage"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        Publicado?
                        <asp:CheckBox ID="publishedCheckBox" runat="server" Checked='<%# Bind("published") %>' />
                        <br />
                        Em Destaque?
                        <asp:CheckBox ID="promotedCheckBox" runat="server" Checked='<%# Bind("promoted") %>' />
                        <br />
                        Activo em Mobile?
                        <asp:CheckBox ID="IsMobileActiveCheckBox" runat="server" Checked='<%# Bind("IsMobileActive") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" /></EditItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSourceCreateContent" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:connectionloja %>" DeleteCommand="DELETE FROM [content] WHERE [id_content] = @original_id_content AND [id_contentType] = @original_id_contentType AND [id_lang] = @original_id_lang AND [title] = @original_title AND [postdate] = @original_postdate AND [modified_date] = @original_modified_date AND (([teaser] = @original_teaser) OR ([teaser] IS NULL AND @original_teaser IS NULL)) AND (([body] = @original_body) OR ([body] IS NULL AND @original_body IS NULL)) AND (([thumbnail_image] = @original_thumbnail_image) OR ([thumbnail_image] IS NULL AND @original_thumbnail_image IS NULL)) AND (([content_image] = @original_content_image) OR ([content_image] IS NULL AND @original_content_image IS NULL)) AND (([mobile_body] = @original_mobile_body) OR ([mobile_body] IS NULL AND @original_mobile_body IS NULL)) AND (([mobile_thumbnail] = @original_mobile_thumbnail) OR ([mobile_thumbnail] IS NULL AND @original_mobile_thumbnail IS NULL)) AND (([mobile_image] = @original_mobile_image) OR ([mobile_image] IS NULL AND @original_mobile_image IS NULL)) AND [published] = @original_published AND [promoted] = @original_promoted AND [IsMobileActive] = @original_IsMobileActive AND [UserId] = @original_UserId AND (([views] = @original_views) OR ([views] IS NULL AND @original_views IS NULL)) AND (([mobile_views] = @original_mobile_views) OR ([mobile_views] IS NULL AND @original_mobile_views IS NULL))"
                    InsertCommand="INSERT INTO [content] ([id_contentType], [id_lang], [title], [teaser], [body], [thumbnail_image], [content_image], [mobile_body], [mobile_thumbnail], [mobile_image], [published], [promoted], [IsMobileActive]) VALUES (@id_contentType, @id_lang, @title, @teaser, @body, @thumbnail_image, @content_image, @mobile_body, @mobile_thumbnail, @mobile_image, @published, @promoted, @IsMobileActive)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [content] WHERE [id_content] = @id_content"
                    UpdateCommand="UPDATE [content] SET [id_contentType] = @id_contentType, [id_lang] = @id_lang, [title] = @title, 
                    [modified_date] = getdate(), [teaser] = @teaser, [body] = @body, [thumbnail_image] = @thumbnail_image, [content_image] = @content_image, 
                    [mobile_body] = @mobile_body, [mobile_thumbnail] = @mobile_thumbnail, [mobile_image] = @mobile_image, [published] = @published, [promoted] = @promoted, 
                    [IsMobileActive] = @IsMobileActive WHERE [id_content] = @id_content2">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id_content" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_contentType" Type="Int32" />
                        <asp:Parameter Name="id_lang" Type="Int32" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="teaser" Type="String" />
                        <asp:Parameter Name="body" Type="String" />
                        <asp:Parameter Name="thumbnail_image" Type="String" />
                        <asp:Parameter Name="content_image" Type="String" />
                        <asp:Parameter Name="mobile_body" Type="String" />
                        <asp:Parameter Name="mobile_thumbnail" Type="String" />
                        <asp:Parameter Name="mobile_image" Type="String" />
                        <asp:Parameter Name="published" Type="Boolean" />
                        <asp:Parameter Name="promoted" Type="Boolean" />
                        <asp:Parameter Name="IsMobileActive" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_contentType" Type="Int32" />
                        <asp:Parameter Name="id_lang" Type="Int32" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="teaser" Type="String" />
                        <asp:Parameter Name="body" Type="String" />
                        <asp:Parameter Name="thumbnail_image" Type="String" />
                        <asp:Parameter Name="content_image" Type="String" />
                        <asp:Parameter Name="mobile_body" Type="String" />
                        <asp:Parameter Name="mobile_thumbnail" Type="String" />
                        <asp:Parameter Name="mobile_image" Type="String" />
                        <asp:Parameter Name="published" Type="Boolean" />
                        <asp:Parameter Name="promoted" Type="Boolean" />
                        <asp:Parameter Name="IsMobileActive" Type="Boolean" />
                        <asp:Parameter Name="id_content" Type="Int32" />
                        <asp:QueryStringParameter Name="id_content2" QueryStringField="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="ContentDetailsView" runat="server">
                <div id="content-preview">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="id_content" DataSourceID="SqlDataSourceGetContentPreview">
                        <ItemTemplate>
                            <h1>
                                <asp:Label ID="contentTypeLabel" runat="server" Text='<%# Eval("contentType") %>' />:
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /></h1>
                            <br />
                            <asp:Image ID="ThumbnailImage" runat="server" AlternateText="Thumbnail Picture" ImageUrl='<%#  Eval("thumbnail_image", "~/files/content/thumbnails/{0}") %>'
                                Width="100" Height="100" />
                            <br />
                            <asp:Image ID="ContentImage" runat="server" AlternateText="Content Image" ImageUrl='<%#  Eval("content_image", "~/files/content/images/{0}") %>'
                                Width="800" Height="180" />
                            <h2>
                                Publicado em:
                                <asp:Label ID="postdateLabel" runat="server" Text='<%# Eval("postdate") %>' /></h2>
                            <h2>
                                Última modificação em:
                                <asp:Label ID="modified_dateLabel" runat="server" Text='<%# Eval("modified_date") %>' /></h2>
                            <br />
                            <div>
                                <h1>
                                    Teaser (Descrição de preview na listagem):</h1>
                                <br />
                                <asp:Label ID="teaserLabel" runat="server" Text='<%# Eval("teaser") %>' />
                            </div>
                            <br />
                            <div>
                                <h1>
                                    Conteúdo:</h1>
                                <br />
                                <asp:Label ID="bodyLabel" runat="server" Text='<%# Eval("body") %>' /></div>
                            <br />
                            <div>
                                <h1>
                                    Interaface Mobile:</h1>
                                <asp:Label ID="mobile_bodyLabel" runat="server" Text='<%# Eval("mobile_body") %>' />
                                <br />
                                <h2>
                                    Icone de listagem no interface mobile:</h2>
                                <asp:Image ID="Image1" runat="server" AlternateText="Mobile Icon" ImageUrl='<%#  Eval("mobile_thumbnail", "~/files/content/mobile_thumbnails/{0}") %>'
                                    Width="50" Height="50" />
                                <br />
                                <h2>
                                    Imagem de conteúdo no interface mobile:</h2>
                                <asp:Image ID="Image2" runat="server" AlternateText="Mobile Icon" ImageUrl='<%#  Eval("mobile_image", "~/files/content/mobile_images/{0}") %>'
                                    Width="190" />
                            </div>
                            <br />
                            <div>
                                <h1>
                                    Opções:</h1>
                                <h2>
                                    Publicado em:
                                    <asp:Label ID="languageLabel" runat="server" Text='<%# Eval("language") %>' /></h2>
                                <h2>
                                    Publicado?<br />
                                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' ForeColor="Red" /></h2>
                                <h2>
                                    Em Destaque?<br />
                                    <asp:Label ID="promotedLabel" runat="server" Text='<%# Eval("promoted") %>' ForeColor="Red" /></h2>
                                <h2>
                                    Activo no interface mobile?<br />
                                    <asp:Label ID="IsMobileActiveLabel" runat="server" Text='<%# Eval("IsMobileActive") %>'
                                        ForeColor="Red" /></h2>
                            </div>
                            <br />
                            <div>
                                <h1>
                                    Estatísticas e outros dados:</h1>
                                <h2>
                                    Número de visitas/acessos:
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("views") %>' /></h2>
                                <h2>
                                    Número de visitas/acessos em mobile:
                                    <asp:Label ID="mobile_viewsLabel" runat="server" Text='<%# Eval("mobile_views") %>' /></h2>
                            </div>
                            <br />
                            <asp:HyperLink ID="LinkContentEdit" runat="server" NavigateUrl='<%# Eval("id_content", "~/admin/Content.aspx?view=create&mode=edit&id={0}") %>'
                                Text="Editar"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceGetContentPreview" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                        SelectCommand="SELECT [content].id_content, [content].title, [content].postdate, [content].modified_date, [content].teaser, [content].body, [content].thumbnail_image, [content].content_image, [content].mobile_body, [content].mobile_thumbnail, [content].mobile_image, [content].published, [content].promoted, [content].IsMobileActive, [content].mobile_views, [content].views, content_types.contentType, languages.language FROM [content] INNER JOIN content_types ON [content].id_contentType = content_types.id_contentType INNER JOIN languages ON [content].id_lang = languages.id_lang WHERE id_content = @id_content">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id_content" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:View>
            <asp:View ID="ContentImageUpload" runat="server">
                <asp:FormView ID="FormViewImageUpload" runat="server" DataKeyNames="id_image" DataSourceID="SqlDataSourceImageUpload"
                    OnItemInserting="FormViewImageUpload_OnInserting" DefaultMode="Insert" OnItemCommand="commandContent"
                    OnItemInserted="insertedImageUpload">
                    <EditItemTemplate>
                        id_image:
                        <asp:Label ID="id_imageLabel1" runat="server" Text='<%# Eval("id_image") %>' />
                        <br />
                        id_content:
                        <asp:TextBox ID="id_contentTextBox" runat="server" Text='<%# Bind("id_content") %>' />
                        <br />
                        filename:
                        <asp:TextBox ID="filenameTextBox" runat="server" Text='<%# Bind("filename") %>' />
                        <br />
                        type:
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                        <br />
                        size:
                        <asp:TextBox ID="sizeTextBox" runat="server" Text='<%# Bind("size") %>' />
                        <br />
                        width:
                        <asp:TextBox ID="widthTextBox" runat="server" Text='<%# Bind("width") %>' />
                        <br />
                        height:
                        <asp:TextBox ID="heightTextBox" runat="server" Text='<%# Bind("height") %>' />
                        <br />
                        postdate:
                        <asp:TextBox ID="postdateTextBox" runat="server" Text='<%# Bind("postdate") %>' />
                        <br />
                        alt:
                        <asp:TextBox ID="altTextBox" runat="server" Text='<%# Bind("alt") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <h2>
                            Selecione o conteúdo a qual pretende associar a imagem:</h2>
                        <asp:DropDownList ID="DropDownListContent" runat="server" DataSourceID="SqlDataSourceGetContentList"
                            DataTextField="title" DataValueField="id_content" SelectedValue='<%# Bind("id_content") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGetContentList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                            SelectCommand="SELECT [id_content], [title] FROM [content]"></asp:SqlDataSource>
                        <br />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" FileName='<%# Bind("filename") %>'
                            Width="400" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a file."
                            ControlToValidate="FileUpload1" ForeColor="#FF6666"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        <h2>
                            Alternate Text:</h2>
                        <asp:TextBox ID="altTextBox" runat="server" Text='<%# Bind("alt") %>' />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert an alternative text in case the image fails to load."
                            ControlToValidate="altTextBox" ForeColor="#FF6666"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <h2>
                            Título:</h2>
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        <br />
                        <h2>
                            Descrição da Imagem:</h2>
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSourceImageUpload" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                    DeleteCommand="DELETE FROM [images] WHERE [id_image] = @id_image" InsertCommand="INSERT INTO [images] ([id_content], [filename], [type], [size], [width], [height], [alt], [title], [description]) VALUES (@id_content, @filename, @type, @size, @width, @height, @alt, @title, @description)"
                    SelectCommand="SELECT * FROM [images]" UpdateCommand="UPDATE [images] SET [id_content] = @id_content, [filename] = @filename, [type] = @type, [size] = @size, [width] = @width, [height] = @height, [postdate] = @postdate, [alt] = @alt, [title] = @title, [description] = @description WHERE [id_image] = @id_image">
                    <DeleteParameters>
                        <asp:Parameter Name="id_image" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_content" Type="Int32" />
                        <asp:Parameter Name="filename" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="size" Type="String" />
                        <asp:Parameter Name="width" Type="Decimal" />
                        <asp:Parameter Name="height" Type="Decimal" />
                        <asp:Parameter Name="alt" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_content" Type="Int32" />
                        <asp:Parameter Name="filename" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="size" Type="String" />
                        <asp:Parameter Name="width" Type="Decimal" />
                        <asp:Parameter Name="height" Type="Decimal" />
                        <asp:Parameter Name="postdate" Type="DateTime" />
                        <asp:Parameter Name="alt" Type="String" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="id_image" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
        <asp:Label ID="mensagemErro" runat="server"></asp:Label>
    </div>
</asp:Content>
