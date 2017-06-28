using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilidades
{
    public class Informes
    {
        public void EnviarMail(Int32 IdRequisicion)
        {

            //try
            //{
            //    this.ReportViewer1.ProcessingMode = ProcessingMode.Local;
            //    LocalReport report = new LocalReport();
            //    report.EnableExternalImages = true;
            //    report.ReportPath = "Requisicion.rdlc";

            //    DataTable ds = DatosRequisicion(IdRequisicion);
            //    DataTable dslogo = ObtenerLogoEmpresa(IdRequisicion);

            //    ReportDataSource dsMain = new ReportDataSource();
            //    dsMain.Name = "DatosRequisicionesCompras";
            //    dsMain.Value = ds;

            //    ReportDataSource logo = new ReportDataSource();
            //    logo.Name = "ObtenerLogoEmpresa";
            //    logo.Value = dslogo;


            //    report.DataSources.Clear();
            //    report.DataSources.Add(dsMain);
            //    report.DataSources.Add(logo);
            //    report.Refresh();

            //    this.ReportViewer1.Visible = true;
            //    this.ReportViewer1.LocalReport.ReportPath = Server.MapPath("Requisicion.rdlc");
            //    this.ReportViewer1.LocalReport.DataSources.Clear();
            //    this.ReportViewer1.LocalReport.DataSources.Add(dsMain);
            //    this.ReportViewer1.LocalReport.DataSources.Add(logo);

            //    this.ReportViewer1.DocumentMapCollapsed = true;
            //    this.ReportViewer1.ShowPrintButton = true;
            //    this.ReportViewer1.LocalReport.Refresh();
            //}
            //catch (Exception ex) { ex.ToString(); }
        }
    }
}
