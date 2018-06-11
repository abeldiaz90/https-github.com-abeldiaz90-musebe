using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class SolicitudesCotizaciones : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void lnkVer_Click(object sender, EventArgs e)
		{
			LlenarDetalle(Int32.Parse(this.grdCotizacionesNoAtendidas.GetRowValues(this.grdCotizacionesNoAtendidas.FocusedRowIndex, "IdPedido").ToString()));
			this.popupDetalleCotizacion.ShowOnPageLoad = true;
		}

		public void LlenarDetalle(int Id)
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			this.grdCotizacionesDetalle.DataSource = db.PedidosConsultaFolio(Id);
			this.grdCotizacionesDetalle.DataBind();
		}

		protected void grdCotizacionesDetalle_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs e)
		{
			LlenarDetalle(Int32.Parse(this.grdCotizacionesNoAtendidas.GetRowValues(this.grdCotizacionesNoAtendidas.FocusedRowIndex, "IdPedido").ToString()));
		}

		protected void ASPxButton1_Click(object sender, EventArgs e)
		{
			try
			{
				Session["IdPedido"] = this.grdCotizacionesNoAtendidas.GetRowValues(this.grdCotizacionesNoAtendidas.FocusedRowIndex, "IdPedido").ToString();
				Response.Redirect("Cotizaciones.aspx");
				//Response.Redirect("Cotizaciones.aspx?request="+ this.grdCotizacionesNoAtendidas.GetRowValues(this.grdCotizacionesNoAtendidas.FocusedRowIndex, "IdPedido").ToString());

			}
			catch (Exception ex) { ex.ToString(); }
		}
	}
}