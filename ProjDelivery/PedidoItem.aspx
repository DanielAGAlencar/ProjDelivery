<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="PedidoItem.aspx.cs" Inherits="ProjDelivery.PedidoItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <form id="form1" runat="server">
        <h2>Criar Pedido</h2>
        <asp:Label ID="lblID" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <div class="row">
            <div class="col-sm">
                <asp:GridView ID="GDVItemSalada" CssClass="table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCommand="GDVItemSalada_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="descricao" HeaderText="Descrição" />
                        <asp:BoundField DataField="valor" HeaderText="Valor" />
                        <asp:ButtonField ButtonType="Image" Text="Inserir" CommandName="A" ImageUrl="~/img/plus.png"></asp:ButtonField>
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
            </div>
            <div class="col-sm">
                <asp:GridView ID="GVDItemPedido" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GDVItemPedido_RowCommand">
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
            </div>
        </div>
        <asp:Button ID="BtnPagar" runat="server" class="btn btn-success" OnClick="BtnPagar_Click" Text="Pagar" />

    </form>
</asp:Content>
