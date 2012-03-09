<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <p>Support Tickets "Open":</p>
            </td>
            <td>
                <asp:Label ID="ticketsopenLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <p>New Orders on Products:</p>
            </td>
            <td>
                <asp:Label ID="newOrdersLabel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
