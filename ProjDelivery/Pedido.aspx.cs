using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class Pedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataPage();
            }
        }

        protected void BtnSalvar_Click(object sender, EventArgs e)
        {

            string IdPedido = Request.QueryString["IdPedido"];

            DadosEntities context = new DadosEntities();
            pedido pedido = new pedido()
            {
                obs = TxtObs.Text,
                total = 0,
                desconto = 0,
                totalliquido = 0,
                situacao = string.Format("Rascunho")
            };

            if (String.IsNullOrEmpty(IdPedido))
            {
                context.pedido.Add(pedido);
                context.SaveChanges();
                //lblMSG.Text = "Pedido Criado!";
                int id = pedido.Id;
                //lblID.Text = "Numero do Pedido: " + id.ToString();
                Response.Redirect("PedidoItem.aspx?idPedido=" + id);
            }
            else
            {
                String PedidoNew = IdPedido;
                pedido b = context.pedido.First(c => c.obs == PedidoNew);
                b.obs = TxtObs.Text;
                lblMSG.Text = "Registro Atualizado!";
            }
            context.SaveChanges();

        }

        protected void BtnNovo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pedido.aspx");
        }

        protected void BtnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void LoadDataPage()
        {
            string IdPedido = Request.QueryString["IdPedido"];

            if (!String.IsNullOrEmpty(IdPedido))
            {
                DadosEntities context = new DadosEntities();
                string PedidoNew = IdPedido;
                pedido pedido = context.pedido.First(c => c.obs == PedidoNew);
                TxtObs.Text = pedido.obs;
            }
        }
    }
}