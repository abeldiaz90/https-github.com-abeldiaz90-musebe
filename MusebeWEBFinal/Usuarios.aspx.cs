using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnNuevoUsuario_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
            this.popupUsuario.ShowOnPageLoad = true;
        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                MUSEBEDataContext db = new MUSEBEDataContext();
                db.Usuarios_Insertar(this.txtUsuario.Text, Utilidades.Security.Encrypt(this.txtContraseña.Text), Int32.Parse(this.cboRol.SelectedItem.Value.ToString()),this.txtCorreoElectronico.Text);
                LimpiarCampos();
                this.popupUsuario.ShowOnPageLoad = false;
                this.grdUsuarios.DataBind();
            }
            catch (Exception ex) { ex.ToString(); }
        }
        public void LimpiarCampos() 
        {
            this.txtUsuario.Text = string.Empty;
            this.txtCorreoElectronico.Text = string.Empty;
            this.txtContraseña.Text = string.Empty;
            this.txtConfirmarContraseña.Text = string.Empty;
            this.cboRol.SelectedIndex = -1;
        }

        protected void grdUsuarios_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Password"] = Utilidades.Security.Encrypt(e.NewValues["Password"].ToString());
        }

        protected void grdUsuarios_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["Password"] = Utilidades.Security.Encrypt(e.NewValues["Password"].ToString());
        }

    }
}