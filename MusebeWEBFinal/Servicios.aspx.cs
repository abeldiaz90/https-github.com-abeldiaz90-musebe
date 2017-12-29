using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Caching;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MusebeWEBFinal
{
	public partial class Servicios : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				this.lnkEditar.Visible = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
				
				llenarSubMenu();
			}
		}

		public void llenarSubMenu()
		{
			DataTable submenu = MenuServicios();
			var cadenahtml = new StringBuilder();
			//var indicatorsHtml = new StringBuilder(@"<div class='container'><div class='jumbotron'>");

			for (int i = 0; i <= submenu.Rows.Count - 1; i++)
			{
				cadenahtml.AppendLine("<a href='#'><h3>" + submenu.Rows[i][1].ToString() + "</h3><p>" + "<img src='/Imagenes/Servicios/" + submenu.Rows[i][3].ToString() + "' alt ='" + submenu.Rows[i][1].ToString() + "' style='width:200px'></p></a>");
				
				//carouselInnerHtml.AppendLine("<p>" + submenu.Rows[i][1].ToString() + "</p>");
			}
			anuncios.InnerHtml = cadenahtml + anuncios.InnerHtml;
		}
		public DataTable MenuServicios()
		{
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "select * from servicios";
				com.CommandType = CommandType.Text;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				datos.Fill(Resultado);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Resultado;
		}
		protected void lnkEditar_Click(object sender, EventArgs e)
		{
			try
			{
				this.popupServicios.HeaderText = App_GlobalResources.Mensajes.popupServiciosEncabezado;
				this.popupServicios.ShowOnPageLoad = true;
				this.popupServicios.ShowShadow = true;
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void lnkDetalle_Click(object sender, EventArgs e)
		{
			try
			{
				this.popupFotos.ShowOnPageLoad = true;
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void popupControlSubida_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
		{
			string filename = Path.GetFileName(e.UploadedFile.FileName);
			string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);

			string targetPath = Server.MapPath("Imagenes/Servicios/" + e.UploadedFile.FileName);
			if (File.Exists(targetPath))
			{
				File.Delete(targetPath);
			}


			e.UploadedFile.SaveAs(targetPath);

			byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
			MUSEBEDataContext db = new MUSEBEDataContext();
			db.Servicios_Modificar_Foto(Int32.Parse(this.grdServicios.GetRowValues(this.grdServicios.FocusedRowIndex, "Id").ToString()), filename, fileBytes);
			this.popupFotos.ShowOnPageLoad = false;
		}
		protected void grdServicios_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
		{
			string targetPath = Server.MapPath("Imagenes/Servicios/" + e.Values[2].ToString());
			if (File.Exists(targetPath))
			{
				File.Delete(targetPath);
			}
		}
	}
}