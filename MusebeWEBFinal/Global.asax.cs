using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace MusebeWEBFinal
{
	public class Global : System.Web.HttpApplication
	{
		protected void Application_Start(object sender, EventArgs e)
		{

		}

		protected void Application_Error(object sender, EventArgs e)
		{
			Exception ex = Server.GetLastError();
			if (ex.GetType() == typeof(HttpUnhandledException))
			{
				if (ex.InnerException.Message.Contains("Login") || ex.InnerException.Message.Contains("network"))
				{
					Context.Server.ClearError();
					Response.Redirect("Error.html");
				}		
			}
		}
	}
}