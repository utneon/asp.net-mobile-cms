<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserInfo.aspx.cs" Inherits="UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginView ID="UserInfoLoginView" runat="server">
        <AnonymousTemplate>
            <p>
                Please login first to edit your personal information.</p>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <p>
                Please fill these personal information so we can process your orders.</p>
            <label>
                Name:
            </label>
            <asp:TextBox ID="registerNome" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required" ControlToValidate="registerNome"></asp:RequiredFieldValidator>
            <br />
            <label>
                Address:
            </label>
            <asp:TextBox ID="registerMorada" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="registerMorada"
                ErrorMessage="Address is required!"></asp:RequiredFieldValidator>
            <br />
            <label>
                Email:
            </label>
            <asp:TextBox ID="registerEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator3" runat="server" ErrorMessage="The E-Mail Address is required."
                ControlToValidate="registerEmail"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Please enter a valid e-mail address." 
                ControlToValidate="registerEmail"></asp:RegularExpressionValidator>
            <br />
            <label>
                Phone or other contact:
            </label>
            <asp:TextBox ID="registerContacto" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your contact."
                ControlToValidate="registerContacto"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="guardarDadosBtn" runat="server" Text="Save Information" OnClick="guardarDadosBtn_Click" />
            <p>
                Nota: Campos de profile para demonstração. Em versão de produção adicionar campos
                como cartão de crédito e separar a morada utilizando o Group no xml do profile para
                uma melhor optimização a nível de validação de campos independentes (Localidade,
                Código postal, etc...).</p>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
