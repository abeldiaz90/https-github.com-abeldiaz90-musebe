using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal.scripts
{
	public partial class Index : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (!Page.IsPostBack)
			//{
				//MostrarLogo();
			//}
		}
		public void MostrarLogo()
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var query = db.Logo_Obtener_Musebe(this.Page.User.Identity.ToString());
			foreach (var i in query)
			{
				//this.imgLogo.Value = i.Logo;
			}
		}
	}
}