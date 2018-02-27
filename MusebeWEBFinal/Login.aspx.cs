using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
			{
				if (Rol() == "1")
				{
					Response.Redirect("~/Default.aspx", false);
				}
				else
				{
					Response.Redirect("~/Index.aspx", false);
				}
			}
			else {  }
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

		protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
		{
			try
			{
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "USUARIOS_VALIDAR_ACCESO";
				com.CommandType = CommandType.StoredProcedure;
				com.Parameters.AddWithValue("@Usuario", this.Login1.UserName);
				com.Parameters.AddWithValue("@Password", Utilidades.Security.Encrypt(this.Login1.Password));
				com.ExecuteNonQuery();

				SqlDataAdapter datos = new SqlDataAdapter(com);
				DataTable Resultado = new DataTable();
				datos.Fill(Resultado);
				con.Close();
				if (Resultado.Rows.Count >= 1)
				{
					FormsAuthenticationTicket tkt;
					string cookiestr;
					HttpCookie ck;
					tkt = new FormsAuthenticationTicket(1, Login1.UserName, DateTime.Now, DateTime.Now.AddMinutes(30), false, this.Login1.UserName);
					cookiestr = FormsAuthentication.Encrypt(tkt);
					ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
					ck.Path = FormsAuthentication.FormsCookiePath;
					Response.Cookies.Add(ck);
					Session["Usuario"] = this.Login1.UserName;
					Session["Rol"] = Resultado.Rows[0]["ID_ROL"].ToString();
					if (Resultado.Rows[0]["ID_ROL"].ToString() == "")
					{
						Response.Redirect("~/Index.aspx", false);
					}
					else
					{
						Response.Redirect("~/Default.aspx", false);
					}
				}
				else
				{

				}
			}
			catch (Exception ex) { ex.ToString(); }
		}

		protected void LinkButton2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Register.aspx");
		}

		protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
		{

		}
	}
}