<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ImageUpload.aspx.cs" Inherits="admin_ImageUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormViewImageUpload" runat="server" DataKeyNames="id_image" DataSourceID="SqlDataSourceImageUpload"
        OnItemInserting="FormViewImageUpload_OnInserting" DefaultMode="Insert">
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
            Content:
            <br />
            <asp:DropDownList ID="DropDownListContent" runat="server" DataSourceID="SqlDataSourceGetContentList"
                DataTextField="title" DataValueField="id_content" SelectedValue='<%# Bind("id_content") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceGetContentList" runat="server" ConnectionString="<%$ ConnectionStrings:connectionloja %>"
                SelectCommand="SELECT [id_content], [title] FROM [content]"></asp:SqlDataSource>
            <br />
            <br />
            Image:
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" FileName='<%# Bind("filename") %>'
                Width="400" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Please select a file." ControlToValidate="FileUpload1" 
                ForeColor="#FF6666"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1"
                            Display="Dynamic" ErrorMessage="Só são permitidas imagens nos formatos jpg, jpeg e pjpg."
                            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF)$" ForeColor="#FF6666"></asp:RegularExpressionValidator>
            <br />
            <br />
            alt:
            <br />
            <asp:TextBox ID="altTextBox" runat="server" Text='<%# Bind("alt") %>' />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Please insert an alternative text in case the image fails to load." 
                ControlToValidate="altTextBox" ForeColor="#FF6666"></asp:RequiredFieldValidator>
            <br />
            <br />
            title:
            <br />
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            <br />
            description:
            <br />
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
</asp:Content>
