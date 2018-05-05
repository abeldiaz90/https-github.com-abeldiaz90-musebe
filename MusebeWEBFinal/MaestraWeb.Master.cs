using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class MaestraWeb : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			Etiquetado();
			//MostrarLogo();
		}
		public void MostrarLogo()
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var query = db.Logo_Obtener_Musebe(this.Page.User.Identity.ToString());
			foreach (var i in query)
			{
				this.imglogo.Value = i.Logo;

			}
		}

		void Etiquetado()
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var emp=db.Empresas_Consultar_Todas();
			foreach(var i in emp)
			{
				this.tel.Text = i.Telefono;
				this.cel.Text = i.Celular;
				this.mail.Text = i.Correo;
				linkcorreo.HRef = "mailto:" + i.Correo;
				lnkTelefonoOficina.HRef = "tel:+" + i.Telefono;
				lnkTelefonoCelular.HRef = "tel:+" + i.Celular;
			}
		}

		
	}
}