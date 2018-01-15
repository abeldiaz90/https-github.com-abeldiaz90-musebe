using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class menupaginaweb : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LlenarMenu();
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
						this.Menu.DataSource = xmlDataSource;
						this.Menu.DataBind();
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
				com.CommandText = "OBTENER_MENU_WEB";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				Datos.Fill(TablaDatos);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return TablaDatos;
		}
		public Int32 FormarMenu(String Formulario)
		{
			Int32 Numero = 0;
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ToString();
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.Parameters.AddWithValue("@FORMULARIO", Formulario);
				com.CommandText = "ObtenerNumeroFormulario";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				DataTable TablaDatos = new DataTable();
				Datos.Fill(TablaDatos);
				if (TablaDatos.Rows.Count >= 1)
				{
					Numero = Convert.ToInt32(TablaDatos.Rows[0][0].ToString());
				}
				con.Close();
			}
			catch (Exception Ex) { Ex.ToString(); }
			return Numero;
		}
		public String BuscarUusario(String Usuario)
		{
			String Imagen = "";
			try
			{
				string[] a = this.Page.User.Identity.Name.Split('\\');
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ToString();
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "select id_empleado from cat_empleados where user_red='" + Usuario + "'";
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				DataTable Tabla = new DataTable();
				Datos.Fill(Tabla);
				Imagen = Tabla.Rows[0][0].ToString();
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Imagen;
		}
		public String ObtenerMisPermisos(String Usuario)
		{
			String Resultado = "";
			DataTable TablaDatos = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ToString();
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.Parameters.AddWithValue("@USUARIO", Usuario);
				com.CommandText = "VERIFICAR_PERMISOS";
				com.CommandType = CommandType.StoredProcedure;
				com.ExecuteNonQuery();
				SqlDataAdapter Datos = new SqlDataAdapter(com);
				Datos.Fill(TablaDatos);
				if (TablaDatos.Rows.Count >= 1)
				{
					Resultado = TablaDatos.Rows[0][0].ToString();
				}
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Resultado;
		}
		private void GetChildRowsFromDataRelation(DataTable table)
		{
			DataRow[] arrRows;
			foreach (DataRelation relation in table.ChildRelations)
			{
				foreach (DataRow row in table.Rows)
				{
					arrRows = row.GetChildRows(relation);
					// Print values of rows.
					for (int i = 0; i < arrRows.Length; i++)
					{
						foreach (DataColumn column in table.Columns)
						{
							Response.Write(arrRows[i][column]);
						}
					}
				}
			}
		}
	}
}