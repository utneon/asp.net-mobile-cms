<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebCart.ascx.cs" Inherits="WebCart" %>
<p style="font-size: 10px;">
    <asp:Label ID="shoopingCartItems" runat="server"></asp:Label></p>
<br />
<p style="font-size: 12px; color: #ff6666;">
    <asp:Label ID="shoppingCartTotal" runat="server" Text="Total: 0"></asp:Label><label>€</label>
</p>
<asp:HyperLink ID="purchaseLink" runat="server"></asp:HyperLink>
