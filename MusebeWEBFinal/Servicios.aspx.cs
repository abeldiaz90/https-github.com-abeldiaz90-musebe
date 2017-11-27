using System;
using System.Collections.Generic;
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
				ObjectCache cache = MemoryCache.Default;
				try
				{
						const string imagesPath = "/Imagenes/Servicios/";
						var dir = new DirectoryInfo(HttpContext.Current.Server.MapPath(imagesPath));
						//filtering to jpgs, but ideally not required
						List<string> fileNames = (from flInfo in dir.GetFiles() where flInfo.Name.EndsWith(".jpg") select flInfo.Name).ToList();
						if (fileNames.Count > 0)
						{
							var carouselInnerHtml = new StringBuilder();
							var indicatorsHtml = new StringBuilder(@"<ol class='carousel-indicators'>");

							MUSEBEDataContext db = new MusebeWEBFinal.MUSEBEDataContext();
							
							for (int i = 0; i < fileNames.Count; i++)
							{
								var fileName = fileNames[i];
								var query=db.Servicios_Consultar_Por_Foto(fileName);
								foreach (var j in query)
								{							
								carouselInnerHtml.AppendLine(i == 0 ? "<div class='item active' style='margin: auto;'>" : "<div class='item'>");
								carouselInnerHtml.AppendLine("<img class='img-responsive' src='" + imagesPath + fileName + "' alt='Slide #" + (i + 1) + "'>");
								carouselInnerHtml.AppendLine("<h3  style='color: white; font-weight: bold; font-size: 20px;'>" + j.Servicio+ "</h3><p><label style='color: white;' id='" + imagesPath + fileName + "'>" + j.Descripcion +"</label></p>");
								carouselInnerHtml.AppendLine("</div>");
								indicatorsHtml.AppendLine(i == 0 ? @"<li data-target='#myCarousel' data-slide-to='" + i + "' class='active'></li>" : @"<li data-target='#myCarousel' data-slide-to='" + i + "' class=''></li>");
								}
							}
							//close tag
							indicatorsHtml.AppendLine("</ol>");
							//stick the html in the literal tags and the cache
							cache["CarouselInnerHtml"] = ltlCarouselImages.Text = carouselInnerHtml.ToString();
							cache["CarouselIndicatorsHtml"] = ltlCarouselIndicators.Text = indicatorsHtml.ToString();
					}
				}
				catch (Exception)
				{
					//something is dodgy so flush the cache
					if (cache["CarouselInnerHtml"] != null)
					{
						Cache.Remove("CarouselInnerHtml");
					}
					if (cache["CarouselIndicatorsHtml"] != null)
					{
						Cache.Remove("CarouselIndicatorsHtml");
					}
				}
			}
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