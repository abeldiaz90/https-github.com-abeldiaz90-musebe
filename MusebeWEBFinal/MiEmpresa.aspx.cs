using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class MiEmpresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { }
        }

        protected void lnkButtonLogo_Click(object sender, EventArgs e)
        {
            try
            {
                this.popupLogo.ShowOnPageLoad = true;          
            }
            catch (Exception ex) { ex.ToString(); }
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            string filename = Path.GetFileName(e.UploadedFile.FileName);
            string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);

            string targetPath = Server.MapPath("Imagenes/Empresas/" + e.UploadedFile.FileName);
            if (File.Exists(targetPath))
            {
                File.Delete(targetPath);
            }


            e.UploadedFile.SaveAs(targetPath);

            byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
            MUSEBEDataContext db = new MUSEBEDataContext();
            db.Empresas_Insertar_Logo(Int32.Parse(this.grdEmpresas.GetRowValues(this.grdEmpresas.FocusedRowIndex, "Id").ToString()),fileBytes);
            this.popupLogo.ShowOnPageLoad = false;
        }
    }
}