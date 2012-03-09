<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas, velit molestie
            sollicitudin posuere, arcu ipsum tempor odio, ut semper quam est vel mauris. Proin
            ipsum nisl, malesuada ultrices ornare vitae, pretium quis felis. Nulla facilisi.
            Donec sem nisl, accumsan ut pharetra eget, vestibulum eu turpis. Aenean viverra,
            lacus posuere lobortis vehicula, risus nibh bibendum dui, eget ornare dui sapien
            vel est. Maecenas venenatis purus et ligula tincidunt tristique. Vivamus lectus
            ipsum, sagittis a blandit ut, cursus eget nulla. Aliquam hendrerit sapien vel enim
            ullamcorper quis tristique eros gravida. Duis varius, nisi ac tempus adipiscing,
            nunc sapien fermentum turpis, non aliquam lectus purus at lacus. Donec dignissim
            blandit pellentesque. Ut sapien tellus, tempus quis molestie id, condimentum in
            mauris. Quisque rhoncus urna auctor ligula rhoncus adipiscing. Quisque sed blandit
            sapien. Morbi vitae metus a est lobortis elementum. Donec eu est mi.</p>
        <br>
        <p>For more information please contact us <asp:HyperLink ID="suppportLink" runat="server" NavigateUrl="~/Support.aspx" Text="here"></asp:HyperLink>.</p>
        <br>
</asp:Content>