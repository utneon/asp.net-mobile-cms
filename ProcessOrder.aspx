<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProcessOrder.aspx.cs" Inherits="ProcessOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="confirmOrderMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="confirmView" runat="server">
            <asp:Label ID="confirmLabel" runat="server"></asp:Label>
            <br />
            <asp:HyperLink ID="confirmPurchaseLink" runat="server" NavigateUrl="~/ProcessOrder.aspx?view=processOrderConfirmation"
                Text="Confirm Purchase"></asp:HyperLink>
        </asp:View>
        <asp:View ID="completeView" runat="server">
            <p>
                <asp:Label ID="purchaseCompleteLabel" runat="server"></asp:Label></p>
        </asp:View>
    </asp:MultiView>
</asp:Content>
