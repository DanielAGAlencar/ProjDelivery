using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjDelivery
{
    public partial class CadastroFormaPagto : System.Web.UI.Page
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

            string DescricaoFormaPagto = Request.QueryString["DescricaoFormaPagto"];

            DadosEntities context = new DadosEntities();
            formapagto formapagto = new formapagto()
            {
                descricao = TxtDescricao.Text
            };

            if (String.IsNullOrEmpty(DescricaoFormaPagto))
            {
                context.formapagto.Add(formapagto);
                lblMSG.Text = "Registro Inserido!";
            }
            else
            {
                String DescricaoNew = DescricaoFormaPagto;
                formapagto b = context.formapagto.First(c => c.descricao == DescricaoNew);
                b.descricao = TxtDescricao.Text;
                lblMSG.Text = "Registro Atualizado!";
            }
            context.SaveChanges();
        }

        protected void BtnNovo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroFormaPagto.aspx");
        }

        protected void BtnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void LoadDataPage()
        {
            string DescricaoFormaPagto = Request.QueryString["DescricaoFormaPagto"];

            if (!String.IsNullOrEmpty(DescricaoFormaPagto))
            {
                DadosEntities context = new DadosEntities();
                string DescricaoNew = DescricaoFormaPagto;
                formapagto formapagto = context.formapagto.First(c => c.descricao == DescricaoNew);

                TxtDescricao.Text = formapagto.descricao;
            }
        }
    }
}