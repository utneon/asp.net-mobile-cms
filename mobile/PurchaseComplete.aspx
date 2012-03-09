<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PurchaseComplete.aspx.cs"
    Inherits="mobile_PurchaseComplete" %>
<form id="formProductsConfirm" runat="server">
<div class="toolbar">
            <h1>
                Order Processing</h1>
                <a class="button back" href="#"><asp:label ID="cancelBtn" runat="server" text="Cancel"></asp:label></a>
        </div>
        <div id="field-details">
            <ul>
                <li>
                    <p><asp:label id="mensagemLabel" runat="server" text=""></asp:label></p>
                    <a class="button" href="#home">OK</a>
                </li>
            </ul>
        </div>
</form>