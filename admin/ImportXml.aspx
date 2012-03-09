<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdministrationPage.master"
    AutoEventWireup="true" CodeFile="ImportXml.aspx.cs" Inherits="admin_ImportXml" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="importMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="selectSourceView" runat="server">
            <p>
                Please select a XML file source:</p>
            <br />
            <table>
                <tr>
                    <td>
                        <p>
                            XML (URL) Location:</p>
                    </td>
                    <td>
                        <asp:TextBox ID="locationTextBox" runat="server" Text="http://www.utneon.com/utneon/products.xml"
                            Width="270"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="locationTextBox"
                            ErrorMessage="Please do not continue without loading the document"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Please insert a valid URL." ControlToValidate="locationTextBox" 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="nextstep1" runat="server" Text="Load Document" OnClick="nextstep1_Click" />
        </asp:View>
        <asp:View ID="confirmSourceView" runat="server">
            <p>
                <asp:Label ID="xmlReportLabel" runat="server"></asp:Label></p>
            <br />
            <p>
                Confirm import</p>
            <br />
            <asp:Button ID="nextstep2" runat="server" Text="Import Products" 
                onclick="nextstep2_Click" />
        </asp:View>
        <asp:View ID="completeSourceView" runat="server">
            <p>
                <asp:Label ID="xmlCompleteLabel" runat="server"></asp:Label></p>
        </asp:View>
    </asp:MultiView>
</asp:Content>
