using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.txtFolioCompra.Text = CargarNumeroFolioCompra();
            }
        }

        public string CargarNumeroFolioCompra()
        {
            MUSEBEDataContext db = new MUSEBEDataContext();
            var Numero = db.Compras_Obtener_Folio();
            string Folio = "";
            foreach (var q in Numero)
            {
                Folio = q.Folio;
            }
            return Folio.ToString();
        }




        public static String Test(string s)
        {
            if (String.IsNullOrEmpty(s))
                return DBNull.Value.ToString();
            else
                return s;
        }
        public void CalcularTotal()
        {
            this.txtTotal.Text = Convert.ToString(Convert.ToDecimal(this.txtSubtotal.Text) + Convert.ToDecimal(this.txtPropina.Text) + Convert.ToDecimal(this.txtIVA.Text) + Convert.ToDecimal(this.txtIEPS.Text) + Convert.ToDecimal(this.txtISH.Text));
        }


        protected void txtSubtotal_TextChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void txtIVA_TextChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void txtIEPS_TextChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void txtISH_TextChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void txtPropina_TextChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void cboFormaPago_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                if (this.cboFormaPago.SelectedItem.Value.ToString() == "2")
                {
                    this.rdbTipoCredito.Visible = true;
                }
                else
                {
                    this.rdbTipoCredito.Visible = false;
                    this.cboMSI.Visible = false;
                    this.cboDiasCredito.Visible = false;
                    this.cboTarjetasCredito.Visible = false;
                    this.fechaTransferencia.Visible = false;
                    this.txtNumeroChequetRansferencia.Visible = false;
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void rdbTipoCredito_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (this.rdbTipoCredito.SelectedItem.Value.ToString() == "1")
                {
                    this.cboMSI.Visible = true;
                    this.cboDiasCredito.Visible = false;
                }
                else if (this.rdbTipoCredito.SelectedItem.Value.ToString() == "2")
                {
                    this.cboMSI.Visible = false;
                    this.cboDiasCredito.Visible = true;
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void cboMetodoPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cboMetodoPago.SelectedItem.Value.ToString() == "2")
                {
                    this.cboTarjetasCredito.Visible = true;
                    this.fechaTransferencia.Visible = false;
                    this.txtNumeroChequetRansferencia.Visible = false;
                }
                else if (cboMetodoPago.SelectedItem.Value.ToString() == "3")
                {
                    this.cboTarjetasCredito.Visible = false;
                    this.fechaTransferencia.Visible = false;
                    this.txtNumeroChequetRansferencia.Visible = true;
                }
                else if (cboMetodoPago.SelectedItem.Value.ToString() == "4")
                {
                    this.cboTarjetasCredito.Visible = false;
                    this.fechaTransferencia.Visible = true;
                    this.txtNumeroChequetRansferencia.Visible = false;
                }
                else
                {
                    this.cboTarjetasCredito.Visible = false;
                    this.fechaTransferencia.Visible = false;
                    this.txtNumeroChequetRansferencia.Visible = false;
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                MUSEBEDataContext db = new MUSEBEDataContext();

                db.SubmitChanges();

                //this.grdProductos.DataBind();

            }
            catch (Exception ex) { ex.ToString(); }
        }

        public void EsNulo(string str)
        {

            if (string.IsNullOrEmpty(str))
            {
                MessageBox.Show("String is empty or null");
            }
        }

    }
}