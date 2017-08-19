<%@ Page Title="Compras" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="MusebeWEBFinal.Compras" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="col-md-6">
                <!-- Single button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Opciones <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <asp:LinkButton ID="lnkTodosElementos" runat="server" OnClick="lnkTodosElementos_Click">Ver todas las compras</asp:LinkButton></li>

                        <li>
                            <asp:LinkButton ID="lnkReporte" runat="server" OnClick="lnkReporte_Click">Reporte de Inventario</asp:LinkButton></li>
                    </ul>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Compra de Articulos</div>
                <div class="panel-body">
                    <div class="jumbotron">
                        <div class="container">

                            <ol class="breadcrumb">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtFolioCompra" runat="server" Caption="Consecutivo:" CssClass="form-control" ReadOnly="True">
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxDateEdit ID="fechaCompra" Caption="Fecha de Transacción:" runat="server" CssClass="form-control" NullText="Indique la Fecha de Compra">
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                    <RequiredField IsRequired="True" ErrorText="Dato Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxComboBox ID="cboProveedor" runat="server" Caption="Proveedor:" CssClass="form-control" DataSourceID="DatosProveedores" NullText="Seleccione Proveedor" TextField="Proveedor" ValueField="Id">
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                    <RequiredField IsRequired="True" ErrorText="Dato Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="DatosProveedores" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Proveedores_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>

                            </ol>
                            <ol class="breadcrumb">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <dx:ASPxListBox ID="lstTipoGasto" runat="server" Caption="Tipo de Gasto:" CssClass="form-control" DataSourceID="TipoGastos" Height="64px" SelectionMode="CheckColumn" TextField="Grupo" ValueField="Id" Width="30%">
                                            <CaptionSettings Position="Top" />
                                        </dx:ASPxListBox>
                                        <asp:SqlDataSource ID="TipoGastos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="SELECT [Id], [Grupo] FROM [Grupos] where Activo=1"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <dx:ASPxComboBox ID="cboFormaPago" runat="server" CssClass="form-control" Caption="Forma de Pago:" AutoPostBack="True" OnSelectedIndexChanged="cboFormaPago_SelectedIndexChanged1">
                                            <Items>
                                                <dx:ListEditItem Text="Contado" Value="1" />
                                                <dx:ListEditItem Text="Credito" Value="2" />
                                            </Items>
                                            <CaptionSettings Position="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtSubtotal" runat="server" Caption="Subtotal:" CssClass="form-control" NullText="Capture el subtotal" ClientInstanceName="txtSubtotal" AutoPostBack="True" OnTextChanged="txtSubtotal_TextChanged">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                    <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4 col-sm-6 col-md-4">
                                        <dx:ASPxRadioButtonList ID="rdbTipoCredito" runat="server" Caption="Tipo de Crédito:" RepeatDirection="Horizontal" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="rdbTipoCredito_SelectedIndexChanged">
                                            <Items>
                                                <dx:ListEditItem Text="MSI" Value="1" />
                                                <dx:ListEditItem Text="Días de Credito" Value="2" />
                                            </Items>
                                            <CaptionSettings Position="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxRadioButtonList>
                                    </div>
                                    <div class="col-xs-4 col-sm-6 col-md-4">
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtIVA" runat="server" Caption="IVA:" CssClass="form-control" NullText="Capture el IVA" ClientInstanceName="txtIVA" AutoPostBack="True" OnTextChanged="txtIVA_TextChanged">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-8">
                                        <dx:ASPxComboBox ID="cboMSI" runat="server" CssClass="form-control" Caption="MSI:" Visible="False">
                                            <Items>
                                                <dx:ListEditItem Text="3" Value="1" />
                                                <dx:ListEditItem Text="6" Value="2" />
                                                <dx:ListEditItem Text="9" Value="3" />
                                                <dx:ListEditItem Text="12" Value="4" />
                                                <dx:ListEditItem Text="18" Value="5" />
                                                <dx:ListEditItem Text="24" Value="6" />
                                            </Items>
                                            <CaptionSettings Position="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>

                                        <dx:ASPxComboBox ID="cboDiasCredito" runat="server" CssClass="form-control" Caption="Días de Crédito:" Visible="False">
                                            <Items>
                                                <dx:ListEditItem Text="30" Value="1" />
                                                <dx:ListEditItem Text="60" Value="2" />
                                                <dx:ListEditItem Text="90" Value="3" />
                                            </Items>
                                            <CaptionSettings Position="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtIEPS" runat="server" Caption="IEPS:" CssClass="form-control" NullText="Capture el IEPS" ClientInstanceName="txtIEPS" AutoPostBack="True" OnTextChanged="txtIEPS_TextChanged">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <dx:ASPxComboBox ID="cboMetodoPago" runat="server" CssClass="form-control" Caption="Método de Pago:" OnSelectedIndexChanged="cboMetodoPago_SelectedIndexChanged" AutoPostBack="True">
                                            <Items>
                                                <dx:ListEditItem Text="Efectivo" Value="1" />
                                                <dx:ListEditItem Text="TDC" Value="2" />
                                                <dx:ListEditItem Text="Cheque" Value="3" />
                                                <dx:ListEditItem Text="Transferencia" Value="4" />
                                            </Items>
                                            <CaptionSettings Position="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField ErrorText="Dato Obligatorio" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtISH" runat="server" Caption="ISH:" CssClass="form-control" NullText="Capture el ISH" ClientInstanceName="txtISH" AutoPostBack="True" OnTextChanged="txtISH_TextChanged">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-8">
                                        <dx:ASPxComboBox ID="cboTarjetasCredito" runat="server" Caption="Tarjeta de Credito:" CssClass="form-control" Visible="False" DataSourceID="DatosTarjetaCredito" HorizontalAlign="Center" TextField="NumeroTarjeta" ValueField="Id">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Id" FieldName="Id" Visible="False" />
                                                <dx:ListBoxColumn Caption="Número de Tarjeta" FieldName="NumeroTarjeta" />
                                                <dx:ListBoxColumn Caption="Banco" FieldName="Banco" />
                                            </Columns>
                                            <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField IsRequired="True" ErrorText="Dato Obligatorio" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="DatosTarjetaCredito" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Tarjetas_Consultar_Todos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        <dx:ASPxDateEdit ID="fechaTransferencia" runat="server" Visible="False" Caption="Fecha de la Transferencia" CssClass="form-control">
                                            <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField IsRequired="True" ErrorText="Dato Obligatorio" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                        <dx:ASPxTextBox ID="txtNumeroChequetRansferencia" runat="server" Caption="Número de Cheque:" NullText="Escriba Numero de cheque o transfernecia" CssClass="form-control" Visible="False">
                                            <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            <ValidationSettings SetFocusOnError="True" ValidationGroup="AgregarProducto">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtPropina" runat="server" Caption="Propina:" CssClass="form-control" NullText="Capture la Propina" ClientInstanceName="txtPropina" AutoPostBack="True" OnTextChanged="txtPropina_TextChanged">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-8">
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <div class="form-group">
                                            <dx:ASPxTextBox ID="txtTotal" runat="server" Caption="Total:" CssClass="form-control" NullText="Total" ClientInstanceName="txtTotal" ReadOnly="True">
                                                <MaskSettings Mask="$&lt;0..99999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                            </ol>
                            <ol class="breadcrumb">
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" ValidationGroup="AgregarProducto" CssClass="btn btn-primary"></dx:ASPxButton>
                                <dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" CssClass="btn btn-default"></dx:ASPxButton>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <dx:ASPxPopupControl ID="popupMensajes" runat="server" Modal="true" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" ShowPageScrollbarWhenModal="true" Width="300px" HeaderText="">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxLabel ID="lblMensaje" runat="server" Text="" Width="250px">
                        </dx:ASPxLabel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Reporte de Inventario" Maximized="True" Modal="True">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
						</rsweb:ReportViewer>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="VincoEnergy.InventarioDatosTableAdapters.Inventario_Consultar_Reporte_TodosTableAdapter"></asp:ObjectDataSource>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnNuevo" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
