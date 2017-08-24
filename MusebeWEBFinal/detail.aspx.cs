using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class detail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if ((Page.Request.QueryString["Art"] != null) && (Page.Request.QueryString["Art"]) != "")
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				var query = db.Productos_Consultar_Activos_Guid(Guid.Parse(Page.Request.QueryString["Art"].ToString()));
				foreach (var q in query)
				{
					this.lblClave.Text = q.Clave;
					this.lblDescripcion.Text = q.Descripcion;
					this.imgImagen.Value = q.Imagen;
				}
			}
		}
	}
}