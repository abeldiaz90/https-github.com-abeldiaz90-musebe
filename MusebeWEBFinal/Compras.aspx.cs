using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

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
                bool Credito = false;
                string FormaPago = null;
                string idtipocredito = null;
                string tipogasto = string.Empty;
                string msi = null;
                string diasCredito = null;
                string metodopago = null;
                string TarjetasCredito = null;
                dynamic fechatransf = null;

                MUSEBEDataContext db = new MUSEBEDataContext();
                FormaPago = this.cboFormaPago.SelectedItem.Value.ToString();
                if (this.cboFormaPago.SelectedItem.Value.ToString() == "2")
                {
                    Credito = true;               
                }
                else
                {
                    Credito = false;
                }

                
                if (this.rdbTipoCredito.Visible)
                {
                    idtipocredito = rdbTipoCredito.SelectedItem.Value.ToString();
                }
                if (this.cboMSI.Visible)
                {
                    msi = cboMSI.SelectedItem.Value.ToString();
                }
                if (this.cboDiasCredito.Visible)
                {
                    diasCredito = this.cboDiasCredito.SelectedItem.Value.ToString();
                }
                if (this.cboTarjetasCredito.Visible)
                {
                    TarjetasCredito = this.cboTarjetasCredito.SelectedItem.Value.ToString();
                }

                string gasto = "";
                if (this.fechaTransferencia.Visible)
                {
                    fechatransf = fechaTransferencia.Date;
                }

                for (int i = 0; i <= lstTipoGasto.Items.Count - 1; i++)
                {
                    if (lstTipoGasto.Items[i].Selected == true)
                    {
                        gasto = lstTipoGasto.Items[i].Value.ToString();
                        tipogasto = gasto + "," + tipogasto;
                    }
                }

                db.Compras_Insertar_Modificar(this.txtFolioCompra.Text, this.fechaCompra.Date, this.cboProveedor.SelectedItem.Value.ToString(), FormaPago, idtipocredito, msi, diasCredito, metodopago, TarjetasCredito, this.txtNumeroChequetRansferencia.Text, fechatransf, decimal.Parse(this.txtSubtotal.Text), decimal.Parse(txtIVA.Text), decimal.Parse(this.txtIEPS.Text), decimal.Parse(this.txtISH.Text), decimal.Parse(this.txtPropina.Text), Credito, "", "", tipogasto);
                db.SubmitChanges();
                this.popupMensajes.ShowOnPageLoad = true;
                this.popupMensajes.HeaderStyle.BackColor = System.Drawing.Color.Green;
                this.lblMensaje.CssClass = "alert alert-success";
                this.lblMensaje.Text = "Los datos han sido Guardados";
            }
            catch (Exception ex)
            {
                this.popupMensajes.ShowOnPageLoad = true;
                this.popupMensajes.HeaderStyle.BackColor = System.Drawing.Color.Green;
                this.lblMensaje.CssClass = "alert alert-danger";
                this.lblMensaje.Text = ex.Message.ToString();
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                LimpiarControles();
                CargarNumeroFolioCompra();
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void lnkTodosElementos_Click(object sender, EventArgs e)
        {

        }

        protected void lnkReporte_Click(object sender, EventArgs e)
        {
            try
            {
                this.ASPxPopupControl1.ShowOnPageLoad = true;
                this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
                LocalReport report = new LocalReport();
                report.EnableExternalImages = true;
                report.ReportPath = "~/Reportes/ConsolidadoCompras.rdlc";

                DataTable ds = LlenarInformeInventario();
                ReportDataSource dsMain = new ReportDataSource();
                dsMain.Name = "ComprasDatos";
                dsMain.Value = ds;

                report.DataSources.Clear();
                report.DataSources.Add(dsMain);


                report.Refresh();
                this.ReportViewer1.Visible = true;
                this.ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/ConsolidadoCompras.rdlc");
                this.ReportViewer1.LocalReport.DataSources.Clear();

                this.ReportViewer1.LocalReport.DataSources.Add(dsMain);
                this.ReportViewer1.DocumentMapCollapsed = true;
                this.ReportViewer1.ShowPrintButton = true;
                this.ReportViewer1.LocalReport.Refresh();

            }
            catch (Exception ex) { ex.ToString(); }
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
        public void LimpiarControles()
        {
            this.txtFolioCompra.Text = string.Empty;
            this.txtIEPS.Text = string.Empty;
            this.txtIVA.Text = string.Empty;
            this.txtPropina.Text = string.Empty;
            this.txtSubtotal.Text = String.Empty;
            this.txtISH.Text = String.Empty;
            this.txtTotal.Text = String.Empty;
            //this.cboDiasCredito.Items.Clear();
            //this.cboDiasCredito.DataBind();
            this.cboDiasCredito.Text = string.Empty;
            this.cboDiasCredito.SelectedIndex = -1;
            //this.cboFormaPago.Items.Clear();
            //this.cboFormaPago.DataBind();
            this.cboFormaPago.SelectedIndex = -1;
            this.cboFormaPago.Text = string.Empty;
            //this.cboMetodoPago.Items.Clear();
            //this.cboMetodoPago.DataBind();
            this.cboMetodoPago.SelectedIndex = -1;
            this.cboMetodoPago.Text = string.Empty;
            //this.cboMSI.Items.Clear();
            //this.cboMSI.DataBind();
            this.cboMSI.SelectedIndex = -1;
            this.cboMSI.Text = string.Empty;
            this.cboProveedor.Items.Clear();
            this.cboProveedor.DataBind();
            this.cboProveedor.SelectedIndex = -1;
            this.cboTarjetasCredito.Items.Clear();
            this.cboTarjetasCredito.DataBind();
            this.cboTarjetasCredito.SelectedIndex = -1;
            CargarNumeroFolioCompra();
        }
        public DataTable LlenarInformeInventario()
        {
            DataTable Informe = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ToString();
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandTimeout = 0;
            com.CommandText = "Compras_Reporte_Consolidado";
            com.ExecuteNonQuery();
            SqlDataAdapter datos = new SqlDataAdapter(com);
            datos.Fill(Informe);
            con.Close();
            return Informe;
        }

    }
}