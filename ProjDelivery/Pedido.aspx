<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="ProjDelivery.Pedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-control {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

        <div style="padding-top: 2%"></div>
        <div class="col-sm-8">
            <h2>Criar Pedido</h2>
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="col-sm-2">
                    <asp:Label ID="lblMSG" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    <br />
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                    <div class="form-group">
                        Observação<br />
                        &nbsp;<asp:TextBox ID="TxtObs" CssClass="form-control" runat="server" Width="400px" Height="121px"></asp:TextBox>
    &nbsp;</div>
                    <br />
    &nbsp;<div class="form-group">
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
