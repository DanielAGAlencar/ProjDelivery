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
                    <asp:Label ID="MsgErro" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <div class="form-group">
                        Descrição<br />
                        &nbsp;<asp:TextBox ID="TxtDescricao" CssClass="form-control" runat="server" Width="400px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        Tipo<br />
    &nbsp;<asp:DropDownList ID="TxtTipo" runat="server" class="btn btn-secondary dropdown-toggle" Height="40px" Width="205px">
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
                <div class="col-sm-2" runat="server" Height="40px" Width="400px">
                    <div class="form-group" runat="server" Height="40px" Width="400px">
                        <br />
                        <asp:Button ID="BtnSalvar" runat="server" class="btn btn-success" OnClick="BtnSalvar_Click" Text="Salvar" />
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnNovo" runat="server" class="btn btn-primary" Text="Novo" OnClick="BtnNovo_Click" />                        
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnVoltar" runat="server" class="btn btn-secondary" Text="Voltar" OnClick="BtnVoltar_Click" />
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <br />
                        <br />
                        <asp:GridView ID="GDVItem" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="393px" OnRowCommand="GDVItem_RowCommand" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="descricao" HeaderText="Descrição" />
                                <asp:BoundField DataField="tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="valor" HeaderText="Valor" />                                
                                <asp:ButtonField ButtonType="Image" CommandName="A" ImageUrl="~/img/delete_4219.png" Text="Excluir" />
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
                                <asp:Label ID="lblMsgExcluir" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <asp:Button ID="btnConfirm" CssClass="btn btn-danger" runat="server" Text="Confirmar" OnClick="btnConfirm_Click" />
                                <asp:Label ID="lblExcluir" runat="server" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </form>

</asp:Content>
