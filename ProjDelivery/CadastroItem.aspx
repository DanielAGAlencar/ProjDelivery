<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CadastroItem.aspx.cs" Inherits="ProjDelivery.CadastroItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">




        <div style="padding-top: 2%"></div>
        <div class="col-sm-8">
            <h2>Cadastro de Item</h2>
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="col-sm-2">
                    <asp:Label ID="lblMSG" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="MsgErro" runat="server"></asp:Label>
                    <br />
                    <br />
                    <div class="form-group">
                        Descrição<br />
                        &nbsp;<asp:TextBox ID="TxtDescricao" CssClass="form-control" runat="server" Width="400px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        Tipo<br />
    &nbsp;<asp:DropDownList ID="TxtTipo" runat="server" Height="22px" Width="205px">
                            <asp:ListItem>Carne</asp:ListItem>
                            <asp:ListItem>Salada</asp:ListItem>
                            <asp:ListItem>Pão</asp:ListItem>
                            <asp:ListItem>Queijo</asp:ListItem>
                            <asp:ListItem>Batata</asp:ListItem>
                            <asp:ListItem>Molho</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    Valor<br />
    &nbsp;<asp:TextBox ID="TxtValor" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                    <div class="form-group">
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <br />
                        <asp:Button ID="BtnSalvar" runat="server" OnClick="BtnSalvar_Click" Text="Salvar" />
                        &nbsp;
                        <asp:Button ID="BtnNovo" runat="server" Text="Novo" OnClick="BtnNovo_Click" />                        
                        &nbsp;
                        <asp:Button ID="BtnVoltar" runat="server" Text="Voltar" OnClick="BtnVoltar_Click" />
                    </div>
                </div>
            </div>
        </form>

</asp:Content>
