<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Principal.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MusebeWEBFinal.Products" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="row">
				<div class="col-md-12">
					<dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary navbar-btn" OnClick="btnNuevo_Click"></dx:ASPxButton>
					<dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-default navbar-btn" OnClick="btnBuscar_Click" UseSubmitBehavior="true" CausesValidation="false"></dx:ASPxButton>
				</div>
			</div>

			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Datos del Producto
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<asp:Panel ID="Panel1" runat="server" Enabled="false">
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtClave" runat="server" Caption="Clave:" NullText="Ingrese la clave" CaptionSettings-Position="Top" CssClass="form-control" Width="100%">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<asp:HiddenField ID="Id" runat="server" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtDescripcionCorta" runat="server" Caption="Descripcion Corta" NullText="Descripcion Corta" CaptionSettings-Position="Top" Width="100%" CssClass="form-control">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-9">
										<dx:ASPxMemo ID="txtDescripcionLarga" runat="server" Caption="Descripcion Larga" NullText="Descripcion Larga" CaptionSettings-Position="Top" Width="100%" CssClass="form-control">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxMemo>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxComboBox ID="cboGrupo" runat="server" Caption="Grupo:" NullText="Seleccione Grupo" CssClass="form-control" CaptionSettings-Position="Top" Width="100%" DataSourceID="Grupos" TextField="Grupo" ValueField="Id">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxComboBox>
										<asp:SqlDataSource ID="Grupos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Grupos_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
									</div>
									<div class="col-md-3">
										<dx:ASPxComboBox ID="cboMarca" runat="server" Caption="Marca:" NullText="Seleccione Marca" CssClass="form-control" CaptionSettings-Position="Top" Width="100%" DataSourceID="Marca" TextField="Marca" ValueField="Id">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxComboBox>
										<asp:SqlDataSource ID="Marca" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Marcas_Consultar_activas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
									</div>
									<div class="col-md-3">
										<dx:ASPxComboBox ID="cboMaterial" runat="server" Caption="Material:" NullText="Seleccione el Material" CssClass="form-control" CaptionSettings-Position="Top" Width="100%" DataSourceID="Materiales" TextField="Material" ValueField="Id">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxComboBox>
										<asp:SqlDataSource ID="Materiales" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Materiales_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
									</div>
									<div class="col-md-3">
										<dx:ASPxComboBox ID="cboUnidad" runat="server" Caption="Unidad de Medida:" NullText="Seleccione unidad" CssClass="form-control" CaptionSettings-Position="Top" DataSourceID="Unidad" TextField="Unidad" ValueField="Id" Width="100%">
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxComboBox>
										<asp:SqlDataSource ID="Unidad" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Unidades_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtDimension" runat="server" Caption="Dimension" CssClass="form-control" CaptionSettings-Position="Top" NullText="Ingrese dimensiones" Width="100%">
											<CaptionSettings Position="Top" />
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPiezasPaquete" runat="server" Caption="Piezas Paquete" CssClass="form-control" CaptionSettings-Position="Top" NullText="Piezas Paquete" AutoResizeWithContainer="true" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..1000&gt;" />
											<CaptionSettings Position="Top" />
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
											<ValidationSettings CausesValidation="false" Display="Dynamic"></ValidationSettings>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPaquetesCaja" runat="server" Caption="Paquetes por Caja" CssClass="form-control" CaptionSettings-Position="Top" NullText="Paquetes Caja" AutoResizeWithContainer="true" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..1000&gt;" />
											<CaptionSettings Position="Top" />
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
											<ValidationSettings CausesValidation="false" Display="Dynamic"></ValidationSettings>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPiezasBulto" runat="server" Caption="Piezas caja bulto" CssClass="form-control" CaptionSettings-Position="Top" NullText="Piezas Bulto" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..1000&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings Display="Dynamic">
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPrecioPieza" runat="server" Caption="Precio por pieza" NullText="Ingrese Precio" CaptionSettings-Position="Top" CssClass="form-control" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPrecioPiezasPaquete" runat="server" Caption="Precio por Paquete:" NullText="Ingrese Precio" CaptionSettings-Position="Top" CssClass="form-control" AutoResizeWithContainer="true" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings Display="Dynamic">
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPrecioPaquetesCaja" runat="server" Caption="Precio por Caja:" NullText="Ingrese Precio" CaptionSettings-Position="Top" CssClass="form-control" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings Display="Dynamic">
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtPrecioPiezasCajabulto" runat="server" Caption="Piezas por caja bulto" CssClass="form-control" CaptionSettings-Position="Top" NullText="Ingrese Precio" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..1000&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings Display="Dynamic">
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtMinimo" runat="server" Caption="Minimo:" NullText="Minimo" CaptionSettings-Position="Top" CssClass="form-control" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..1000&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtMaximo" runat="server" Caption="Máximo:" NullText="Máximo" CaptionSettings-Position="Top" CssClass="form-control" AutoResizeWithContainer="true" Width="100%">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..10000&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxTextBox ID="txtCantidadInicial" runat="server" Caption="Cantidad Inicial:" NullText="Ingrese Precio" CaptionSettings-Position="Top" CssClass="form-control">
											<MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..10000&gt;" />
											<CaptionSettings Position="Top" />
											<ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar" Display="Dynamic">
												<RequiredField IsRequired="True" />
											</ValidationSettings>
											<FocusedStyle BackColor="#99CCFF">
											</FocusedStyle>
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxTextBox>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<dx:ASPxCheckBox ID="chkIva" runat="server" Text="Aplica IVA">
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxCheckBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxCheckBox ID="chkInventario" runat="server" Text="Es inventariable">
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxCheckBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxCheckBox ID="chkVisible" runat="server" Text="Visible En la Web">
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxCheckBox>
									</div>
									<div class="col-md-3">
										<dx:ASPxCheckBox ID="chkActivo" runat="server" Text="Producto Activo">
											<DisabledStyle BackColor="Silver">
											</DisabledStyle>
										</dx:ASPxCheckBox>
									</div>
								</div>
								<dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-default navbar-btn" ValidationGroup="Guardar" DisabledStyle-BackColor="WhiteSmoke" CausesValidation="true" OnClick="btnEnviar_Click">
								</dx:ASPxButton>
								<dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger navbar-btn" OnClick="btnCancelar_Click" DisabledStyle-BackColor="WhiteSmoke"></dx:ASPxButton>
								<dx:ASPxButton ID="btnFotoPrinicpal" runat="server" Text="Foto Principal" CssClass="btn btn-primary navbar-btn" OnClick="btnFotoPrinicpal_Click" DisabledStyle-BackColor="WhiteSmoke"></dx:ASPxButton>
								<dx:ASPxButton ID="btnGaleria" runat="server" Text="Galeria Fotografica" CssClass="btn btn-primary navbar-btn" OnClick="btnGaleria_Click" DisabledStyle-BackColor="WhiteSmoke"></dx:ASPxButton>
								<dx:ASPxPopupControl ID="popupConfirmacion" runat="server" HeaderText="¿ Desea guardar el Producto ?" Theme="Aqua" CloseAction="CloseButton" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ContentStyle-HorizontalAlign="Center">
									<ContentStyle HorizontalAlign="Center">
									</ContentStyle>
									<ContentCollection>
										<dx:PopupControlContentControl runat="server">
											<dx:ASPxButton ID="btnSiGuardar" runat="server" Text="Si" OnClick="btnSiGuardar_Click" Theme="Aqua">
											</dx:ASPxButton>
											<dx:ASPxButton ID="btnNoGuardar" runat="server" Text="No" OnClick="btnNoGuardar_Click" Theme="Aqua">
											</dx:ASPxButton>
										</dx:PopupControlContentControl>
									</ContentCollection>
								</dx:ASPxPopupControl>
							</asp:Panel>
						</div>
					</div>
				</div>
			</div>
			<dx:ASPxPopupControl ID="popupImagen" runat="server"
				ClientInstanceName="popupImagen" HeaderText="Seleccione la Fotografia"
				Modal="True" PopupHorizontalAlign="WindowCenter"
				PopupVerticalAlign="WindowCenter" Theme="Metropolis" Width="300px" AllowDragging="true" AllowResize="True">
				<ContentStyle HorizontalAlign="Center" VerticalAlign="Middle">
				</ContentStyle>
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxBinaryImage ID="imgBinaria" ClientInstanceName="imgBinaria" runat="server" EnableServerResize="True" ImageAlign="Middle" Value='<%# Eval("Imagen") %>' IsPng="True">
						</dx:ASPxBinaryImage>
						<dx:ASPxUploadControl ID="SubirImagen" runat="server" AutoStartUpload="True" ClientInstanceName="SubirImagen" EnableTheming="True" FileUploadMode="OnPageLoad" OnFileUploadComplete="SubirImagen_FileUploadComplete" ShowProgressPanel="True" Theme="Metropolis" UploadMode="Auto" Width="100%">
								<ClientSideEvents FileUploadComplete="function(s, e) {
alert('!La foto ha sido cambiada!')
}" />
								<TextBoxStyle HorizontalAlign="Center" VerticalAlign="Middle" />
						</dx:ASPxUploadControl>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupGaleria" runat="server" Modal="true" Maximized="true" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter">
				<ContentStyle HorizontalAlign="Center">
				</ContentStyle>
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxImageSlider ID="imageGallery" runat="server">
							<SettingsAutoGeneratedImages ImageCacheFolder="~\Thumb\" />
						</dx:ASPxImageSlider>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupCargaImagenes" runat="server" Modal="true" Maximized="true" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
				<ContentStyle HorizontalAlign="Center">
				</ContentStyle>
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxFileManager ID="ArchivosGaleriasFotos" runat="server">
							<Settings RootFolder="~\" ThumbnailFolder="~\Thumb\" />
							<SettingsEditing AllowDelete="True" AllowRename="True" />
							<SettingsUpload>
								<AdvancedModeSettings EnableMultiSelect="True">
								</AdvancedModeSettings>
							</SettingsUpload>
						</dx:ASPxFileManager>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupBusqueda" runat="server" HeaderText="Busqueda de Productos" Theme="Aqua" CloseAction="CloseButton" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ContentStyle-HorizontalAlign="Center" Maximized="True" Width="100%" ShowMaximizeButton="True" ShowPageScrollbarWhenModal="True" AllowDragging="True" ScrollBars="Auto">
				<ContentStyle HorizontalAlign="Center">
				</ContentStyle>
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxTextBox ID="txtBusquedaProducto" runat="server" Width="100%" HorizontalAlign="Center" NullText="Ingrese Clave o Descripción">
							<HelpTextStyle Wrap="True">
							</HelpTextStyle>
						</dx:ASPxTextBox>
						<dx:ASPxButton ID="btnProductoBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnProductoBuscar_Click"></dx:ASPxButton>
						<dx:ASPxGridView ID="grdResultadosBusqueda" runat="server" AutoGenerateColumns="False" DataSourceID="Resultados" EnableTheming="True" Theme="Aqua" Width="100%" KeyFieldName="Id">
							<Columns>
								<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Descripcion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataBinaryImageColumn FieldName="Imagen" ShowInCustomizationForm="True" Width="30%" PropertiesBinaryImage-ImageHeight="30%" VisibleIndex="4">
									<PropertiesBinaryImage ImageAlign="Middle" ImageSizeMode="FitProportional" ShowLoadingImage="True" IsPng="True">
									</PropertiesBinaryImage>
								</dx:GridViewDataBinaryImageColumn>
								<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0">
									<DataItemTemplate>
										<dx:ASPxButton ID="btnSeleccionarproducto" runat="server" CssClass="btn btn-primary" OnClick="btnSeleccionarproducto_Click" Text="Seleccionar" Native="True">
										</dx:ASPxButton>
									</DataItemTemplate>
								</dx:GridViewDataTextColumn>
							</Columns>
							<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
						</dx:ASPxGridView>
						<asp:SqlDataSource ID="Resultados" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_texto" SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:ControlParameter ControlID="txtBusquedaProducto" Name="texto" PropertyName="Text" Type="String" />
							</SelectParameters>
						</asp:SqlDataSource>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
		</ContentTemplate>
	</asp:UpdatePanel>
	<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
		<ProgressTemplate>
			<asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/cargando.gif" />
		</ProgressTemplate>
	</asp:UpdateProgress>
</asp:Content>
