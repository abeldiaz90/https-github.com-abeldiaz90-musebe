using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void lnkCancelar_Click(object sender, EventArgs e)
		{
			try
			{
				limpiar();
			}
			catch (Exception ex) { ex.ToString(); }
		}

		protected void lnkGuardar_Click(object sender, EventArgs e)
		{
			try
			{

			}
			catch (Exception ex) { ex.ToString(); }
		}

		public void limpiar()
		{
			this.txtNombre.Text = string.Empty;
			this.txtSegundoNombre.Text = string.Empty;
			this.txtApellidoMaterno.Text = string.Empty;
			this.txtApellidoPaterno.Text = string.Empty;
			this.txtCorreo.Text = string.Empty;
			this.txtTelefono.Text = string.Empty;
		}
	}
}