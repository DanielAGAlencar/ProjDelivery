using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class Pagamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idPedido = Request.QueryString["idPedido"];
            if (!IsPostBack)
            {

                int idNew = int.Parse(idPedido);
                lblID.Text = "Pedido: " + idNew.ToString();

            }
        }

        private void DisplayModal(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarModal();",
                                               true);
        }

        protected void BtnPagar_Click(object sender, EventArgs e)
        {
            
            lblMsg.Text = "Confirma o pagamento deste pedido?";
            DisplayModal(this);

           
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string idPedido = Request.QueryString["idPedido"];
            int id = int.Parse(idPedido);

            DadosEntities context = new DadosEntities();
            formapagtopedido formapagtopedido = new formapagtopedido()
            {
                fkpedido = id,
                fkformapagto = TxtFormaPagto.Text,
            };

            // updade na situação do pedido
            DadosEntities p = new DadosEntities();
            pedido pedido = context.pedido.First(c => c.Id == id);
            decimal newDesconto = 0;
            if (TxtDesconto == null)
            {
                newDesconto = 0;
            }
            else
            {
                newDesconto = decimal.Parse(TxtDesconto.Text);
            }

            pedido.desconto = newDesconto;
            pedido.totalliquido = pedido.total - pedido.desconto;
            pedido.situacao = "Pago";

            context.SaveChanges();
            Response.Redirect("ListarPedido.aspx");
        }
    }

    
}