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
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void lnkCancelar_Click(object sender, EventArgs e)
		{
			try
			{
				limpiar();
			}
			catch (Exception ex) { ex.ToString(); }
		}

		protected void lnkGuardar_Click(object sender, EventArgs e)
		{
			try
			{

			}
			catch (Exception ex) { ex.ToString(); }
		}

		public void limpiar()
		{
			this.txtNombre.Text = string.Empty;
			this.txtSegundoNombre.Text = string.Empty;
			this.txtApellidoMaterno.Text = string.Empty;
			this.txtApellidoPaterno.Text = string.Empty;
			this.txtCorreo.Text = string.Empty;
			this.txtTelefono.Text = string.Empty;
			//this.txtDomiclio.Text = string.Empty;
			//this.txtRFC.Text = string.Empty;
			this.txtPassword.Text = string.Empty;
			this.txtPasswordConfirm.Text = string.Empty;
			//this.txtRazonsocial.Text = string.Empty;
			this.txtUsuario.Text = string.Empty;
		}

		protected void btnGuardar_Click(object sender, EventArgs e)
		{
			try
			{
				MUSEBEDataContext db = new MUSEBEDataContext();
				db.Usuarios_Insertar_Web(this.txtUsuario.Text, Utilidades.Security.Encrypt(this.txtPassword.Text), "", "", "", this.txtNombre.Text, this.txtSegundoNombre.Text, this.txtApellidoPaterno.Text, this.txtApellidoMaterno.Text, this.txtCorreo.Text, this.txtTelefono.Text, "");
				db.SubmitChanges();				
				IniciarSesion();
				limpiar();
			}
			catch (Exception ex) { ex.ToString(); }
		}

		public void IniciarSesion()
		{
			try
			{
				FormsAuthentication.SignOut();
				SqlConnection con = new SqlConnection();
				con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
				con.Open();
				SqlCommand com = new SqlCommand();
				com.Connection = con;
				com.CommandText = "USUARIOS_VALIDAR_ACCESO";
				com.CommandType = CommandType.StoredProcedure;
				com.Parameters.AddWithValue("@Usuario", this.txtUsuario.Text);
				com.Parameters.AddWithValue("@Password", Utilidades.Security.Encrypt(this.txtPassword.Text));
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
					tkt = new FormsAuthenticationTicket(1, this.txtUsuario.Text, DateTime.Now, DateTime.Now.AddMinutes(30), false, this.txtUsuario.Text);
					cookiestr = FormsAuthentication.Encrypt(tkt);
					ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
					ck.Path = FormsAuthentication.FormsCookiePath;
					Response.Cookies.Add(ck);
					Session["Usuario"] = this.txtUsuario.Text;
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

		protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
		{

		}

		protected void lnkPedidos_Click(object sender, EventArgs e)
		{

		}
	}
}