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

        protected void cboFormaPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //if (cboFormaPago.SelectedItem.Value.ToString() == "1")
                //{
                //    this.cboTarjeta.Visible = true;
                //    this.txtNumeroChequetRansferencia.Visible = false;
                //    this.fcharansferencia.Visible = false;
                //}
                //else if (cboFormaPago.SelectedItem.Value.ToString() == "2")
                //{
                //    this.cboTarjeta.Visible = false;
                //    this.txtNumeroChequetRansferencia.Visible = true;
                //    this.fcharansferencia.Visible = false;

                //}
                //else if (cboFormaPago.SelectedItem.Value.ToString() == "3")
                //{
                //    this.cboTarjeta.Visible = false;
                //    this.txtNumeroChequetRansferencia.Visible = false;
                //    this.fcharansferencia.Visible = true;

                //}
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void txtAgregar_Click(object sender, EventArgs e)
        {
            MUSEBEDataContext db = new MUSEBEDataContext();
            try
            {
                //if (cboFormaPago.SelectedItem.Value.ToString() == "1")
                //{
                //    //db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), Int32.Parse(Test(this.cboTarjeta.SelectedItem.Value.ToString())), null, null);//this.fcharansferencia.Date);
                //    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                //}
                //else if (cboFormaPago.SelectedItem.Value.ToString() == "2")
                //{
                //    //db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), null, this.txtNumeroChequetRansferencia.Text, null);//this.fcharansferencia.Date);
                //    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                //}
                //else if (cboFormaPago.SelectedItem.Value.ToString() == "3")
                //{
                //    //db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), null, null, this.fcharansferencia.Date);//this.fcharansferencia.Date);
                //    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                //}
                //db.SubmitChanges();

                //this.grdProductos.DataBind();
            }
            catch (Exception ex) { ex.ToString(); }
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
                if (cboFormaPago.SelectedItem.Value.ToString() == "1")
                {
                    db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), Int32.Parse(Test(this.cboTarjeta.SelectedItem.Value.ToString())), null, null);//this.fcharansferencia.Date);
                    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                }
                else if (cboFormaPago.SelectedItem.Value.ToString() == "2")
                {
                    //db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), null, this.txtNumeroChequetRansferencia.Text, null);//this.fcharansferencia.Date);
                    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                }
                else if (cboFormaPago.SelectedItem.Value.ToString() == "3")
                {
                    //db.Compras_Insertar_Modificar(Int32.Parse(this.txtFolioCompra.Text), this.fechaCompra.Date, Int32.Parse(Test(this.cboProveedor.SelectedItem.Value.ToString())), this.txtNumeroTicket.Text, this.txtNumeroFactura.Text, Int32.Parse(Test(this.cboFormaPago.SelectedItem.Value.ToString())), null, null, this.fcharansferencia.Date);//this.fcharansferencia.Date);
                    //db.Compras_Detalle_Insertar(Int32.Parse(this.txtFolioCompra.Text), this.txtItem.Text, decimal.Parse(this.PrecioUnitario.Text), float.Parse(this.txtCantidad.Text));

                }
                db.SubmitChanges();

                this.grdProductos.DataBind();

            }
            catch (Exception ex) { ex.ToString(); }
        }

    }
}