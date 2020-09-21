using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class CadastroItem : System.Web.UI.Page
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

            string DescricaoItem = Request.QueryString["DescricaoItem"];

            DadosEntities context = new DadosEntities();
            item item = new item()
            {
                descricao = TxtDescricao.Text,
                tipo = TxtTipo.Text,
                valor = decimal.Parse(TxtValor.Text)
            };

            if (String.IsNullOrEmpty(DescricaoItem))
            {
                context.item.Add(item);
                lblMSG.Text = "Registro Inserido!";
            }
            else
            {
                String DescricaoNew = DescricaoItem;
                item b = context.item.First(c => c.descricao == DescricaoNew);
                b.descricao = TxtDescricao.Text;
                b.tipo = TxtTipo.Text;
                b.valor = decimal.Parse(TxtValor.Text);
                lblMSG.Text = "Registro Atualizado!";
            }
            try
            {
                context.SaveChanges();
            }
            catch (Exception ex)
            {

                MsgErro.Text = ex.Message; // ou "Mensagem que quiser" ;
            }
            

        }

        protected void BtnNovo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroItem.aspx");
        }

        protected void BtnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void LoadDataPage()
        {
            string DescricaoItem = Request.QueryString["DescricaoItem"];

            if (!String.IsNullOrEmpty(DescricaoItem))
            {
                DadosEntities context = new DadosEntities();
                string DescricaoNew = DescricaoItem;
                item item = context.item.First(c => c.descricao == DescricaoNew);

                TxtDescricao.Text = item.descricao;
                TxtTipo.Text = item.tipo;
                TxtValor.Text = item.valor.ToString();
            }
        }
    }
}