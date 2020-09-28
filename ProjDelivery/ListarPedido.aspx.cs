using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class ListarPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTable();
        }
        private void LoadTable()
        {

            // Cria a lista de pedidos
            DadosEntities context = new DadosEntities();
            List<pedido> list = context.pedido.ToList<pedido>();

            // Envia a lista de itens para a grid GDVPedido
            GDVPedido.DataSource = list.OrderByDescending(idp => idp.Id);
            GDVPedido.DataBind();

        }

        // Alterar situação do pedido
        protected void GDVPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int line = int.Parse(e.CommandArgument.ToString());
            int id = int.Parse(GDVPedido.Rows[line].Cells[0].Text);

            DadosEntities context = new DadosEntities();
            pedido pedido = context.pedido.First(c => c.Id == id);

            if (e.CommandName == "A")
            {
                if(pedido.situacao != "Pago")
                {
                    lblSituacao.Text = "Pedido com situação diferente de pago não pode ser entregue";
                    DisplayModalSituacaoPedido(this);
                }
                else
                {
                    lblEntrega.Text = id.ToString();
                    lblMsgEntrega.Text = "Tem certeza que deseja marcar como entregue este pedido?";
                    DisplayModal(this);
                }
            }
            if (e.CommandName == "B")
            {
                lblCancela.Text = id.ToString();
                lblMsgCancela.Text = "Tem certeza que deseja marcar como cancelado o pedido " + id.ToString() + "?";
                DisplayModalCancelar(this);
            }
            if (e.CommandName == "C")
            {
                if(pedido.situacao != "Rascunho")
                {
                    lblSituacao.Text = "Pedido com situação diferente de rascunho não pode ser editado";
                    DisplayModalSituacaoPedido(this);
                }
                else
                {
                    Response.Redirect("PedidoItem.aspx?idPedido=" + id);
                }                
            }

        }
        // Exibe erro se querer editar pedido diferente de rascunho
        private void DisplayModalSituacaoPedido(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarSituacaoPedido();",
                                               true);
        }

        // Exibe modal de conformação de cancelamento do pedido
        private void DisplayModalCancelar(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarModalCancelar();",
                                               true);
        }
        // Altera o pedido para cancelado
        protected void btnConfirmCancela_Click(object sender, EventArgs e)
        {
            int id = int.Parse(lblCancela.Text);

            DadosEntities context = new DadosEntities();
            pedido pedido = context.pedido.First(c => c.Id == id);
            string situa = string.Format(pedido.situacao);
            pedido.situacao = "Cancelado";
            context.SaveChanges();            
            LoadTable();
        }

        // Exibe modal de confirmaçã de entrega do pedido
        private void DisplayModal(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarModal();",
                                               true);
        }
         // Altera o pedido para entregue
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int id = int.Parse(lblEntrega.Text);

            DadosEntities context = new DadosEntities();
            pedido pedido = context.pedido.First(c => c.Id == id);
            string situa = string.Format(pedido.situacao);
            pedido.situacao = "Entregue";
            context.SaveChanges();
            LoadTable();
        }
    }
}