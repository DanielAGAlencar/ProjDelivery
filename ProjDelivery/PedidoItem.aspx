<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="PedidoItem.aspx.cs" Inherits="ProjDelivery.PedidoItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table {
            margin-right: 0px;
        }
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
                    <asp:Label ID="lblID" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                    <div class="form-group">
                        Itens<br />
             
                        <br />
             
                        <br />
                        &nbsp;&nbsp;<table style="width:100%;">
                            <tr>
                                <td>&nbsp;</td>
                                <td aria-orientation="horizontal">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                        <asp:GridView ID="GDVItemSalada" CssClass="table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCommand="GDVItemSalada_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="descricao" HeaderText="Descrição" />
                                <asp:BoundField DataField="valor" HeaderText="Valor" />                        
                                <asp:ButtonField ButtonType="Image" Text="Inserir" CommandName="A" ImageUrl="~/img/plus.png">
                                </asp:ButtonField>                        
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
             
                                </td>
                                <td>
                        <asp:GridView ID="GVDItemPedido" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GDVItemPedido_RowCommand" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" />
                                <asp:BoundField DataField="fkpedido" HeaderText="Pedido" />
                                <asp:BoundField DataField="fkitem" HeaderText="Item" />
                                <asp:BoundField DataField="quatidade" HeaderText="Quantidade" />
                                <asp:BoundField DataField="valor" HeaderText="Valor" />                                
                                <asp:ButtonField ButtonType="Image" CommandName="B" ImageUrl="~/img/delete_4219.png" Text="Excluir" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="53px" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
             
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <br />
    &nbsp;</div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <asp:Button ID="BtnPagar" runat="server" class="btn btn-success" OnClick="BtnPagar_Click" Text="Pagar" />
                        <br />
                        </div>
                </div>
            </div>
        </form>
</asp:Content>
