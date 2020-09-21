using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class PedidoItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTable();
            string idPedido = Request.QueryString["idPedido"];
            if (!IsPostBack)
            {
                
                int idNew = int.Parse(idPedido);
                lblID.Text = "Pedido: " + idNew.ToString();

            }
        }

        private void LoadTable()
        {

            // Cria a lista de itens
            DadosEntities context = new DadosEntities();
            List<item> list = context.item.ToList<item>();

            // Envia a lista de itens para a grid GDVItemSalada
            GDVItemSalada.DataSource = list;           
            GDVItemSalada.DataBind();
            
            // Recebe a o id do pedido "passado pela pagina anterior"
            string idPedido = Request.QueryString["idPedido"];

            // Nova variável que recebe o id do pedido convertido em int
            int idNew = int.Parse(idPedido);

            // Cria a lista de itens do pedido
            DadosEntities ci = new DadosEntities();            
            List<pedidoitem> listitem = ci.pedidoitem.ToList<pedidoitem>();

            // Envia a lista de itens do pedido para a grid GVDItemPedido
            // FindAll(x => x.fkpedido == idNew) parâmetro para exibir apenas os registros da tabela que tem relação com o pedido
            GVDItemPedido.DataSource = listitem.FindAll(x => x.fkpedido == idNew);
            GVDItemPedido.DataBind();
        }

        protected void GDVItemSalada_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idPedido = Request.QueryString["idPedido"];
            int line = int.Parse(e.CommandArgument.ToString());
            string descricao = string.Format(GDVItemSalada.Rows[line].Cells[0].Text);
                       
            DadosEntities context = new DadosEntities();
            string utf8_String = descricao;
            byte[] bytes = Encoding.Default.GetBytes(utf8_String);
            utf8_String = Encoding.UTF8.GetString(bytes);
            item item = context.item.First(c => c.descricao == utf8_String);

            if (e.CommandName == "A")
            {
                // Inseri os itens do pedido da tabela pedidoitem
                DadosEntities c = new DadosEntities();
                pedidoitem pedidoitem = new pedidoitem()
                {
                    fkpedido = int.Parse(idPedido),
                    fkitem = item.descricao,
                    quatidade = 1,
                    valor = item.valor,
                    total = item.valor,
                };
                context.pedidoitem.Add(pedidoitem);

                // Update do valores do Pedido
                DadosEntities p = new DadosEntities();
                int idNew = int.Parse(idPedido);                
                pedido pedido = context.pedido.First(d => d.Id == idNew);
                pedido.total = pedido.total + item.valor;
                pedido.totalliquido = pedido.total - pedido.desconto;

                // Salva os dados
                context.SaveChanges();
                LoadTable();

            }


        }

        /*protected void GDVItemPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idPedido = Request.QueryString["idPedido"];
            int line = int.Parse(e.CommandArgument.ToString());
            int Id = string.Format(GDVItemPedido.Rows[line].Cells[0].Text);

            DadosEntities context = new DadosEntities();
            pedidoitem pedidoitem = context.pedidoitem.First(c => c.fkpedido == idPedido);
        }*/

        // Confirmação de exclusão
            private void DisplayModal(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarModal();",
                                               true);
        }

    }

}