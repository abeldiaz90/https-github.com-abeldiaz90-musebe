using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Video : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void popupDocumentos_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                //string filename = Path.GetFileName(e.UploadedFile.FileName);
                //string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);
                string targetPath = Server.MapPath("~/msbear/videos/biodegradables.mp4");
                if (File.Exists(targetPath))
                {
                    File.Delete(targetPath);
                }
                e.UploadedFile.SaveAs(targetPath);
            }
            catch (Exception ex) { ex.ToString(); }
        }
    }
}