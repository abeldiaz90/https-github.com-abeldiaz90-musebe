using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusebeWEBFinal
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubirImagen_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            string filename = Path.GetFileName(e.UploadedFile.FileName);
            string ruta = Path.GetDirectoryName(e.UploadedFile.FileName);

            string targetPath = Server.MapPath("Imagenes/Productos/" + e.UploadedFile.FileName);
            if (File.Exists(targetPath))
            {
                File.Delete(targetPath);
            }


            e.UploadedFile.SaveAs(targetPath);

            byte[] fileBytes = System.IO.File.ReadAllBytes(targetPath);
            MUSEBEDataContext db = new MUSEBEDataContext();
            db.Productos_Modificar_Foto(Int32.Parse(this.grdProductos.GetRowValues(this.grdProductos.FocusedRowIndex, "Id").ToString()), fileBytes);
            this.popupImagen.ShowOnPageLoad = false;
        }
        public static byte[] ConvertImageToByteArray(System.Drawing.Image _image, ImageFormat _formatImage)
        {
            byte[] ImageByte;

            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    _image.Save(ms, _formatImage);
                    ImageByte = ms.ToArray();
                }
            }
            catch (Exception) { throw; }
            return ImageByte;
        }
        protected void btnImprimirCatalogo_Click(object sender, EventArgs e)
        {
            try { this.grdExportar.WriteXlsxToResponse(); }
            catch (Exception ex) { ex.ToString(); }
        }
        protected void btnExportar_Click(object sender, EventArgs e)
        {
            try
            {
                this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
                LocalReport report = new LocalReport();
                report.EnableExternalImages = true;
                report.ReportPath = "Productos.rdlc";

                DataTable ds = ProductosLista();

                ReportDataSource dsMain = new ReportDataSource();
                dsMain.Name = "DatosProductos";
                dsMain.Value = ds;

                report.DataSources.Clear();
                report.DataSources.Add(dsMain);
                report.Refresh();

                this.ReportViewer1.Visible = true;
                this.ReportViewer1.LocalReport.ReportPath = Server.MapPath("Productos.rdlc");
                this.ReportViewer1.LocalReport.DataSources.Clear();
                this.ReportViewer1.LocalReport.DataSources.Add(dsMain);

                this.ReportViewer1.DocumentMapCollapsed = true;
                this.ReportViewer1.ShowPrintButton = true;
                this.ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex) { ex.ToString(); }
        }
        public DataTable ProductosLista()
        {
            DataTable Resultado = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
                con.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = "Productos_Consultar";
                com.CommandType = CommandType.StoredProcedure;
                com.ExecuteNonQuery();

                SqlDataAdapter datos = new SqlDataAdapter(com);
                Resultado = new DataTable();
                datos.Fill(Resultado);
            }
            catch (Exception ex) { ex.ToString(); }
            return Resultado;
        }

    }
}