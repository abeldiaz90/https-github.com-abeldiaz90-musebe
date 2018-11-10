using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Correos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void txtEnviar_Click(object sender, EventArgs e)
		{
			Utilidades.Mails correo = new Utilidades.Mails();
			correo.Mail(this.txtPara.Text, this.txtCC.Text, this.txtCCO.Text, this.txtAsunto.Text, true, this.txtMensaje.Text, null);
			LimpiarControles();
			ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
					"err_msg",
					"alert('!El correo ha sido enviado!');",
					true);
		}
		private void LimpiarControles()
		{
			this.txtPara.Text = string.Empty;
			this.txtAsunto.Text = string.Empty;
			this.txtCC.Text = string.Empty;
			this.txtCCO.Text = string.Empty;
			this.txtMensaje.Text = string.Empty;
		}
	}
}