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

			for (int i = 0; i <= submenu.Rows.Count - 1; i++)
			{
				cadenahtml.AppendLine("<div class='panel panel-default'> <div class='panel-heading'>" + submenu.Rows[i][1].ToString() + "</div><div class='panel-body' style = 'height:500;min-height: 10; max-height: 500;background-image: url(../Imagenes/Servicios/" + submenu.Rows[i][3].ToString() + "'); background - repeat:no - repeat; background - size:cover; margin: 0; '><img src='Imagenes/Servicios/" + submenu.Rows[i][3].ToString() + "' alt ='" + submenu.Rows[i][1].ToString() + "' height='100%' width='100%'></div><div class='panel - footer'>" + submenu.Rows[i][2].ToString() + "<p><a href='detalleservicio.aspx?id=" + submenu.Rows[i][0].ToString() + "' target='blank'>Ver mas detalle</a> </div></div>");

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
		protected void LinkButton2_Click(object sender, EventArgs e)
		{
			try
			{
				cargardetalle(this.grdServicios.GetRowValues(this.grdServicios.FocusedRowIndex, "Id").ToString());
				this.popupDetalle.ShowOnPageLoad = true;
			}
			catch (Exception ex) { ex.ToString(); }
		}

		public void cargardetalle(string id)
		{
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "select * from servicios where Id='" + id + "'";
				com.CommandType = CommandType.Text;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				datos.Fill(Resultado);
				con.Close();
				this.htmlServicios.Html = Resultado.Rows[0][5].ToString();
			}

			catch (Exception ex) { ex.ToString(); }
		}
		protected string CodeBehind(string id, string servicio)
		{
			string cadena = "";
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "select * from servicios where Id='" + id + "'";
				com.CommandType = CommandType.Text;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				datos.Fill(Resultado);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			if (Resultado.Rows.Count > 0)
			{
				cadena = Resultado.Rows[0][5].ToString();
			}
			return cadena;
		}

		protected void btnDetalle_Click(object sender, EventArgs e)
		{

		}

		protected void btnGuardar_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.Servicios_Actualizar_Detalle(Int32.Parse(this.grdServicios.GetRowValues(this.grdServicios.FocusedRowIndex, "Id").ToString()), this.htmlServicios.Html);
				db.SubmitChanges();
			}
			catch (Exception ex) { ex.ToString(); }
		}
	}
}