using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class somos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				CargarHTML();
				bool val1 = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
				if (val1)
				{
					this.lnkEditar.Visible = true;
				}
				else { this.lnkEditar.Visible = false; }
			}
		}
		public void CargarHTML()
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				var query = db.Somos_Consultar();
				foreach (var i in query)
				{
					this.ASPxHtmlEditor1.Html = i.texto;
					somostexto.InnerHtml = i.texto;
					//Response.Write("<div class='jumbotron'>" + i.texto + "</ div > ");

				}
			}
			catch (Exception ex)
			{
				ex.ToString();
			}
		}
		protected void lnkEditar_Click(object sender, EventArgs e)
		{
			try
			{
				popupSomos.ShowOnPageLoad = true;
			}
			catch (Exception ex)
			{
				ex.ToString();
			}
		}
		protected void lnkPublicar_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.Somos_Insertar(this.ASPxHtmlEditor1.Html);
				db.SubmitChanges();
			}
			catch (Exception ex) { ex.ToString(); }
		}
	}
}