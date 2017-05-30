<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VigenereCipher._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                   <div class="form-group">
                        <asp:Label ID="MessageLabel" runat="server" Text="Message for Encryption/Decryption"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="MessageTextBox" MaxLength="60" runat="server" required="true" CausesValidation="True"></asp:TextBox>
                       <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "MessageTextBox" ID="RegularExpressionValidatorMessageTextBox" ValidationExpression = "^[\s\S]{20,60}$" runat="server" ErrorMessage="The encryption key must be between 20 and 60 characters long."></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="EncryptionKeyLabel" runat="server" Text="Encryption Key"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="EncryptionKeyTextBox" MaxLength="10" runat="server" required="true" CausesValidation="True"></asp:TextBox>
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "EncryptionKeyTextBox" ID="RegularExpressionValidatorKeyTextBox" ValidationExpression = "^[\s\S]{5,10}$" runat="server" ErrorMessage="The encryption key must be between 5 and 10 characters long."></asp:RegularExpressionValidator>
                    </div>

                    <div>
                        <asp:RadioButton id="Encrypt" runat="server" GroupName="EncryptOrDecrypt" Text="Encrypt" Checked="true"></asp:RadioButton>
                        <asp:RadioButton id="Decrypt" runat="server" GroupName="EncryptOrDecrypt" Text="Decrypt"></asp:RadioButton>
                    </div>

                    <div>
                        <asp:RadioButton id="ROT0" runat="server" GroupName="RotSelection" Text="ROT0" Checked="true"></asp:RadioButton>
                        <asp:RadioButton id="ROT1" runat="server" GroupName="RotSelection" Text="ROT1"></asp:RadioButton>
                    </div>

                    <asp:Button CssClass="btn btn-primary" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click1" />
                    <br />
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="FinalMessageLabel" runat="server" Text="Encrypted Message"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="FinalMessageTextBox" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
                    </div>
            </div>
        </div>
    </div>
    </div>

</asp:Content>
