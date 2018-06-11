<%@ Page Title="Cotizaciones" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Cotizaciones.aspx.cs" Inherits="MusebeWEBFinal.Cotizaciones" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function Confirm() {
                    var Texto = '¿ Desea generar una copia de esta Requisición ?';
                    var id = "confirm_value",
         confirm_value = document.getElementById("confirm_value");

                    if (!confirm_value) {
                        confirm_value = document.createElement("input");
                        confirm_value.type = "hidden";
                        confirm_value.name = id;
                        confirm_value.id = id;

                        document.forms[0].appendChild(confirm_value);
                    }

                    confirm_value.value = confirm(Texto) ? "Yes" : "No";
                }
            </script>
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="Guardar" CausesValidation="true" OnClick="btnGuardarBorrador_Click" Image-IconID="iconGuardarBorrador" Image-AlternateText="Guardar Borrador" ToolTip="Guardar" Image-Url="~/Fonts/glyphicons-448-floppy-open.png"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnEditarBorrador" runat="server" Text="Editar" CssClass="btn btn-success" Image-AlternateText="Editar" Image-IconID="iconEditarBorrador" Image-Url="~/Fonts/glyphicons-448-floppy-open.png" OnClick="btnEditarBorrador_Click"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnLimpiarFormato" runat="server" Text="Limpiar" CssClass="btn btn-warning" Image-AlternateText="Limpiar" Image-IconID="iconLimpiarFormato" Image-Url="~/Fonts/glyphicons-208-remove.png" OnClick="btnLimpiarFormato_Click"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnImprimir" runat="server" Text="Imprimir" CssClass="btn btn-default" Image-AlternateText="Imprimir" Image-IconID="iconPRINT" Image-Url="~/Fonts/glyphicons-16-print.png" OnClick="btnImprimir_Click"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnEnviarCorreo" runat="server" Text="Enviar por Correo" CssClass="btn btn-primary" Image-AlternateText="Enviar Por Correo" Image-IconID="iconPRINT" Image-Url="~/Fonts/glyphicons-11-envelope.png" OnClick="btnEnviarCorreo_Click"></dx:ASPxButton>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Datos del Cliente</div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtFolio" runat="server" CssClass="form-control col-xs-3" Caption="Folio:" ReadOnly="True">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxDateEdit ID="FechaCotizacion" runat="server" Caption="Fecha:" Theme="Metropolis" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                            </dx:ASPxDateEdit>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtTitulo" runat="server" CssClass="form-control col-xs-3" Caption="Titulo:">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="cboClientes" runat="server" Caption="Cliente o Compañia:" DataSourceID="ClientesDatos" TextField="Cliente" ValueField="Id" AutoPostBack="True" OnSelectedIndexChanged="cboClientes_SelectedIndexChanged" AutoResizeWithContainer="True" Theme="Metropolis" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="ClientesDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Clientes_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="cboContacto" runat="server" AutoPostBack="True" AutoResizeWithContainer="True" Caption="Contacto:" TextField="Nombre" ValueField="Id" ValueType="System.String" OnSelectedIndexChanged="cboContacto_SelectedIndexChanged" Theme="Metropolis" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtCorreo" runat="server" CssClass="form-control col-xs-3" Caption="Correo:" Theme="Metropolis">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtTelefono" runat="server" CssClass="form-control col-xs-3" Caption="Telefono:" Theme="Metropolis">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                        	<asp:HiddenField ID="Letra" runat="server" />
                        	<asp:HiddenField ID="Numero" runat="server" />
                        </div>
                    </div>

                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">Partidas</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtItem">Escriba y seleccione el Item</label>
                            <asp:TextBox ID="txtItem" runat="server" BorderStyle="Solid" CssClass="form-control" Font-Names="Trebuchet MS" Font-Size="Large" TabIndex="1" AutoCompleteType="Disabled" AutoComplete="off" ValidationGroup="Agregar"></asp:TextBox>
                            <asp:AutoCompleteExtender ID="txtItem_AutoCompleteExtender" runat="server"
                                CompletionInterval="1"
                                Enabled="True" MinimumPrefixLength="1"
                                EnableCaching="true" CompletionSetCount="1"
                                DelimiterCharacters="" ShowOnlyCurrentWordInCompletionListItem="true"
                                ServiceMethod="BusquedaItems" ServicePath="~/ServicioWeb.asmx"
                                TargetControlID="txtItem">
                            </asp:AutoCompleteExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                BorderStyle="Solid" ControlToValidate="txtItem" Display="None"
                                ErrorMessage="Capture y Seleccione el Material" Font-Bold="True"
                                ForeColor="Red" SetFocusOnError="True" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                runat="server" Enabled="True" PopupPosition="BottomRight"
                                TargetControlID="RequiredFieldValidator1">
                            </asp:ValidatorCalloutExtender>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxTextBox ID="txtCantidad" runat="server" Caption="Cantidad" CssClass="form-control" NullText="Ingrese la Cantidad">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                                <FocusedStyle BackColor="#FFFF66" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxButton ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" CssClass="btn btn-primary" Text="Agregar" Theme="Glass" ValidationGroup="Agregar" Image-IconID="icon" Image-Url="~/Fonts/glyphicons-415-disk-save.png">
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" CssClass="btn btn-danger" Text="Cancelar" Theme="Glass" Image-AlternateText="Cancelar" ToolTip="Cancelar" Image-IconID="Icon-Cancel" Image-Url="~/Fonts/glyphicons-8-user-remove.png">
                            </dx:ASPxButton>
                        </div>
                    </div>
                    <dx:ASPxGridView ID="grdArticulos" runat="server" AutoGenerateColumns="False" DataSourceID="ArticulosListado" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%" ClientInstanceName="grdArticulos">
                        <TotalSummary>
							<dx:ASPxSummaryItem DisplayFormat="c2" FieldName="TotalConDescuento" ShowInColumn="Precio Total con Descuento" ShowInGroupFooterColumn="Precio Total con Descuento" SummaryType="Sum" ValueDisplayFormat="c2" />
							<dx:ASPxSummaryItem DisplayFormat="c2" FieldName="DescuentoTotal" ShowInColumn="Descuento Total" ShowInGroupFooterColumn="Descuento Total" SummaryType="Sum" ValueDisplayFormat="c2" />
							<dx:ASPxSummaryItem DisplayFormat="c2" FieldName="SubTotal" ShowInColumn="Importe Venta" ShowInGroupFooterColumn="Importe Venta" SummaryType="Sum" ValueDisplayFormat="c2" />
						</TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Partida" ReadOnly="True" VisibleIndex="1">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="19">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="IdProducto" Visible="False" VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Código de Articulo" FieldName="clave" VisibleIndex="4">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="21" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioUnitario" VisibleIndex="9" Caption="Precio Unitario Compra">
                                <PropertiesTextEdit DisplayFormatString="c2" DisplayFormatInEditMode="True">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="6" Caption="Descripción de Articulo">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Unidad" VisibleIndex="7">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="5">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SubTotal" ReadOnly="True" VisibleIndex="12" Caption="Importe Compra">
                                <PropertiesTextEdit DisplayFormatString="C2">
                                </PropertiesTextEdit>
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataBinaryImageColumn FieldName="Imagen" VisibleIndex="3">
                                <PropertiesBinaryImage ImageHeight="100px" ImageWidth="100px">
                                </PropertiesBinaryImage>
                            </dx:GridViewDataBinaryImageColumn>
                            <dx:GridViewDataTextColumn Caption="Precio Unitario Venta" FieldName="PrecioMargen" VisibleIndex="10">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Importe Venta" FieldName="subtotalMargen" VisibleIndex="13">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="2">
                            	<EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataSpinEditColumn Caption="Margen de Ganancia" FieldName="MargenGanancia" VisibleIndex="8">
								<PropertiesSpinEdit DisplayFormatString="{0}%" MaxValue="100" NumberFormat="Percent">
								</PropertiesSpinEdit>
							</dx:GridViewDataSpinEditColumn>
							<dx:GridViewDataSpinEditColumn Caption="Descuento" FieldName="Descuento" VisibleIndex="14">
								<PropertiesSpinEdit DisplayFormatString="{0}%" LargeIncrement="1" MaxValue="100" NumberFormat="Percent">
								</PropertiesSpinEdit>
							</dx:GridViewDataSpinEditColumn>
							<dx:GridViewDataTextColumn Caption="Descuento Unitario" FieldName="DescuentoEfectivoUnitario" VisibleIndex="15">
								<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
								</PropertiesTextEdit>
								<EditFormSettings Visible="False" />
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn Caption="Precio Unitario con Descuento" FieldName="PrecioUnitarioConDescuento" VisibleIndex="16">
								<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
								</PropertiesTextEdit>
								<EditFormSettings Visible="False" />
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn Caption="Descuento Total" FieldName="DescuentoTotal" VisibleIndex="17">
								<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
								</PropertiesTextEdit>
								<EditFormSettings Visible="False" />
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn Caption="Precio Total con Descuento" FieldName="TotalConDescuento" VisibleIndex="18">
								<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
								</PropertiesTextEdit>
								<EditFormSettings Visible="False" />
							</dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" />
                        <SettingsSearchPanel Visible="True" />
                        <Styles>
                            <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                            </Header>
                            <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                            </Cell>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="ArticulosListado" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Cotizaciones_Consultar_Detalle" SelectCommandType="StoredProcedure" DeleteCommand="Cotizaciones_Consultar_Detalle_Eliminar" DeleteCommandType="StoredProcedure" UpdateCommand="Cotizaciones_Detalle_Modificar" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="txtFolio" Name="FolioCotizacion" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFolio" Name="FolioCotizacion" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    	<UpdateParameters>
							<asp:Parameter Name="Id" Type="Int32" />
							<asp:Parameter Name="MargenGanancia" Type="Single" />
							<asp:Parameter Name="PrecioUnitario" Type="Decimal" />
							<asp:Parameter Name="Descuento" Type="Single" />
							<asp:Parameter Name="Cantidad" Type="Int32" />
						</UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">Condiciones Comerciales</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <dx:ASPxComboBox ID="cboTipoMoneda" runat="server" Caption="Precios de Lista en:" CssClass="form-control" Theme="Metropolis">
                                <Items>
                                    <dx:ListEditItem Text="Pesos Mexicanos(MXN)" Value="1" />
                                    <dx:ListEditItem Text="Dolares" Value="2" />
                                </Items>
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxComboBox ID="cboFormaPago" runat="server" Caption="Forma de Pago:" CssClass="form-control" Theme="Metropolis">
                                <Items>
                                    <dx:ListEditItem Text="Contado" Value="1" />
                                    <dx:ListEditItem Text="Credito a 15 Dias" Value="2" />
                                    <dx:ListEditItem Text="Credito a 30 Dias" Value="3" />
                                    <dx:ListEditItem Text="Credito a 60 Dias" Value="4" />
                                	<dx:ListEditItem Text="Credito a 120 dias" Value="5" />
                                </Items>
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxTextBox ID="txtReferencia" runat="server" CssClass="form-control" Caption="Referencia:" Theme="Metropolis">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <dx:ASPxComboBox ID="cboMetodoPago" runat="server" CssClass="form-control" Theme="Metropolis" Caption="Método de Pago">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <Items>
                                    <dx:ListEditItem Text="Cheques" Value="1" />
                                    <dx:ListEditItem Text="Transferencia Bancaria" Value="2" />
                                    <dx:ListEditItem Text="Efectivo" Value="3" />
                                </Items>
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxTextBox ID="txtTiempoEntrega" runat="server" CssClass="form-control" Theme="Metropolis" Caption="Tiempo de Entrega:">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-4">
                            <dx:ASPxTextBox ID="txtLugarEntrega" runat="server" CssClass="form-control" Theme="Metropolis" Caption="Lugar de Entrega:">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True" ValidationGroup="Agregar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </div>
                    </div>
                </div>
            </div>

            <dx:ASPxPopupControl ID="popupGurdarRequision" runat="server" HeaderText="Cargar Requisición" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Metropolis" AllowResize="true" AllowDragging="true" Width="500px" Modal="True" ShowPageScrollbarWhenModal="True" ClientInstanceName="popupGurdarRequision">
                <ContentStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                </ContentStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">

                        <dx:ASPxUploadControl ID="subirArchivo" runat="server" ClientInstanceName="subirArchivo" FileUploadMode="OnPageLoad" OnFileUploadComplete="subirArchivo_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
                            <ClientSideEvents FileUploadComplete="function(s, e) {
	grdRequisiciones.Refresh();
}" />
                        </dx:ASPxUploadControl>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="popupCotizaciones" runat="server" HeaderText="Abrir Requisición" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Metropolis" AllowResize="true" AllowDragging="true" Width="500px" Modal="True" ShowPageScrollbarWhenModal="True" AutoUpdatePosition="True" CloseOnEscape="True" EnableCallbackAnimation="True" RenderIFrameForPopupElements="True" ShowMaximizeButton="True">
                <ContentStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </ContentStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="grdRequisiciones" runat="server" AutoGenerateColumns="False" DataSourceID="Requisiconescreadas" EnableTheming="True" Theme="Metropolis" Width="100%" KeyFieldName="Id" PreviewFieldName="Id" ClientInstanceName="grdRequisiciones">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Folio" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Titulo" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Cliente" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Contacto" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="7">
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="btnEditar" runat="server" CssClass="btn btn-primary" OnClick="btnEditar_Click" Text="Editar" Theme="Metropolis">
                                            <Image Url="~/Fonts/glyphicons-416-disk-open.png">
                                            </Image>
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="8">
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="btnNuevaRevision" runat="server" CssClass="btn btn-success" OnClick="btnNuevaRevision_Click" Text="Nueva Revisión">
                                            <Image Url="~/Fonts/glyphicons-512-copy.png">
                                            </Image>
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Cargar Requisicion" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <DataItemTemplate>
                                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cargar Requisición">
                                            <ClientSideEvents Click="function(s, e) {
	popupGurdarRequision.Show();
}" />
                                        </dx:ASPxHyperLink>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Requisición" FieldName="Requisicion" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <PropertiesHyperLinkEdit Target="_blank" Text="Requisición">
                                    </PropertiesHyperLinkEdit>
                                </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="9">
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="btnNuvoRequisicion" runat="server" CssClass="btn btn-warning" OnClick="OnConfirm" Text="Nueva Copia" Theme="Metropolis">
                                            <ClientSideEvents Click="function(s, e) {
Confirm();
}" />
                                            <Image Url="~/Fonts/glyphicons-456-kiosk-light.png">
                                            </Image>
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                            	<dx:GridViewDataTextColumn Caption="Letra" FieldName="Letra" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn Caption="Numero" FieldName="Numero" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
								</dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                            <SettingsSearchPanel Visible="True" />
                            <Styles>
                                <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                </Header>
                                <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                                </Cell>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="Requisiconescreadas" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Cotizaciones_Consultar_Todas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="popupCotizacion" runat="server" HeaderText="Cotización" Maximized="True" Theme="Metropolis" Width="1000px" RenderIFrameForPopupElements="True" ScrollBars="Auto" ShowMaximizeButton="True" ShowPageScrollbarWhenModal="True">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
						<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" ZoomMode="PageWidth">
						</rsweb:ReportViewer>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
