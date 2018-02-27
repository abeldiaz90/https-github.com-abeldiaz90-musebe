using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
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
				if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
				{
					if (Rol() == "1")
					{
						this.lnkEditar.Visible = true;
					}
					else { this.lnkEditar.Visible = false; }

				}else { this.lnkEditar.Visible = false; }
			}
		}
		public string Rol()
		{
			SqlConnection con = new SqlConnection();
			con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
			con.Open();
			SqlCommand com = new SqlCommand();
			com.Connection = con;
			com.CommandText = "select ID_ROL from usuarios where usuario='" + System.Web.HttpContext.Current.User.Identity.Name.ToString() + "'";
			com.CommandType = CommandType.Text;
			com.ExecuteNonQuery();

			SqlDataAdapter datos = new SqlDataAdapter(com);
			DataTable Resultado = new DataTable();
			datos.Fill(Resultado);
			con.Close();

			return Resultado.Rows[0][0].ToString();
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

		protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
		{
			FormsAuthentication.SignOut();
			Response.Redirect("Servicios.aspx");
		}

		protected void lnkPedidos_Click(object sender, EventArgs e)
		{

		}
	}
}