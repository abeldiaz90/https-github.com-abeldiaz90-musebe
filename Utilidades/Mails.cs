using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Utilidades
{
    public class Mails
    {
        public void Mail(string Para, String CC,String CCO, String Asunto, Boolean Html, String Cuerpo, Attachment Adjunto)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("ventas@musebe.com.mx", "Ventas MUSEBE", System.Text.Encoding.UTF8);
            //msg.From = new MailAddress("Notificaciones@akaaljinspection.com.mx", "SIFICA", System.Text.Encoding.UTF8);
            msg.Subject = Asunto;
            msg.To.Add(FormatMultipleEmailAddresses(Para));
            msg.CC.Add(FormatMultipleEmailAddresses(CC));
			msg.Bcc.Add(FormatMultipleEmailAddresses(CCO));
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            msg.Body = Cuerpo;
            msg.BodyEncoding = System.Text.Encoding.UTF8;
            msg.IsBodyHtml = Html;
			if (Adjunto != null)
			{
				msg.Attachments.Add(Adjunto);
			}

            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            NetworkCredential login = new NetworkCredential("ventas@musebe.com.mx", "Imperio90_1");
            client.EnableSsl = true;      
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

		
    }
}
