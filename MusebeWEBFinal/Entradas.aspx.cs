using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Entradas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ObtenerFolio();
            }
        }

        public void ObtenerFolio()
        {
            try
            {
                MUSEBEDataContext db = new MUSEBEDataContext();
                var folio = db.Entradas_Obtener_Folio();
                foreach (var d in folio)
                {
                    this.txtFolio.Text = d.Folio;
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Guardar();
                MUSEBEDataContext db = new MUSEBEDataContext();
                db.Entradas_Insertar_Detalle(Int32.Parse(this.txtFolio.Text), Int32.Parse(this.cboProducto.SelectedItem.Value.ToString()), Int32.Parse(this.txtCantidad.Text), Convert.ToDecimal(this.txtPrecioUnitario.Text));
                this.grdProductos.DataBind();
                this.txtCantidad.Text = string.Empty;
                this.cboProducto.SelectedIndex = -1;
            }
            catch (Exception ex) { ex.ToString(); }
        }

        public void Guardar()
        {
            MUSEBEDataContext db = new MUSEBEDataContext();
            db.Entradas_Insertar(Int32.Parse(this.txtFolio.Text), Int32.Parse(this.cboNombre.SelectedItem.Value.ToString()), Int32.Parse(this.cboProveedor.SelectedItem.Value.ToString()), this.fechaEntrada.Date, this.txtNumeroFactura.Text, "");

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Guardar();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                this.grdEntradas.DataBind();
                this.popupEdicion.ShowOnPageLoad = true;
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void lnkSeleccionar_Click(object sender, EventArgs e)
        {
            this.txtFolio.Text = this.grdEntradas.GetRowValues(this.grdEntradas.FocusedRowIndex, "Id").ToString();
            MUSEBEDataContext db = new MUSEBEDataContext();
            var detalle = db.Entradas_Consultar_Detalle(Int32.Parse(this.grdEntradas.GetRowValues(this.grdEntradas.FocusedRowIndex, "Id").ToString()));
            foreach (var d in detalle)
            {
                this.cboNombre.Items.FindByValue(d.IdOrigen.ToString()).Selected = true;
                this.cboProveedor.Items.FindByValue(d.IdProveedor.ToString()).Selected = true;
                this.fechaEntrada.Date = d.Fecha;
                this.txtNumeroFactura.Text = d.Factura;
            }
            this.grdProductos.DataBind();
            this.popupEdicion.ShowOnPageLoad = false;
        }

        protected void subirFactura_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                string filename = Path.GetFileName(e.UploadedFile.FileName);
                string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);
                string targetPath = Server.MapPath("Documentos/Facturas/" + e.UploadedFile.FileName);
                if (File.Exists(targetPath))
                {
                    File.Delete(targetPath);
                }
                e.UploadedFile.SaveAs(targetPath);
                MUSEBEDataContext db = new MUSEBEDataContext();
                db.Entradas_Documentos_Factura(Int32.Parse(this.txtFolio.Text), "~/Documentos/Facturas/" + e.UploadedFile.FileName);
                this.grdFacturas.DataBind();
            }
            catch (Exception ex) { ex.ToString(); }
        }
    }
}