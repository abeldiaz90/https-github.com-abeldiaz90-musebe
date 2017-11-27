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
	public partial class Contacto : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		private string FormatMultipleEmailAddresses(string emailAddresses)
		{
			var delimiters = new[] { ',', ';' };

			var addresses = emailAddresses.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

			return string.Join(",", addresses);
		}

		protected void lnkEnviar_Click(object sender, EventArgs e)
		{
			MailMessage msg = new MailMessage();
			msg.From = new MailAddress("postmaster@musebe.com.mx", "MUSEBE", System.Text.Encoding.UTF8);
			//msg.From = new MailAddress("Notificaciones@akaaljinspection.com.mx", "SIFICA", System.Text.Encoding.UTF8);
			msg.Subject = App_GlobalResources.Mensajes.AsuntoCorreoInformacion;
			msg.To.Add(FormatMultipleEmailAddresses(App_GlobalResources.Mensajes.correosDestinatariosInformacion));
			msg.SubjectEncoding = System.Text.Encoding.UTF8;
			msg.Body = this.txtbody.Text;
			msg.BodyEncoding = System.Text.Encoding.UTF8;
			//msg.IsBodyHtml = Html;


			SmtpClient client = new SmtpClient();
			client.Host = "mail.musebe.com.mx";
			client.Port = 587;
			//client.Port = 999;
			NetworkCredential login = new NetworkCredential("postmaster@musebe.com.mx", "Imperio90_");
			client.EnableSsl = false;
			//client.UseDefaultCredentials = true;
			client.Credentials = login;

			try
			{
				client.Send(msg);
				this.txtbody.Text = string.Empty;
				this.txtCorreo.Text = string.Empty;
				this.txtTelefono.Text = string.Empty;
				ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + App_GlobalResources.Mensajes.correoConfirmacionInformacion.ToString() + "');", true);
			}
			catch (System.Net.Mail.SmtpException ex)
			{

			}
		}
	}
}