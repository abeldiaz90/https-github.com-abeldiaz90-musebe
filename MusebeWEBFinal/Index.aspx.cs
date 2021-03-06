﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Caching;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal.scripts
{
	public partial class Index : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
				{
					if (Rol() == "1")
					{
						this.btnEditar.Visible = true;
						this.btnEditarGaleria.Visible = true;
					}
					else
					{
						this.btnEditar.Visible = false;
						this.btnEditarGaleria.Visible = false;
					}
				}
				else
				{
					this.btnEditar.Visible = false;
					this.btnEditarGaleria.Visible = false;
					//Response.Redirect("login.aspx");
				}
				Carrusel();
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

		public void Carrusel()
		{
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
						var query = db.Servicios_Consultar_Por_Foto(fileName);
						foreach (var j in query)
						{
							carouselInnerHtml.AppendLine(i == 0 ? "<div class='item active' style='margin: auto;'>" : "<div class='item'>");
							carouselInnerHtml.AppendLine("<h3  style='color: black; font-weight: bold; font-size: 20px;'>" + j.Servicio + "</h3><p><label style='color: black;' id='" + imagesPath + fileName + "'>" + j.Descripcion + "</label></p>");
							carouselInnerHtml.AppendLine("<a href='" + j.NavigateUrl + "'><img class='img-responsive center-block' src='" + imagesPath + fileName + "' alt='Slide #" + (i + 1) + "'></a>");

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
		public void MostrarLogo()
		{
			MUSEBEDataContext db = new MUSEBEDataContext();
			var query = db.Logo_Obtener_Musebe(this.Page.User.Identity.ToString());
			foreach (var i in query)
			{
				//this.imgLogo.Value = i.Logo;
			}
		}

		protected void btnEditar_Click(object sender, EventArgs e)
		{
			try { this.popupEditarNoticias.ShowOnPageLoad = true; }
			catch (Exception ex) { ex.ToString(); }
		}

		protected void btnEditarGaleria_Click(object sender, EventArgs e)
		{
			try { this.popupEditarGaleria.ShowOnPageLoad = true; }
			catch (Exception ex) { ex.ToString(); }
		}

		

		protected void lnkPassword_Click(object sender, EventArgs e)
		{

		}


		protected void lnkPedidos_Click(object sender, EventArgs e)
		{

		}
	}
}