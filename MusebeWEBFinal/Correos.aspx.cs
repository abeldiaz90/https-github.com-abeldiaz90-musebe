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
			Response.Write(SendMail("abeldiaz90@hotmail.com", "ventas@musebe.com.mx", "amaryvivir23@gmail.com", "prueba", "body"));
		}

		protected void txtEnviar_Click(object sender, EventArgs e)
		{
			MailMessage msg = new MailMessage();
			msg.From = new MailAddress("ventas@musebe.com.mx", "Ventas MUSEBE", System.Text.Encoding.UTF8);
			//msg.From = new MailAddress("Notificaciones@akaaljinspection.com.mx", "SIFICA", System.Text.Encoding.UTF8);
			msg.Subject = this.txtAsunto.Text;
			msg.To.Add(FormatMultipleEmailAddresses(this.txtPara.Text));
			msg.SubjectEncoding = System.Text.Encoding.UTF8;
			msg.Body = this.txtMensaje.Text;
			msg.BodyEncoding = System.Text.Encoding.UTF8;
			//msg.IsBodyHtml = Html;


			SmtpClient client = new SmtpClient();
			client.Host = "smtp.gmail.com";
			client.EnableSsl = true;
			client.DeliveryMethod = SmtpDeliveryMethod.Network;
			client.Port = 465;
			NetworkCredential login = new NetworkCredential("ventas@musebe.com.mx", "Imperio90_1");

			//client.UseDefaultCredentials = true;
			client.Credentials = login;

			try
			{
				client.Send(msg);
			}
			catch (System.Net.Mail.SmtpException ex)
			{
				ex.ToString();
			}
		}
		private string FormatMultipleEmailAddresses(string emailAddresses)
		{
			var delimiters = new[] { ',', ';' };

			var addresses = emailAddresses.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

			return string.Join(",", addresses);
		}

		//Satrt Send Email Function
		public string SendMail(string toList, string from, string ccList,
			string subject, string body)
		{

			MailMessage message = new MailMessage();
			SmtpClient smtpClient = new SmtpClient();
			string msg = string.Empty;
			try
			{
				MailAddress fromAddress = new MailAddress(from);
				message.From = fromAddress;
				message.To.Add(toList);
				if (ccList != null && ccList != string.Empty)
					message.CC.Add(ccList);
				message.Subject = subject;
				message.IsBodyHtml = true;
				message.Body = body;
				// We use gmail as our smtp client
				smtpClient.Host = "smtp.gmail.com";
				smtpClient.Port = 465;
				smtpClient.EnableSsl = true;
				smtpClient.UseDefaultCredentials = true;
				smtpClient.Credentials = new System.Net.NetworkCredential(
					"ventas@musebe.com.mx", "Imperio90_1");

				smtpClient.Send(message);
				msg = "Successful<BR>";
			}
			catch (Exception ex)
			{
				msg = ex.Message;
			}
			return msg;
		}
	}
}