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
            LoadTable();
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
                lblMSG.Text = "Registro Inserido!";
                MsgErro.Text = "";
            }
            catch (Exception ex)
            {
                lblMSG.Text = "";
                MsgErro.Text = "Já existe um item cadastrado com essa descrição";//ex.Message; // ou "Mensagem que quiser" ;
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

        private void LoadTable()
        {

            // Cria a lista de itens
            DadosEntities context = new DadosEntities();
            List<item> list = context.item.ToList<item>();

            // Envia a lista de itens para a grid GDVItem
            GDVItem.DataSource = list;
            GDVItem.DataBind();

        }

        protected void GDVItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int line = int.Parse(e.CommandArgument.ToString());
            string descricao = string.Format(GDVItem.Rows[line].Cells[0].Text);

            DadosEntities context = new DadosEntities();
            item item = context.item.First(c => c.descricao == descricao);

            if (e.CommandName == "A")
            {
                lblExcluir.Text = descricao;
                lblMsgExcluir.Text = "Tem certeza que deseja excluir este registro?";
                DisplayModal(this);
            }

        }
        private void DisplayModal(Page page)
        {
            ClientScript.RegisterStartupScript(typeof(Page),
                                               Guid.NewGuid().ToString(),
                                               "MostrarModal();",
                                               true);
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string descricao = string.Format(lblExcluir.Text);

            DadosEntities context = new DadosEntities();
            item item = context.item.First(c => c.descricao == descricao);
            context.item.Remove(item);
            try
            {
                context.SaveChanges();
                lblMSG.Text = "Item Excluido com sucesso!!";
                MsgErro.Text = "";
            }
            catch (Exception p)
            {
                MsgErro.Text = "Erro ao Excluir Item!!"; // ou "Mensagem que quiser" ;
                lblMSG.Text = "";
            }            
            LoadTable();
        }
    }
}