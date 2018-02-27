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
			MailMessage msg = new MailMessage();
			msg.From = new MailAddress("ventas@musebe.com.mx", "Ventas MUSEBE", System.Text.Encoding.UTF8);
			//msg.From = new MailAddress("Notificaciones@akaaljinspection.com.mx", "SIFICA", System.Text.Encoding.UTF8);
			msg.Subject = this.txtAsunto.Text;
			msg.To.Add(FormatMultipleEmailAddresses(this.txtPara.Text));	
			msg.SubjectEncoding = System.Text.Encoding.UTF8;
			msg.Body =this.txtMensaje.Text;
			msg.BodyEncoding = System.Text.Encoding.UTF8;
			//msg.IsBodyHtml = Html;


			SmtpClient client = new SmtpClient();
			client.Host = "mail.musebe.com.mx";
			client.Port = 587;
			//client.Port = 999;
			NetworkCredential login = new NetworkCredential("ventas@musebe.com.mx", "Imperio90_");
			//client.EnableSsl = false;
			//client.UseDefaultCredentials = true;
			client.Credentials = login;

			try
			{
				client.Send(msg);
			}
			catch (System.Net.Mail.SmtpException ex)
			{

			}
		}
		private string FormatMultipleEmailAddresses(string emailAddresses)
		{
			var delimiters = new[] { ',', ';' };

			var addresses = emailAddresses.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

			return string.Join(",", addresses);
		}
	}
}