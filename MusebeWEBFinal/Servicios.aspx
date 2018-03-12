<%@ Page Title="Multiservicios Bear Catalogo de servicios" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="MusebeWEBFinal.Servicios" %>

<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">

		<ContentTemplate>
			<asp:LinkButton ID="lnkEditar" runat="server" OnClick="lnkEditar_Click">Editar</asp:LinkButton>
			<div class="container">
				<div class="jumbotron" runat="server" id="anuncios" style="height:auto">
				</div>
			</div>
			<dx:ASPxPopupControl ID="popupServicios" runat="server" ClientInstanceName="popupServicios" CloseOnEscape="True" Maximized="True" Modal="True" Width="100%" HeaderText="Catalogo de Servicios" Theme="Aqua">
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxGridView ID="grdServicios" runat="server" AutoGenerateColumns="False" DataSourceID="ServiciosDatos" EnableTheming="True" KeyFieldName="Id" Theme="Aqua" Width="100%" OnRowDeleting="grdServicios_RowDeleting" ClientInstanceName="grdServicios">
							<Columns>
								<dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
								</dx:GridViewCommandColumn>
								<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
									<EditFormSettings Visible="False" />
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Servicio" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nombre del servicio">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Foto" Visible="False">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="6">
									<EditFormSettings Visible="False" />
									<DataItemTemplate>
										<asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkDetalle_Click">Cargar Foto</asp:LinkButton>
									</DataItemTemplate>
									<CellStyle Wrap="True">
									</CellStyle>
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataBinaryImageColumn FieldName="FotoBinaria" ShowInCustomizationForm="True" VisibleIndex="5" Width="20%" Caption="Foto">
									<PropertiesBinaryImage ImageAlign="Middle" ImageHeight="20%" ImageWidth="20%" ImageSizeMode="FitProportional" IsPng="True">
									</PropertiesBinaryImage>
									<EditFormSettings Visible="False" />
								</dx:GridViewDataBinaryImageColumn>
								<dx:GridViewDataMemoColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Descripciòn corta">
									<PropertiesMemoEdit Rows="10">
									</PropertiesMemoEdit>
								</dx:GridViewDataMemoColumn>
								<dx:GridViewDataTextColumn Caption="Detalles del servicio" ShowInCustomizationForm="True" VisibleIndex="7">
									<EditFormSettings Visible="False" />
									<DataItemTemplate>
										<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Cargar detalle</asp:LinkButton>
									</DataItemTemplate>
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn Caption="Galeria fotografica" ShowInCustomizationForm="True" VisibleIndex="8">
									<EditFormSettings Visible="False" />
									<DataItemTemplate>
										<asp:LinkButton ID="lnkCargarGaleria" runat="server" OnClick="lnkCargarGaleria_Click">Cargar Galeria</asp:LinkButton>
									</DataItemTemplate>
								</dx:GridViewDataTextColumn>
							</Columns>
							<SettingsBehavior AllowFixedGroups="True" AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
							<Settings ShowFilterRow="True" ShowGroupPanel="True" />
							<SettingsSearchPanel Visible="True" />
							<Styles>
								<Header HorizontalAlign="Center" VerticalAlign="Middle">
								</Header>
								<Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
								</Cell>
							</Styles>
						</dx:ASPxGridView>
						<dx:ASPxPopupControl ID="popupFotos" runat="server" AllowDragging="True" CloseOnEscape="True" Modal="True" PopupElementID="popupFoto" Theme="Aqua" HeaderText="" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
							<ContentCollection>
								<dx:PopupControlContentControl runat="server">
									<dx:ASPxUploadControl ID="popupControlSubida" runat="server" FileUploadMode="OnPageLoad" OnFileUploadComplete="popupControlSubida_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="Glass" UploadMode="Auto" Width="280px">
										<ClientSideEvents FileUploadComplete="function(s, e) {
}" />
										<AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
										</AdvancedModeSettings>
									</dx:ASPxUploadControl>
								</dx:PopupControlContentControl>
							</ContentCollection>
						</dx:ASPxPopupControl>
						<asp:SqlDataSource ID="ServiciosDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" DeleteCommand="Servicios_Eliminar" DeleteCommandType="StoredProcedure" InsertCommand="Servicios_insertar" InsertCommandType="StoredProcedure" SelectCommand="Servicios_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Servicios_Modificar" UpdateCommandType="StoredProcedure">
							<DeleteParameters>
								<asp:Parameter Name="Id" Type="Int32" />
							</DeleteParameters>
							<InsertParameters>
								<asp:Parameter Name="Servicio" Type="String" />
								<asp:Parameter Name="Descripcion" Type="String" />
							</InsertParameters>
							<UpdateParameters>
								<asp:Parameter Name="Id" Type="Int32" />
								<asp:Parameter Name="Servicio" Type="String" />
								<asp:Parameter Name="Descripcion" Type="String" />
							</UpdateParameters>
						</asp:SqlDataSource>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupDetalle" runat="server" AllowDragging="True" CloseOnEscape="True" HeaderText="" Maximized="True" Modal="True" PopupElementID="popupFoto" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua">
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" />
						<dx:ASPxHtmlEditor ID="htmlServicios" runat="server" Height="500px" Theme="Aqua" Width="100%">
						</dx:ASPxHtmlEditor>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupServiciosCotizacion" runat="server" ClientInstanceName="popupServiciosCotizacion" CloseOnEscape="True" HeaderText="Solicitud de Cotización" Modal="True" PopupElementID="popupServiciosCotizacion" ShowMaximizeButton="True" ShowPageScrollbarWhenModal="True" ShowShadow="False" Theme="Glass">
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxComboBox ID="cboServicios" runat="server" Caption="Seleccione el Servicio" DataSourceID="servicioslistado" TextField="Servicio" ValueField="Id">
						</dx:ASPxComboBox>
						<asp:SqlDataSource ID="servicioslistado" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Servicios_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
						<dx:ASPxTextBox ID="Personas" runat="server" Caption="Para cuantas Personas" HorizontalAlign="Center" Width="170px">
						</dx:ASPxTextBox>
						<br />
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
			<dx:ASPxPopupControl ID="popupDetalleDescripcion" runat="server" AllowDragging="True" CloseOnEscape="True" HeaderText="" Maximized="True" Modal="True" PopupElementID="popupFoto" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" ShowPageScrollbarWhenModal="True">
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						<dx:ASPxFileManager ID="uplGaleria" runat="server" ClientInstanceName="uplGaleria" Theme="Office2003Blue" Settings-AllowedFileExtensions=".jpg,.png,.jpeg">
							<Settings RootFolder="~\" ThumbnailFolder="~\Thumb\" />
							<SettingsEditing AllowCopy="True" AllowDelete="True" AllowDownload="True" />
							<SettingsUpload>
								<AdvancedModeSettings EnableMultiSelect="True">
								</AdvancedModeSettings>
							</SettingsUpload>
						</dx:ASPxFileManager>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>

			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="exampleModalLabel" runat="server">
								<label id="titulo" runat="server"></label>
								<label id="Label1" runat="server"></label>
							</h4>
						</div>
						<div class="modal-body" runat="server" id="cuerpo">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Hacer pedido</button>
						</div>
					</div>
				</div>
			</div>


			<%--	<asp:HiddenField ID="HiddenField1" runat="server" />
			<script type="text/javascript">
				function TestCodeBehind(Idllave, Titulolabel) {
					document.getElementById("ContentPlaceHolder2_titulo").innerText = Titulolabel;
					document.getElementById("ContentPlaceHolder2_Label1").innerText = Idllave;
					document.getElementById('<%= cuerpo.ClientID %>').innerHTML = '<%= CodeBehind(this.Label1.InnerText) %>';
			return false;
				}

			</script>--%>
		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
	<style>
		body {
			background-image: url('Imagenes/PaginaWeb/Fondo.jpg');
			background-color: transparent;
			background-repeat: no-repeat;
			background-size: cover;
			margin: 0;
		}

		.topnav {
			/*overflow:hidden;*/
			background-color: deepskyblue;
			/*position:relative;*/
		}

			.topnav a {
				float: left;
				display: block;
				color: #f2f2f2;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 17px;
				z-index: 0;
				position: relative;
			}

				.topnav a:hover {
					background-color: #F0D27B;
					color: white;
					position: relative;
				}

			.topnav .icon {
				display: none;
			}

		@media screen and (max-width: 600px) {
			.topnav a:not(:first-child) {
				display: none;
			}

			.topnav a.icon {
				float: right;
				display: inherit;
			}
		}

		@media screen and () {
			.topnav.responsive {
				position: absolute;
			}

			.carousel-inner > .item > img {
				margin: 0 auto;
			}

			.topnav.responsive .icon {
				position: relative;
				right: 0;
				top: 0;
			}

			.topnav.responsive a {
				float: none;
				display: block;
				text-align: left;
			}
		}
	</style>
	<div class="topnav" id="myTopnav">
		<uc1:menupaginaweb runat="server" ID="menupaginaweb" EnableTheming="true" />
		<asp:Image ID="imglogo" ImageUrl="~/Imagenes/Logo/logo.jpg" runat="server" Width="7%" Height="7%" />
	</div>
	<script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
		function CallServerMethod(dato) {
			var s = dato.value;
			console.log(s);
			window.location.href = "servicios.aspx?code=" + s;
			
			//alert(s)
			//testDataVal(s);
		}
	</script>



</asp:Content>


