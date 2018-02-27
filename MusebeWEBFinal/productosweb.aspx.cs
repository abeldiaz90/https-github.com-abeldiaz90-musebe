using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;
using System.Web.Services;
using System.Web.Script.Services;
using Microsoft.Reporting.WebForms;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Net.Mime;

namespace MusebeWEBFinal
{
	public partial class productosweb : System.Web.UI.Page
	{
		const string BITMAP_ID_BLOCK = "BM";
		const string JPG_ID_BLOCK = "\u00FF\u00D8\u00FF";
		const string PNG_ID_BLOCK = "\u0089PNG\r\n\u001a\n";
		const string GIF_ID_BLOCK = "GIF8";
		const string TIFF_ID_BLOCK = "II*\u0000";
		const int DEFAULT_OLEHEADERSIZE = 78;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Page.Request.QueryString["Guid"] != null && Page.Request.QueryString["Guid"] != "")
			{
				this.grdProductos.DataSourceID = "busquedaGrupos";
				this.grdProductos.DataBind();
			}
			else { Buscar(); }
			if (Page.Request.QueryString["code"] != null && Page.Request.QueryString["code"] != "")
			{
				ValidarPedido(Page.Request.QueryString["code"].ToString());
			}
			else { }
		}
		public void LlenarMenu()
		{
			try
			{
				DataTable dtMenu = new DataTable();
				DataSet ds = new DataSet();
				XmlDataSource xmlDataSource = new XmlDataSource();
				xmlDataSource.ID = "XmlSource1";
				xmlDataSource.EnableCaching = false;
				dtMenu = GetMenuTable();
				ds.Tables.Add(dtMenu);
				ds.DataSetName = "Menus";
				ds.Tables[0].TableName = "Menu";
				DataRelation relation = new DataRelation("Parentchild", ds.Tables["Menu"].Columns["Id"], ds.Tables["Menu"].Columns["ParentId"], true);
				relation.Nested = true;
				ds.Relations.Add(relation);
				xmlDataSource.Data = ds.GetXml();
				xmlDataSource.TransformFile = Server.MapPath("~/Menu.xslt");
				xmlDataSource.XPath = "MenuItems/MenuItem";
				this.subMenuServicios.DataSource = xmlDataSource;
				this.subMenuServicios.DataBind();
				return;
			}
			catch (Exception ex) { ex.ToString(); }
		}
		private DataTable GetMenuTable()
		{
			DataTable TablaDatos = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ToString();
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.Parameters.AddWithValue("@USUARIO", this.Page.User.Identity.Name.ToString());
				com.CommandText = "OBTENER_MENU";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				Datos.Fill(TablaDatos);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return TablaDatos;
		}
		public static byte[] ConvertOleObjectToByteArray(object content)
		{
			if (content != null && !(content is DBNull))
			{
				byte[] oleFieldBytes = (byte[])content;
				byte[] imageBytes = null;
				// Get a UTF7 Encoded string version
				Encoding u8 = Encoding.UTF7;
				string strTemp = u8.GetString(oleFieldBytes);
				// Get the first 300 characters from the string
				string strVTemp = strTemp.Substring(0, 300);
				// Search for the block
				int iPos = -1;
				if (strVTemp.IndexOf(BITMAP_ID_BLOCK) != -1)
				{
					iPos = strVTemp.IndexOf(BITMAP_ID_BLOCK);
				}
				else if (strVTemp.IndexOf(JPG_ID_BLOCK) != -1)
				{
					iPos = strVTemp.IndexOf(JPG_ID_BLOCK);
				}
				else if (strVTemp.IndexOf(PNG_ID_BLOCK) != -1)
				{
					iPos = strVTemp.IndexOf(PNG_ID_BLOCK);
				}
				else if (strVTemp.IndexOf(GIF_ID_BLOCK) != -1)
				{
					iPos = strVTemp.IndexOf(GIF_ID_BLOCK);
				}
				else if (strVTemp.IndexOf(TIFF_ID_BLOCK) != -1)
				{
					iPos = strVTemp.IndexOf(TIFF_ID_BLOCK);
				}
				// From the position above get the new image
				if (iPos == -1)
				{
					iPos = DEFAULT_OLEHEADERSIZE;
				}
				//Array.Copy(
				imageBytes = new byte[oleFieldBytes.LongLength - iPos];
				MemoryStream ms = new MemoryStream();
				ms.Write(oleFieldBytes, iPos, oleFieldBytes.Length - iPos);
				imageBytes = ms.ToArray();
				ms.Close();
				ms.Dispose();
				return imageBytes;
			}
			return null;
		}
		protected void btnBuscar_Click(object sender, EventArgs e)
		{
			Buscar();
		}
		public void Buscar()
		{
			try
			{
				if (this.txtBusqueda.Text == string.Empty)
				{
					this.grdProductos.DataSourceID = "Datos";
					this.grdProductos.DataBind();
				}
				else
				{
					this.grdProductos.DataSourceID = "datosbusqueda";
					this.grdProductos.DataBind();
				}
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
		{
			FormsAuthentication.SignOut();
			Response.Redirect("Servicios.aspx");
		}
		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.pedidosUsuariosInsertar(System.Web.HttpContext.Current.User.Identity.Name.ToString(), this.Page.Request.QueryString["code"].ToString(), Int32.Parse(this.txtCantidad.Text));
				db.SubmitChanges();
				this.grdCotizaciones.DataBind();
				//Response.Redirect("productosweb.aspx");
			}
			catch (Exception ex) { ex.ToString(); }
		}

		[System.Web.Services.WebMethod(EnableSession = true)]
		public static string Compra(Object item)
		{
			return "productosweb.aspx?code=" + item.ToString();
		}

		public void ValidarPedido(String code)
		{
			if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				var detalles = db.Productos_Consultar_Visibles_Busquedas_Clave(code);
				foreach (var i in detalles)
				{
					this.Label1.Text = i.Descripcion;
				}

				this.popupCarrito.ShowOnPageLoad = true;
			}
			else { ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Inicie Sesión para poder realizar Pedidos Online');", true); }
		}

		protected void btnCancelar_Click(object sender, EventArgs e)
		{
			Response.Redirect("productosWeb.aspx");
		}

		protected void btnEnviarPedido_Click(object sender, EventArgs e)
		{
			try
			{
				if (this.grdCotizaciones.VisibleRowCount >= 1)
				{
					MUSEBEDataContext db = new MUSEBEDataContext();
					db.PedidosInsertar(System.Web.HttpContext.Current.User.Identity.Name.ToString());
					//db.SubmitChanges();
					var folio=db.PedidoObtenerFolioMayorUsuario(System.Web.HttpContext.Current.User.Identity.Name.ToString());
					foreach(var i in folio)
					{
						EnviarCotizacion(i.IdPedido.Value);
					}
					Response.Redirect("productoSweb.aspx");
					
				}
				else { ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Agregue al menos un producto para generar la cotización');", true); }
			}
			catch (Exception ex) { ex.ToString(); }
		}

		public void EnviarCotizacion(int Folio)
		{
			//this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
			LocalReport report = new LocalReport();
			report.EnableExternalImages = true;
			report.ReportPath = "Reportes/Pedidos.rdlc";
			DataTable ds = Cotizacion(Folio);
			ReportDataSource dsMain = new ReportDataSource();
			//dsMain.Name = "PedidosConsultaFolio";
			dsMain.Name = "Pedidos";
			dsMain.Value = ds;

			//DataTable dslogo = ObtenerLogoEmpresa();


			//ReportDataSource logo = new ReportDataSource();
			//logo.Name = "ObtenerLogoEmpresa";
			//logo.Value = dslogo;

			report.DataSources.Clear();
			report.DataSources.Add(dsMain);
			//report.DataSources.Add(logo);
			report.Refresh();
			string reportType = "PDF";
			string mimeType;
			string encoding;
			string fileNameExtension;

			string deviceInfo =
				"<DeviceInfo>" +
				"  <OutputFormat>PDF</OutputFormat>" +
				"  <PageWidth>21cm</PageWidth>" +
				"  <PageHeight>29.7cm</PageHeight>" +
				"  <MarginTop>0cm</MarginTop>" +
				"  <MarginLeft>0cm</MarginLeft>" +
				"  <MarginRight>0cm</MarginRight>" +
				"  <MarginBottom>0cm</MarginBottom>" +
				"</DeviceInfo>";

			Warning[] warnings;
			string[] streams;
			byte[] renderedBytes;


			renderedBytes = report.Render(
				reportType,
				deviceInfo,
				out mimeType,
				out encoding,
				out fileNameExtension,
				out streams,
				out warnings);

			string filename = Path.Combine(Path.GetTempPath(), "Pedidos.pdf");


			using (var fs = new FileStream(filename, FileMode.Create))
			{
				fs.Write(renderedBytes, 0, renderedBytes.Length);
				fs.Close();
			}

			// Create  the file attachment for this e-mail message.
			Attachment data = new Attachment(filename, MediaTypeNames.Application.Octet);
			// Add time stamp information for the file.
			System.Net.Mime.ContentDisposition disposition = data.ContentDisposition;
			disposition.CreationDate = System.IO.File.GetCreationTime(filename);
			disposition.ModificationDate = System.IO.File.GetLastWriteTime(filename);
			disposition.ReadDate = System.IO.File.GetLastAccessTime(filename);
			// Add the file attachment to this e-mail message.




			MailMessage msg = new MailMessage();
			msg.From = new MailAddress("ventas@musebe.com.mx", "Multiservicios BEAR", System.Text.Encoding.UTF8);
			msg.Subject = "Solicitud de Cotización";
			msg.To.Add(FormatMultipleEmailAddresses("amaryvivir23@gmail.com"));
			msg.CC.Add(FormatMultipleEmailAddresses("abeldiaz90@hotmail.com"));
			msg.SubjectEncoding = System.Text.Encoding.UTF8;
			msg.Body = "Estimado Cliente le enviamos nuestra cotizacion con numero de Folio:  " + Folio.ToString();
			msg.BodyEncoding = System.Text.Encoding.UTF8;
			msg.Attachments.Add(data);
			msg.IsBodyHtml = true;



			SmtpClient client = new SmtpClient();
			client.Host = "mail.musebe.com.mx";
			client.Port = 587;
			NetworkCredential login = new NetworkCredential("ventas@musebe.com.mx", "Imperio90_");
			//client.EnableSsl = true;
			client.UseDefaultCredentials = true;
			client.Credentials = login;

			try
			{
				client.Send(msg);
				ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
						"err_msg",
						"alert('!Su solicitud fue Procesada en Breve Recibira su Cotización!');",
						true);
				return;
			}
			catch (System.Net.Mail.SmtpException ex)
			{
				ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
					   "err_msg",
					   "alert('!Hubo un problema y no fue posible notificar a los usuarios!');",
					   true);
				return;
			}

		}
		public DataTable ObtenerLogoEmpresa()
		{
			DataTable Requsicion = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ToString();
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandType = CommandType.StoredProcedure;
				com.CommandText = "Logo_Obtener";
				com.Parameters.AddWithValue("@Usuario", Session["Usuario"]);
				com.CommandTimeout = 0;
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				Datos.Fill(Requsicion);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Requsicion;
		}
		public DataTable Cotizacion(int Folio)
		{
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Parameters.AddWithValue("@IdPedido", Folio);
				com.Connection = con;
				com.CommandText = "PedidosConsultaFolio";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				Resultado = new DataTable();
				datos.Fill(Resultado);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Resultado;
		}
		private string FormatMultipleEmailAddresses(string emailAddresses)
		{
			var delimiters = new[] { ',', ';' };

			var addresses = emailAddresses.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

			return string.Join(",", addresses);
		}
		protected void lnkPedidos_Click(object sender, EventArgs e)
		{

		}



		protected void btnBuy_Click(object sender, EventArgs e)
		{
			this.popupCarrito.ShowOnPageLoad = true;
		}
	}
}
