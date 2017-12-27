using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
			//LlenarMenu();
		}

		public void LlenarMenu()
		{
			try
			{
				//String Form = ObtenerNumeroFormulario(Path.GetFileName(Request.Url.AbsolutePath)).ToString();
				//String MisPermisos = ObtenerMisPermisos(HttpContext.Current.User.Identity.Name.ToString());
				//String[] Total = MisPermisos.Split(',');
				//for (int i = 0; i <= Total.Length - 1; i++)
				//{
				//	if (Total[i].ToString() == Form.ToString())
				//	{
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
				//	}
				//			else if (i == Total.Length - 1)
				//	{
				//		Response.Redirect("Error.aspx");
				//	}
				//}

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
	}
}
