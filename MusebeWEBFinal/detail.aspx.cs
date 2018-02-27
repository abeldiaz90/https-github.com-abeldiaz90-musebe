using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class detailaspx : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if ((Page.Request.QueryString["Id"] != null) && (Page.Request.QueryString["Id"]) != "")
			{
				this.sliders.SettingsFolder.ImageSourceFolder= "~/Imagenes/Servicios/" + Page.Request.QueryString["Id"] + "/";
				//this.sliders.Images.ImageFolder = "~/Imagenes/Servicios/" + Page.Request.QueryString["Id"] + "/";				
			}
		}
	}
}