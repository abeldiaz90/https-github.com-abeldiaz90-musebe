using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Products : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				this.Id.Value = string.Empty;
			}
		}

		protected void btnNuevo_Click(object sender, EventArgs e)
		{
			this.Panel1.Enabled = true;
		}

		protected void btnCancelar_Click(object sender, EventArgs e)
		{
			Limpiar();
			this.Panel1.Enabled = false;
		}

		public void Limpiar()
		{
			this.Id.Value = "";
			this.txtClave.Text = string.Empty;
			this.txtDescripcionCorta.Text = string.Empty;
			this.txtDescripcionLarga.Text = string.Empty;
			this.cboGrupo.SelectedIndex = -1;
			this.cboMarca.SelectedIndex = -1;
			this.cboMaterial.SelectedIndex = -1;
			this.cboUnidad.SelectedIndex = -1;
			this.txtDimension.Text = string.Empty;
			this.txtPiezasPaquete.Text = string.Empty;
			this.txtPaquetesCaja.Text = string.Empty;
			this.txtPrecioPaquetesCaja.Text = string.Empty;
			this.txtPrecioPieza.Text = string.Empty;
			this.txtPrecioPiezasCajabulto.Text = string.Empty;
			this.txtMinimo.Text = string.Empty;
			this.txtMaximo.Text = string.Empty;
			this.txtCantidadInicial.Text = string.Empty;
			this.chkActivo.Checked = false;
			this.chkInventario.Checked = false;
			this.chkIva.Checked = false;
			this.chkVisible.Checked = false;

		}

		protected void btnEnviar_Click(object sender, EventArgs e)
		{
			try
			{
				popupConfirmacion.ShowOnPageLoad = true;
			}
			catch (Exception ex)
			{
				ex.ToString();
			}
		}

		protected void btnSiGuardar_Click(object sender, EventArgs e)
		{

			string targetPath = Server.MapPath("Imagenes/empty-photo.jpg");
			byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
			MUSEBEDataContext db = new MUSEBEDataContext();
			if (Id.Value.ToString() == string.Empty)
			{
				db.Productos_Insertar(this.txtDescripcionCorta.Text, this.txtDescripcionLarga.Text, this.txtDescripcionCorta.Text, this.txtClave.Text, Int32.Parse(this.cboGrupo.SelectedItem.Value.ToString()), Int32.Parse(this.cboMarca.SelectedItem.Value.ToString()), Int32.Parse(this.cboMaterial.SelectedItem.Value.ToString()), Int32.Parse(this.cboUnidad.SelectedItem.Value.ToString()), float.Parse(this.txtDimension.Text), Int32.Parse(this.txtPiezasPaquete.Text), Int32.Parse(this.txtPaquetesCaja.Text), Int32.Parse(this.txtPiezasBulto.Text), Decimal.Parse(this.txtPrecioPieza.Text), Decimal.Parse(this.txtPrecioPaquetesCaja.Text), Decimal.Parse(this.txtPrecioPiezasCajabulto.Text), this.User.Identity.Name.ToString(), this.chkActivo.Checked, float.Parse(this.txtMinimo.Text), float.Parse(this.txtMaximo.Text), float.Parse(this.txtCantidadInicial.Text), this.chkVisible.Checked, this.chkIva.Checked, this.chkInventario.Checked, fileBytes);
				db.SubmitChanges();
				ObtenerId();
				ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
						"err_msg",
						"alert('!El producto ha sido dado de alta!');",
						true);
			}
			else
			{
				db.Productos_Modificar(Int32.Parse(this.Id.Value.ToString()), this.txtDescripcionCorta.Text, this.txtDescripcionLarga.Text, this.txtDescripcionCorta.Text, this.txtClave.Text, Int32.Parse(this.cboGrupo.SelectedItem.Value.ToString()), Int32.Parse(this.cboMarca.SelectedItem.Value.ToString()), Int32.Parse(this.cboMaterial.SelectedItem.Value.ToString()), Int32.Parse(this.cboUnidad.SelectedItem.Value.ToString()), float.Parse(this.txtDimension.Text), Int32.Parse(this.txtPiezasPaquete.Text), Int32.Parse(this.txtPiezasBulto.Text), Int32.Parse(this.txtPaquetesCaja.Text), Decimal.Parse(this.txtPrecioPieza.Text), Decimal.Parse(this.txtPrecioPaquetesCaja.Text), Decimal.Parse(this.txtPrecioPiezasCajabulto.Text), this.User.Identity.Name.ToString(), this.chkActivo.Checked, float.Parse(this.txtMinimo.Text), float.Parse(this.txtMaximo.Text), float.Parse(this.txtCantidadInicial.Text), this.chkIva.Checked, this.chkInventario.Checked, this.chkVisible.Checked);
				db.SubmitChanges();
				ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
						"err_msg",
						"alert('!Los datos han sido guardados!');",
						true);
			}


			this.popupConfirmacion.ShowOnPageLoad = false;

		}

		public void ObtenerId()
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var productos = db.Productos_Consultar_Clave(this.txtClave.Text);
			foreach (var i in productos)
			{
				this.Id.Value = i.Id.ToString();
				ObtenerRuta(Id.Value);
			}
		}

		protected void btnNoGuardar_Click(object sender, EventArgs e)
		{
			this.popupConfirmacion.ShowOnPageLoad = false;
		}

		protected void btnBuscar_Click(object sender, EventArgs e)
		{
			this.popupBusqueda.ShowOnPageLoad = true;
		}

		protected void btnProductoBuscar_Click(object sender, EventArgs e)
		{
			try { this.grdResultadosBusqueda.DataBind(); }
			catch (Exception ex)
			{
				ex.ToString();
			}
		}

		protected void btnSeleccionarproducto_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				var query = db.Productos_Consultar_Clave(this.grdResultadosBusqueda.GetRowValues(this.grdResultadosBusqueda.FocusedRowIndex, "Clave").ToString());
				this.Panel1.Enabled = true;
				foreach (var i in query)
				{
					this.Id.Value = i.Id.ToString();
					this.txtClave.Text = i.Clave;
					this.txtDescripcionCorta.Text = i.NombreCorto;
					this.txtDescripcionLarga.Text = i.Descripcion;
					this.cboGrupo.Items.FindByValue(i.IdGrupo.ToString()).Selected = true;
					this.cboMarca.Items.FindByValue(i.IdMarca.ToString()).Selected = true;
					this.cboMaterial.Items.FindByValue(i.IdMaterial.ToString()).Selected = true;
					this.cboUnidad.Items.FindByValue(i.IdUnidad.ToString()).Selected = true;
					this.txtDimension.Text = i.Dimension.Value.ToString();
					this.txtPiezasPaquete.Text = i.PiezasPaquete.Value.ToString();
					this.txtPaquetesCaja.Text = i.PaquetesCajaBulto.Value.ToString();
					this.txtPrecioPaquetesCaja.Text = i.PrecioPaquete.Value.ToString();
					this.txtPrecioPieza.Text = i.PrecioPieza.Value.ToString();
					this.txtPrecioPiezasCajabulto.Text = i.PrecioCajaBulto.Value.ToString();
					this.txtMinimo.Text = i.Min.Value.ToString();
					this.txtMaximo.Text = i.Max.Value.ToString();
					this.txtCantidadInicial.Text = i.Inicial.Value.ToString();
					this.chkActivo.Checked = i.Activo.Value;
					this.chkInventario.Checked = i.Inventariable.Value;
					this.chkIva.Checked = i.Iva.Value;
					this.chkVisible.Checked = i.VisibleWeb.Value;
					this.imgBinaria.ContentBytes = i.Imagen.ToArray();
					ObtenerRuta(i.Id.ToString());

				}
				this.popupBusqueda.ShowOnPageLoad = false;
			}
			catch (Exception ex)
			{
				ex.ToString();
			}
		}

		public void ObtenerRuta(string IdProducto)
		{
			string targetPath = Server.MapPath("Imagenes/Productos/" + IdProducto);
			if (File.Exists(targetPath))
			{
				this.imageGallery.ImageSourceFolder = "~\\Imagenes\\Productos\\" + IdProducto;
				this.imageGallery.UpdateImageCacheFolder();
				this.ArchivosGaleriasFotos.Settings.RootFolder = targetPath;
			}
			else
			{
				Directory.CreateDirectory(targetPath);
				this.ArchivosGaleriasFotos.Settings.RootFolder = targetPath;
				this.imageGallery.ImageSourceFolder = "~\\Imagenes\\Productos\\" + IdProducto;
				this.imageGallery.UpdateImageCacheFolder();
			}
		}


		public System.Drawing.Image Base64StringToImage(byte[] imageBytes)
		{

			var memStream = new MemoryStream(imageBytes, 0, imageBytes.Length);

			memStream.Write(imageBytes, 0, imageBytes.Length);
			var image = System.Drawing.Image.FromStream(memStream);
			return image;
		}

		protected void btnFotoPrinicpal_Click(object sender, EventArgs e)
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var datosproducto = db.Productos_Consultar_Clave(this.txtClave.Text);
			foreach (var i in datosproducto)
			{
				this.imgBinaria.ContentBytes = i.Imagen.ToArray();
			}
			//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#myModal').modal('show');</script>", false);
			//ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
			this.popupImagen.ShowOnPageLoad = true;
		}

		protected void btnGaleria_Click(object sender, EventArgs e)
		{
			ObtenerRuta(this.Id.Value);
			this.popupCargaImagenes.ShowOnPageLoad = true;
		}

		protected void SubirImagen_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
		{
			string filename = Path.GetFileName(e.UploadedFile.FileName);
			string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);

			string targetPath = Server.MapPath("Imagenes/Productos/" + e.UploadedFile.FileName);
			if (File.Exists(targetPath))
			{
				File.Delete(targetPath);
			}
			e.UploadedFile.SaveAs(targetPath);
			byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
			MUSEBEDataContext db = new MUSEBEDataContext();
			db.Productos_Modificar_Foto(Int32.Parse(this.Id.Value), fileBytes);
			db.SubmitChanges();
		}


		protected void CP_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var query = db.Productos_Consultar_Clave(this.txtClave.Text);
			foreach (var i in query)
			{
				this.imgBinaria.ContentBytes = i.Imagen.ToArray();
			}
		}

		protected void btnCargarGaleria_Click(object sender, EventArgs e)
		{
			this.popupGaleria.ShowOnPageLoad = true;
		}
	}
}