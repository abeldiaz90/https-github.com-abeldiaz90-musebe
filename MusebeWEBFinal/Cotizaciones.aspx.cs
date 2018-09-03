using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Cotizaciones : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
	{
			if (!Page.IsPostBack)
			{
				this.FechaCotizacion.Date = System.DateTime.Now;
				this.txtFolio.Text = Folio();

			}
		
			if (Session["IdPedido"] != null && Session["IdPedido"] != "")
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.SolicitudaRequisicion(int.Parse(Session["IdPedido"].ToString()), System.Web.HttpContext.Current.User.Identity.Name.ToString());
				db.SubmitChanges();
				Editar(BuscarId(Int32.Parse(Session["IdPedido"].ToString())));
				Session["IdPedido"] = "";
			}
		}
		/* Agregar Productos */
		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			try
			{
				if (Numero.Value == "")
				{
					Numero.Value = "1";
				}
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.COTIZACIONES_INSERTAR(this.txtFolio.Text, this.FechaCotizacion.Date, "", Int32.Parse(this.cboClientes.SelectedItem.Value.ToString()), Int32.Parse(this.cboContacto.SelectedItem.Value.ToString()), 0, this.Page.User.Identity.Name.ToString(), this.txtTitulo.Text, Int32.Parse(this.cboTipoMoneda.SelectedItem.Value.ToString()), Int32.Parse(this.cboFormaPago.SelectedItem.Value.ToString()), this.txtReferencia.Text, Int32.Parse(this.cboMetodoPago.SelectedItem.Value.ToString()), this.txtTiempoEntrega.Text, this.txtLugarEntrega.Text, null, this.Letra.Value,Int32.Parse(this.Numero.Value));
				db.Cotizaciones_Detalle_Insertar(this.txtFolio.Text, this.txtItem.Text, float.Parse(this.txtCantidad.Text));

				this.grdArticulos.DataBind();
				this.txtItem.Text = string.Empty;
				this.txtCantidad.Text = string.Empty;
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void cboClientes_SelectedIndexChanged(object sender, EventArgs e)
		{
			try
			{
				this.cboContacto.Items.Clear();
				LlenarDirectorio(this.cboClientes.SelectedItem.Value.ToString());
			}
			catch (Exception ex) { ex.ToString(); }
		}
		public DataTable LlenarDirectorio(string Cliente)
		{
			DataTable Directorio = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "Directorio_Consultar_Cliente";
				com.CommandType = CommandType.StoredProcedure;
				com.Parameters.AddWithValue("@IdCliente", Cliente);
				com.ExecuteNonQuery();

				SqlDataAdapter datos = new SqlDataAdapter(com);

				datos.Fill(Directorio);
				if (Directorio != null)
				{
					this.cboContacto.DataSource = Directorio; ;
					this.cboContacto.DataBind();
					this.cboContacto.Focus();
				}
				else
				{

				}

			}
			catch (Exception ex) { }
			return Directorio;
		}
		protected void cboContacto_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.txtCorreo.Text = string.Empty;
			DatosContacto();
		}
		public DataTable DatosContacto()
		{
			DataTable Directorio = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "Directorio_Consultar_DatosUsuario";
				com.CommandType = CommandType.StoredProcedure;
				com.Parameters.AddWithValue("@Id", this.cboContacto.SelectedItem.Value.ToString());
				com.ExecuteNonQuery();

				SqlDataAdapter datos = new SqlDataAdapter(com);

				datos.Fill(Directorio);
				if (Directorio != null)
				{
					this.txtCorreo.Text = Directorio.Rows[0]["Correo"].ToString();
					this.txtTelefono.Text = Directorio.Rows[0]["Telefono"].ToString();
				}
				else
				{

				}
				con.Close();

			}
			catch (Exception ex) { }
			return Directorio;
		}
		public String Folio()
		{
			DataTable Directorio = new DataTable();
			String FolioNumero = "";
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "Cotizaciones_Obtener_Folio";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				datos.Fill(Directorio);
				if (Directorio != null)
				{
					//string asciichar = (Convert.ToChar(65)).ToString();
					this.Letra.Value = Directorio.Rows[0][1].ToString();
					FolioNumero = Directorio.Rows[0][0].ToString();
				}
				else
				{

				}
				con.Close();
			}
			catch (Exception ex) { }
			return FolioNumero;
		}
		protected void btnCancelar_Click(object sender, EventArgs e)
		{

		}
		protected void btnGuardarBorrador_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.COTIZACIONES_INSERTAR(this.txtFolio.Text, this.FechaCotizacion.Date, "", Int32.Parse(this.cboClientes.SelectedItem.Value.ToString()), Int32.Parse(this.cboContacto.SelectedItem.Value.ToString()), 0, this.Page.User.Identity.Name.ToString(), this.txtTitulo.Text, Int32.Parse(this.cboTipoMoneda.SelectedItem.Value.ToString()), Int32.Parse(this.cboFormaPago.SelectedItem.Value.ToString()), this.txtReferencia.Text, Int32.Parse(this.cboMetodoPago.SelectedItem.Value.ToString()), this.txtTiempoEntrega.Text, this.txtLugarEntrega.Text, null, this.Letra.Value,Int32.Parse(this.Numero.Value));
				this.grdArticulos.DataBind();
				ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('" + App_GlobalResources.Mensajes.Guardar + "')", true);
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void btnOkBorrador_Click(object sender, EventArgs e)
		{
			try
			{
				if (this.grdArticulos.VisibleRowCount >= 1)
				{
					MUSEBEDataContext db = new MUSEBEDataContext();
					db.COTIZACIONES_INSERTAR(this.txtFolio.Text, this.FechaCotizacion.Date, "", Int32.Parse(this.cboClientes.SelectedItem.Value.ToString()), Int32.Parse(this.cboContacto.SelectedItem.Value.ToString()), 0, this.Page.User.Identity.Name.ToString(), this.txtTitulo.Text, Int32.Parse(this.cboTipoMoneda.SelectedItem.Value.ToString()), Int32.Parse(this.cboFormaPago.SelectedItem.Value.ToString()), this.txtReferencia.Text, Int32.Parse(this.cboMetodoPago.SelectedItem.Value.ToString()), this.txtTiempoEntrega.Text, this.txtLugarEntrega.Text, null, this.Letra.Value, Int32.Parse(this.Numero.Value));
				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('" + App_GlobalResources.Mensajes.FaltanPartidas + "')", true);
				}
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void btnCancelBorrador_Click(object sender, EventArgs e)
		{

		}
		protected void btnLimpiarFormato_Click(object sender, EventArgs e)
		{
			LimpiezaGeneral();
			this.txtFolio.Text = Folio();
			this.grdArticulos.DataBind();
		}
		protected void btnGuardarPerfil_Click(object sender, EventArgs e)
		{

		}
		protected void btnEditarBorrador_Click(object sender, EventArgs e)
		{
			this.popupCotizaciones.ShowOnPageLoad = true;
		}
		public void LimpiezaGeneral()
		{
			this.txtFolio.Text = string.Empty;
			this.txtCorreo.Text = string.Empty;
			this.txtItem.Text = string.Empty;
			this.txtCantidad.Text = string.Empty;
			this.FechaCotizacion.Date = System.DateTime.Now;
			this.txtTitulo.Text = string.Empty;
			this.cboClientes.Items.Clear();
			this.cboClientes.Text = string.Empty;
			this.cboClientes.DataBind();
			this.cboClientes.SelectedIndex = 1;
			this.cboContacto.Items.Clear();
			this.cboContacto.Text = string.Empty;
			this.cboContacto.DataBind();
			this.cboContacto.SelectedIndex = 1;
			this.txtTelefono.Text = string.Empty;
			this.cboTipoMoneda.Text = string.Empty;
			this.cboTipoMoneda.SelectedIndex = 1;
			this.cboFormaPago.Text = string.Empty;
			this.cboFormaPago.SelectedIndex = 1;
			this.cboMetodoPago.Text = string.Empty;
			this.cboMetodoPago.SelectedIndex = 1;
			this.txtReferencia.Text = string.Empty;
			this.txtTiempoEntrega.Text = string.Empty;
			this.txtLugarEntrega.Text = string.Empty;
			this.grdRequisiciones.DataBind();
		}
		protected void btnEditar_Click(object sender, EventArgs e)
		{
			try
			{
				this.popupCotizaciones.ShowOnPageLoad = false;
				LimpiezaGeneral();
			
				Editar(Int32.Parse(this.grdRequisiciones.GetRowValues(this.grdRequisiciones.FocusedRowIndex, "Id").ToString()));
				
			}
			catch (Exception ex) { ex.ToString(); }
		}

		internal int BuscarId(int Id)
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var Q = db.CotizacionporSolicitud(Id);
			int id = 0;
			foreach (var i in Q)
			{
				id = i.Id;
			}
			return id;
		}

		public void Editar(int Id)
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var q = db.Cotizaciones_Abrir(Id);
			foreach (var i in q)
			{
				this.txtReferencia.Text = i.Referencia;
				this.txtFolio.Text = i.Folio;
				this.txtTitulo.Text = i.Titulo;
				this.txtTiempoEntrega.Text = i.TiempoEntrega;
				this.txtLugarEntrega.Text = i.LugarEntrega;
				this.txtCorreo.Text = string.Empty;
				this.txtCorreo.Text = i.Email;
				this.txtTelefono.Text = i.Telefono;
				this.Letra.Value = i.Letra.Value.ToString();
				this.Numero.Value = i.Numero.Value.ToString();
				this.cboClientes.Items.Clear();
				this.cboClientes.DataBind();
				this.cboClientes.Items.FindByValue(i.IdCliente.ToString()).Selected = true;

				this.cboContacto.Items.Clear();
				LlenarDirectorio(this.cboClientes.SelectedItem.Value.ToString());


				this.cboContacto.Items.FindByValue(i.IdContacto.ToString()).Selected = true;


				this.cboTipoMoneda.Items.FindByValue(i.IdPrecioLista.ToString()).Selected = true;
				this.cboFormaPago.Items.FindByValue(i.IdFormaPago.ToString()).Selected = true;
				this.cboMetodoPago.Items.FindByValue(i.IdMetodoPago.ToString()).Selected = true;
				this.FechaCotizacion.Date = i.Fecha.Value;
				DatosContacto();


			}
			this.grdArticulos.DataBind();
		}
		protected void btnNuevaRevision_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.Cotizaciones_Nueva_Revision(this.grdRequisiciones.GetRowValues(this.grdRequisiciones.FocusedRowIndex,"Folio").ToString());
				db.SubmitChanges();
				this.grdRequisiciones.DataBind();
			}
			catch (Exception ex) { ex.ToString(); }
		}
		protected void btnImprimir_Click(object sender, EventArgs e)
		{
			try
			{
				if (ValidaMargenGanancia(this.txtFolio.Text) >= 1)
				{
					ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
						"err_msg",
						"alert('!Existe mas de una partida sin margen de ganancia, Capturelas antes de Imprimir!');",
						true);
					return;
				}
				else
				{
					int numerodescuentos = ValidarDescuentos(this.txtFolio.Text);

					this.popupCotizacion.ShowOnPageLoad = true;
					this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
					LocalReport report = new LocalReport();
					report.EnableExternalImages = true;
					if (numerodescuentos >= 1)
					{
						report.ReportPath = "Reportes/CotizacionDescuento.rdlc";
					}
					else { report.ReportPath = "Reportes/Cotizacion.rdlc"; }

					DataTable ds = Cotizacion();
					ReportDataSource dsMain = new ReportDataSource();
					dsMain.Name = "CotizacionImprimir";
					dsMain.Value = ds;
					report.DataSources.Clear();
					report.DataSources.Add(dsMain);
					report.Refresh();
					this.ReportViewer1.Visible = true;
					if (numerodescuentos >= 1)
					{
						this.ReportViewer1.LocalReport.ReportPath = Server.MapPath("Reportes/CotizacionDescuento.rdlc");
					}
					else
					{
						this.ReportViewer1.LocalReport.ReportPath = Server.MapPath("Reportes/Cotizacion.rdlc");
					}

					this.ReportViewer1.LocalReport.DataSources.Clear();
					this.ReportViewer1.LocalReport.DataSources.Add(dsMain);
					this.ReportViewer1.DocumentMapCollapsed = true;
					this.ReportViewer1.ShowPrintButton = true;
					this.ReportViewer1.LocalReport.Refresh();
				}
			}
			catch (Exception ex) { ex.ToString(); }
		}




		internal int ValidaMargenGanancia(String Folio)
		{
			DataTable Conteo = new DataTable();
			SqlConnection con = new SqlConnection();
			con.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ToString();
			con.Open();
			SqlCommand com = new SqlCommand();
			com.Connection = con;
			com.CommandType = CommandType.StoredProcedure;
			com.CommandText = "Cotizaciones_Validacion_MargenGanancia_Conteo";
			com.Parameters.AddWithValue("@FolioCotizacion", this.txtFolio.Text);
			com.CommandTimeout = 0;
			com.ExecuteNonQuery();
			SqlDataAdapter Datos = new SqlDataAdapter(com);
			Datos.Fill(Conteo);
			con.Close();
			return Int32.Parse(Conteo.Rows[0][0].ToString());
		}

		internal int ValidarDescuentos(String Folio)
		{
			DataTable Conteo = new DataTable();
			SqlConnection con = new SqlConnection();
			con.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ToString();
			con.Open();
			SqlCommand com = new SqlCommand();
			com.Connection = con;
			com.CommandType = CommandType.StoredProcedure;
			com.CommandText = "Cotizaciones_Validacion_Descuentos";
			com.Parameters.AddWithValue("@FolioCotizacion", this.txtFolio.Text);
			com.CommandTimeout = 0;
			com.ExecuteNonQuery();
			SqlDataAdapter Datos = new SqlDataAdapter(com);
			Datos.Fill(Conteo);
			con.Close();
			return Int32.Parse(Conteo.Rows[0][0].ToString());
		}

		public DataTable Cotizacion()
		{
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Parameters.AddWithValue("@FolioCotizacion", this.txtFolio.Text);
				com.Connection = con;
				com.CommandText = "CotizacionImprimir";
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
		protected void subirArchivo_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
		{
			try
			{
				string filename = Path.GetFileName(e.UploadedFile.FileName);
				string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);
				string targetPath = Server.MapPath("Documentos/Requisiciones/" + e.UploadedFile.FileName);
				if (File.Exists(targetPath))
				{
					File.Delete(targetPath);
				}
				e.UploadedFile.SaveAs(targetPath);
				byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.Documentos_Modificar_Requisicion(Int32.Parse(this.grdRequisiciones.GetRowValues(this.grdRequisiciones.FocusedRowIndex, "Id").ToString()), "~/Documentos/Requisiciones/" + e.UploadedFile.FileName);
				this.grdRequisiciones.DataBind();
				this.popupCotizaciones.ShowOnPageLoad = false;
			}
			catch (Exception ex) { ex.ToString(); }
		}
		public void OnConfirm(object sender, EventArgs e)
		{
			string confirmValue = "";
			confirmValue = Request.Form["confirm_value"];
			if (confirmValue == "Yes")
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.CotizacionCopiar(Int32.Parse(this.grdRequisiciones.GetRowValues(this.grdRequisiciones.FocusedRowIndex, "Id").ToString()));
				this.grdRequisiciones.DataBind();
				ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + App_GlobalResources.Mensajes.RespuestaCotizacion.ToString() + "');", true);
			}
			else
			{

			}
		}
		public void EnviarCorreo()
		{
			this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
			LocalReport report = new LocalReport();
			report.EnableExternalImages = true;
			report.ReportPath = "Reportes/Cotizacion.rdlc";
			DataTable ds = Cotizacion();
			ReportDataSource dsMain = new ReportDataSource();
			dsMain.Name = "CotizacionImprimir";
			dsMain.Value = ds;



			DataTable dslogo = ObtenerLogoEmpresa();


			ReportDataSource logo = new ReportDataSource();
			logo.Name = "ObtenerLogoEmpresa";
			logo.Value = dslogo;

			report.DataSources.Clear();
			report.DataSources.Add(dsMain);
			report.DataSources.Add(logo);
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

			string filename = Path.Combine(Path.GetTempPath(), "Cotizacion.pdf");


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
			msg.Subject = "Cotización";
			msg.To.Add(FormatMultipleEmailAddresses(this.txtCorreo.Text));
			msg.CC.Add(FormatMultipleEmailAddresses("abeldiaz90@hotmail.com"));
			msg.SubjectEncoding = System.Text.Encoding.UTF8;
			msg.Body = "Estimado Cliente le enviamos nuestra cotizacion con numero de Folio:  " + this.txtFolio.Text;
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
						"alert('!Los usuarios han sido notificados via correo electrónico!');",
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
		private string FormatMultipleEmailAddresses(string emailAddresses)
		{
			var delimiters = new[] { ',', ';' };

			var addresses = emailAddresses.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

			return string.Join(",", addresses);
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
		protected void btnEnviarCorreo_Click(object sender, EventArgs e)
		{
			EnviarCorreo();
		}
	}
}