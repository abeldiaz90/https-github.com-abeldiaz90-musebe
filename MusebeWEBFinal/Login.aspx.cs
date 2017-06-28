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
                if (Resultado.Rows.Count >= 1)
                {
                    FormsAuthenticationTicket tkt;
                    string cookiestr;
                    HttpCookie ck;
                    tkt = new FormsAuthenticationTicket(1,Login1.UserName, DateTime.Now, DateTime.Now.AddMinutes(30), false, "Abel Diaz Gonzalez");
                    cookiestr = FormsAuthentication.Encrypt(tkt);
                    ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                    ck.Path = FormsAuthentication.FormsCookiePath;
                    Response.Cookies.Add(ck);
                    Session["Usuario"] = this.Login1.UserName;
                    Response.Redirect("~/Default.aspx", false);                 
                }
                else
                {
  
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }



    }
}