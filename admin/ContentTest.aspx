<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="ContentTest.aspx.cs" Inherits="admin_ContentTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_content" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            id_content:
            <asp:Label ID="id_contentLabel1" runat="server" 
                Text='<%# Eval("id_content") %>' />
            <br />
            id_contentType:
            <asp:TextBox ID="id_contentTypeTextBox" runat="server" 
                Text='<%# Bind("id_contentType") %>' />
            <br />
            id_lang:
            <asp:TextBox ID="id_langTextBox" runat="server" Text='<%# Bind("id_lang") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            postdate:
            <asp:TextBox ID="postdateTextBox" runat="server" 
                Text='<%# Bind("postdate") %>' />
            <br />
            modified_date:
            <asp:TextBox ID="modified_dateTextBox" runat="server" 
                Text='<%# Bind("modified_date") %>' />
            <br />
            teaser:
            <asp:TextBox ID="teaserTextBox" runat="server" Text='<%# Bind("teaser") %>' />
            <br />
            body:
            <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
            <br />
            thumbnail_image:
            <asp:TextBox ID="thumbnail_imageTextBox" runat="server" 
                Text='<%# Bind("thumbnail_image") %>' />
            <br />
            content_image:
            <asp:TextBox ID="content_imageTextBox" runat="server" 
                Text='<%# Bind("content_image") %>' />
            <br />
            mobile_body:
            <asp:TextBox ID="mobile_bodyTextBox" runat="server" 
                Text='<%# Bind("mobile_body") %>' />
            <br />
            mobile_thumbnail:
            <asp:TextBox ID="mobile_thumbnailTextBox" runat="server" 
                Text='<%# Bind("mobile_thumbnail") %>' />
            <br />
            mobile_image:
            <asp:TextBox ID="mobile_imageTextBox" runat="server" 
                Text='<%# Bind("mobile_image") %>' />
            <br />
            published:
            <asp:CheckBox ID="publishedCheckBox" runat="server" 
                Checked='<%# Bind("published") %>' />
            <br />
            promoted:
            <asp:CheckBox ID="promotedCheckBox" runat="server" 
                Checked='<%# Bind("promoted") %>' />
            <br />
            IsMobileActive:
            <asp:CheckBox ID="IsMobileActiveCheckBox" runat="server" 
                Checked='<%# Bind("IsMobileActive") %>' />
            <br />
            views:
            <asp:TextBox ID="viewsTextBox" runat="server" Text='<%# Bind("views") %>' />
            <br />
            mobile_views:
            <asp:TextBox ID="mobile_viewsTextBox" runat="server" 
                Text='<%# Bind("mobile_views") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            id_contentType:
            <asp:TextBox ID="id_contentTypeTextBox" runat="server" 
                Text='<%# Bind("id_contentType") %>' />
            <br />
            id_lang:
            <asp:TextBox ID="id_langTextBox" runat="server" Text='<%# Bind("id_lang") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            postdate:
            <asp:TextBox ID="postdateTextBox" runat="server" 
                Text='<%# Bind("postdate") %>' />
            <br />
            modified_date:
            <asp:TextBox ID="modified_dateTextBox" runat="server" 
                Text='<%# Bind("modified_date") %>' />
            <br />
            teaser:
            <asp:TextBox ID="teaserTextBox" runat="server" Text='<%# Bind("teaser") %>' />
            <br />
            body:
            <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
            <br />
            thumbnail_image:
            <asp:TextBox ID="thumbnail_imageTextBox" runat="server" 
                Text='<%# Bind("thumbnail_image") %>' />
            <br />
            content_image:
            <asp:TextBox ID="content_imageTextBox" runat="server" 
                Text='<%# Bind("content_image") %>' />
            <br />
            mobile_body:
            <asp:TextBox ID="mobile_bodyTextBox" runat="server" 
                Text='<%# Bind("mobile_body") %>' />
            <br />
            mobile_thumbnail:
            <asp:TextBox ID="mobile_thumbnailTextBox" runat="server" 
                Text='<%# Bind("mobile_thumbnail") %>' />
            <br />
            mobile_image:
            <asp:TextBox ID="mobile_imageTextBox" runat="server" 
                Text='<%# Bind("mobile_image") %>' />
            <br />
            published:
            <asp:CheckBox ID="publishedCheckBox" runat="server" 
                Checked='<%# Bind("published") %>' />
            <br />
            promoted:
            <asp:CheckBox ID="promotedCheckBox" runat="server" 
                Checked='<%# Bind("promoted") %>' />
            <br />
            IsMobileActive:
            <asp:CheckBox ID="IsMobileActiveCheckBox" runat="server" 
                Checked='<%# Bind("IsMobileActive") %>' />
            <br />
            views:
            <asp:TextBox ID="viewsTextBox" runat="server" Text='<%# Bind("views") %>' />
            <br />
            mobile_views:
            <asp:TextBox ID="mobile_viewsTextBox" runat="server" 
                Text='<%# Bind("mobile_views") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            id_content:
            <asp:Label ID="id_contentLabel" runat="server" 
                Text='<%# Eval("id_content") %>' />
            <br />
            id_contentType:
            <asp:Label ID="id_contentTypeLabel" runat="server" 
                Text='<%# Bind("id_contentType") %>' />
            <br />
            id_lang:
            <asp:Label ID="id_langLabel" runat="server" Text='<%# Bind("id_lang") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
            <br />
            postdate:
            <asp:Label ID="postdateLabel" runat="server" Text='<%# Bind("postdate") %>' />
            <br />
            modified_date:
            <asp:Label ID="modified_dateLabel" runat="server" 
                Text='<%# Bind("modified_date") %>' />
            <br />
            teaser:
            <asp:Label ID="teaserLabel" runat="server" Text='<%# Bind("teaser") %>' />
            <br />
            body:
            <asp:Label ID="bodyLabel" runat="server" Text='<%# Bind("body") %>' />
            <br />
            thumbnail_image:
            <asp:Label ID="thumbnail_imageLabel" runat="server" 
                Text='<%# Bind("thumbnail_image") %>' />
            <br />
            content_image:
            <asp:Label ID="content_imageLabel" runat="server" 
                Text='<%# Bind("content_image") %>' />
            <br />
            mobile_body:
            <asp:Label ID="mobile_bodyLabel" runat="server" 
                Text='<%# Bind("mobile_body") %>' />
            <br />
            mobile_thumbnail:
            <asp:Label ID="mobile_thumbnailLabel" runat="server" 
                Text='<%# Bind("mobile_thumbnail") %>' />
            <br />
            mobile_image:
            <asp:Label ID="mobile_imageLabel" runat="server" 
                Text='<%# Bind("mobile_image") %>' />
            <br />
            published:
            <asp:CheckBox ID="publishedCheckBox" runat="server" 
                Checked='<%# Bind("published") %>' Enabled="false" />
            <br />
            promoted:
            <asp:CheckBox ID="promotedCheckBox" runat="server" 
                Checked='<%# Bind("promoted") %>' Enabled="false" />
            <br />
            IsMobileActive:
            <asp:CheckBox ID="IsMobileActiveCheckBox" runat="server" 
                Checked='<%# Bind("IsMobileActive") %>' Enabled="false" />
            <br />
            views:
            <asp:Label ID="viewsLabel" runat="server" Text='<%# Bind("views") %>' />
            <br />
            mobile_views:
            <asp:Label ID="mobile_viewsLabel" runat="server" 
                Text='<%# Bind("mobile_views") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:connectionloja %>" 
        DeleteCommand="DELETE FROM [content] WHERE [id_content] = @id_content" 
        InsertCommand="INSERT INTO [content] ([id_contentType], [id_lang], [title], [postdate], [modified_date], [teaser], [body], [thumbnail_image], [content_image], [mobile_body], [mobile_thumbnail], [mobile_image], [published], [promoted], [IsMobileActive], [views], [mobile_views]) VALUES (@id_contentType, @id_lang, @title, @postdate, @modified_date, @teaser, @body, @thumbnail_image, @content_image, @mobile_body, @mobile_thumbnail, @mobile_image, @published, @promoted, @IsMobileActive, @views, @mobile_views)" 
        SelectCommand="SELECT * FROM [content]" 
        UpdateCommand="UPDATE [content] SET [id_contentType] = @id_contentType, [id_lang] = @id_lang, [title] = @title, [postdate] = @postdate, [modified_date] = @modified_date, [teaser] = @teaser, [body] = @body, [thumbnail_image] = @thumbnail_image, [content_image] = @content_image, [mobile_body] = @mobile_body, [mobile_thumbnail] = @mobile_thumbnail, [mobile_image] = @mobile_image, [published] = @published, [promoted] = @promoted, [IsMobileActive] = @IsMobileActive, [views] = @views, [mobile_views] = @mobile_views WHERE [id_content] = @id_content">
        <DeleteParameters>
            <asp:Parameter Name="id_content" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_contentType" Type="Int32" />
            <asp:Parameter Name="id_lang" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="postdate" Type="DateTime" />
            <asp:Parameter Name="modified_date" Type="DateTime" />
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
            <asp:Parameter Name="views" Type="Int32" />
            <asp:Parameter Name="mobile_views" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_contentType" Type="Int32" />
            <asp:Parameter Name="id_lang" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="postdate" Type="DateTime" />
            <asp:Parameter Name="modified_date" Type="DateTime" />
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
            <asp:Parameter Name="views" Type="Int32" />
            <asp:Parameter Name="mobile_views" Type="Int32" />
            <asp:Parameter Name="id_content" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
