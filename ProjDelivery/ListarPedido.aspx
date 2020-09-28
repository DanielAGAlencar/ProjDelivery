<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListarPedido.aspx.cs" Inherits="ProjDelivery.ListarPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
        <div style="padding-top: 2%"></div>
        <div class="col-sm-8">
            <h2>Lista de Pedidos</h2>
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <br />
                        <asp:Label ID="lblMSG" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                        <br />
                        <asp:GridView ID="GDVPedido" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="393px" OnRowCommand="GDVPedido_RowCommand" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" />
                                <asp:BoundField DataField="obs" HeaderText="Observação" />
                                <asp:BoundField DataField="situacao" HeaderText="Situação" />   
                                <asp:BoundField DataField="total" HeaderText="Total" />
                                <asp:BoundField DataField="desconto" HeaderText="Desconto" />
                                <asp:BoundField DataField="totalliquido" HeaderText="Total Final" />
                                <asp:ButtonField ButtonType="Image" CommandName="A" ImageUrl="~/img/entrega.jpg" Text="Entregar" />
                                <asp:ButtonField ButtonType="Image" CommandName="B" ImageUrl="~/img/cancela.png" Text="Cancelar" />
                                <asp:ButtonField ButtonType="Image" CommandName="C" ImageUrl="~/img/DocumentEdit_40924.png" Text="Alterar" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                </div>
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
                                <asp:Label ID="lblMsgEntrega" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <asp:Button ID="btnConfirm" CssClass="btn btn-danger" runat="server" Text="Confirmar" OnClick="btnConfirm_Click" />
                                <asp:Label ID="lblEntrega" runat="server" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalMsgCancelar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabelCancelar">Confirmação</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblMsgCancela" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <asp:Button ID="bntCanfirmCancela" CssClass="btn btn-danger" runat="server" Text="Confirmar" OnClick="btnConfirmCancela_Click" />
                                <asp:Label ID="lblCancela" runat="server" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalMsgSituacaoPedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabelSituacaoPedido">Situação</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblSituacao" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
</asp:Content>
