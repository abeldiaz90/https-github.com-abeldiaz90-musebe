using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Decode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDecodificar_Click(object sender, EventArgs e)
        {
            try
            {
                MUSEBEDataContext db = new MUSEBEDataContext();
                var query = db.Usuarios_Consultar_Datos(this.txtUsuario.Text);
                foreach (var i in query) 
                {
                    this.lblPassword.Text = Utilidades.Security.Decrypt(i.Password);
                }
            }
            catch (Exception ex) { ex.ToString(); }
        }
    }
}