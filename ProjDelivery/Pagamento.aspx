<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Pagamento.aspx.cs" Inherits="ProjDelivery.Pagamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
        <div style="padding-top: 2%"></div>
        <div class="col-sm-8">
            <h2>Pagamento</h2>
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="col-sm-2">
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                    <asp:DropDownList ID="TxtFormaPagto" runat="server" class="btn btn-secondary dropdown-toggle" Height="40px" Width="205px" DataSourceID="SQLFormaPagto" DataTextField="descricao" DataValueField="descricao">
                    </asp:DropDownList><br />
                    <asp:SqlDataSource ID="SQLFormaPagto" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select descricao from formapagto;"></asp:SqlDataSource>                    
                    <br />
                    Desconto<br />
                    &nbsp;<asp:TextBox ID="TxtDesconto" CssClass="form-control" runat="server" Width="400px"></asp:TextBox>
                    <br />
                    <asp:Button ID="BtnPagar" runat="server" class="btn btn-success" OnClick="BtnPagar_Click" Text="Pagar" />
                    <br />
                    <br />
                <div class="modal fade" id="modalMsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirmação</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <asp:Button ID="btnConfirm" CssClass="btn btn-danger" runat="server" Text="Confirmar" OnClick="btnConfirm_Click" />
                                <asp:Label ID="lblConfirmacao" runat="server" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
</asp:Content>
