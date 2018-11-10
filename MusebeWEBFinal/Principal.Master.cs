using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
         {
            if (!Page.IsPostBack)
            {
                bool val1 = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                if (val1)
                {
                    LlenarMenu();
                }

            }
        }

        public void LlenarMenu()
        {
            try
            {
                String Form = ObtenerNumeroFormulario(Path.GetFileName(Request.Url.AbsolutePath)).ToString();
                String MisPermisos = ObtenerMisPermisos(HttpContext.Current.User.Identity.Name.ToString());
                String[] Total = MisPermisos.Split(',');
                for (int i = 0; i <= Total.Length - 1; i++)
                {
                    if (Total[i].ToString() == Form.ToString())
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
                    else if (i == Total.Length - 1)
                    {
                        Response.Redirect("Error.aspx");
                    }
                }

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

        private DataTable ObtenerMenu()
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
        public Int32 ObtenerNumeroFormulario(String Formulario)
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

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Servicios.aspx");
        }

        protected void MiPerfil_Click(object sender, EventArgs e)
        {
            try { }
            catch (Exception ex) { ex.ToString(); }
        }

        public void LimpiarFormularioDatos()
        {
            this.txtNombre.Text = string.Empty;
            this.txtSegundoNombre.Text = string.Empty;
            this.txtApellidoPaterno.Text = string.Empty;
            this.txtApellidoMaterno.Text = string.Empty;
            this.txtCorreo.Text = string.Empty;
        }

        protected void MisDatos_Click(object sender, EventArgs e)
        {
            try
            {
                this.popupPerfil.ShowOnPageLoad = true;
                MUSEBEDataContext db = new MUSEBEDataContext();
                var query = db.Usuarios_Consultar_Datos(this.Page.User.Identity.Name.ToString());
                foreach (var i in query)
                {
                    this.txtNombre.Text = i.Nombre;
                    this.txtSegundoNombre.Text = i.Segundo_Nombre;
                    this.txtApellidoPaterno.Text = i.Apellido_Paterno;
                    this.txtApellidoMaterno.Text = i.Apellido_Materno;
                    this.txtCorreo.Text = i.Correo;
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            MUSEBEDataContext db = new MUSEBEDataContext();
            db.Usuarios_Modificar_Datos(this.Page.User.Identity.Name.ToString(), this.txtNombre.Text, this.txtSegundoNombre.Text, this.txtApellidoPaterno.Text, this.txtApellidoMaterno.Text, this.txtCorreo.Text);
            LimpiarFormularioDatos();
            this.popupPerfil.ShowOnPageLoad = false;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            MUSEBEDataContext db = new MUSEBEDataContext();
            db.Usuarios_Cambiar_Contraseña(this.Page.User.Identity.Name.ToString(),  Utilidades.Security.Encrypt(this.txtPasswordNuevoConfirm.Text));
            Utilidades.Mails n = new Utilidades.Mails();
            var query=db.Usuarios_Consultar_Datos(this.Page.User.Identity.Name.ToString());
            foreach(var d in query)
            {
                n.Mail(d.Correo, d.Correo,d.Correo, App_GlobalResources.Mensajes.CambioPasswordExitoso, true,"Estimado: <p><b>" + d.Nombre + " " + d.Segundo_Nombre + " " + d.Apellido_Paterno + " " + d.Apellido_Materno + "</b> Le informamos que:" + App_GlobalResources.Mensajes.CambioPasswordExitoso,null);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('" + App_GlobalResources.Mensajes.CambioPasswordExitoso + "')", true);
            }
            this.popupPassword.ShowOnPageLoad = false;
      
            FormsAuthentication.SignOut();            
        }

        protected void lnkPassword_Click(object sender, EventArgs e)
        {
            this.popupPassword.ShowOnPageLoad = true;
        }
   
    }
}