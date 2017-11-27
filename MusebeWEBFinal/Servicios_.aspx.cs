using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Servicios_ : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.Page.IsPostBack)
			{
				this.lnkEditar.Visible = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
			}
		}

		protected void lnkEditar_Click(object sender, EventArgs e)
		{
			try
			{
				this.popupServicios.HeaderText = App_GlobalResources.Mensajes.popupServiciosEncabezado;
				this.popupServicios.ShowOnPageLoad = true;
				this.popupServicios.ShowShadow = true;
			}
			catch (Exception ex) { ex.ToString(); }
		}

		protected void lnkDetalle_Click(object sender, EventArgs e)
		{
			try { }
			catch (Exception ex) { ex.ToString(); }
		}
	}
}