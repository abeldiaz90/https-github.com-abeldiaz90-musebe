using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class detalleservicio : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Page.Request.QueryString["Id"] != null || Page.Request.QueryString["Id"] != string.Empty)
			{
				ObtenerDetalle(Page.Request.QueryString["Id"].ToString());
			}
		}

		public void ObtenerDetalle(string Id)
		{
			anuncios.InnerHtml = MenuServicios(Id).Rows[0][0].ToString();
		}

		public DataTable MenuServicios(String id)
		{
			DataTable Resultado = new DataTable();
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "select Detalle from servicios where id='"+ id +"'";
				com.CommandType = CommandType.Text;
				com.ExecuteNonQuery();
				SqlDataAdapter datos = new SqlDataAdapter(com);
				datos.Fill(Resultado);
				con.Close();
			}
			catch (Exception ex) { ex.ToString(); }
			return Resultado;
		}
	}
}