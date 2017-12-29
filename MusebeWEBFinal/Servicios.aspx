<%@ Page Title="Multiservicios Bear Catalogo de servicios" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="MusebeWEBFinal.Servicios" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:LinkButton ID="lnkEditar" runat="server" OnClick="lnkEditar_Click">Editar</asp:LinkButton>
	<div class="container">
		<div class="jumbotron" runat="server" id="anuncios">
		</div>
	</div>	
	<dx:ASPxPopupControl ID="popupServicios" runat="server" ClientInstanceName="popupServicios" CloseOnEscape="True" Maximized="True" Modal="True" Width="100%">
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<dx:ASPxGridView ID="grdServicios" runat="server" AutoGenerateColumns="False" DataSourceID="ServiciosDatos" EnableTheming="True" KeyFieldName="Id" Theme="Office2003Silver" Width="100%" OnRowDeleting="grdServicios_RowDeleting" ClientInstanceName="grdServicios">
					<Columns>
						<dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
						</dx:GridViewCommandColumn>
						<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="Servicio" ShowInCustomizationForm="True" VisibleIndex="2">
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Foto" Visible="False">
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="6">
							<EditFormSettings Visible="False" />
							<DataItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkDetalle_Click">Cargar Foto</asp:LinkButton>
							</DataItemTemplate>
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataBinaryImageColumn FieldName="FotoBinaria" ShowInCustomizationForm="True" VisibleIndex="5" Width="20%" Caption="Foto">
							<PropertiesBinaryImage ImageAlign="Middle" ImageHeight="20%" ImageWidth="20%" ImageSizeMode="FitProportional" IsPng="True">
							</PropertiesBinaryImage>
							<EditFormSettings Visible="False" />
						</dx:GridViewDataBinaryImageColumn>
						<dx:GridViewDataMemoColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3">
						</dx:GridViewDataMemoColumn>
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
				<dx:ASPxPopupControl ID="popupFotos" runat="server" AllowDragging="True" CloseOnEscape="True" Modal="True" PopupElementID="popupFoto" Theme="Glass">
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
			overflow: hidden;
			background-color: deepskyblue;
		}

			.topnav a {
				float: left;
				display: block;
				color: #f2f2f2;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 17px;
			}

				.topnav a:hover {
					background-color: #ddd;
					color: black;
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
				display: block;
			}
		}

		@media screen and (max-width: 600px) {
			.topnav.responsive {
				position: relative;
			}

				.topnav.responsive .icon {
					position: absolute;
					right: 0;
					top: 0;
				}

				.topnav.responsive a {
					float: none;
					display: block;
					text-align: left;
				}
		}

		@import url('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css');

		.carousel-inner > .item {
			height: 100vh;
		}

			.carousel-inner > .item > img {
				position: absolute;
				top: 50%;
				left: 50%;
				-webkit-transform: translate(-50%, -50%);
				-ms-transform: translate(-50%, -50%);
				transform: translate(-50%, -50%);
				max-height: 800px;
				width: auto;
			}

		.carousel-control.left,
		.carousel-control.right {
			background-image: none;
		}

		img {
			border-radius: 50%;
		}
	</style>

	<body>
		<div class="topnav" id="myTopnav">
			<a href="Index.aspx">Home</a><a href="Servicios.aspx">Servicios</a> <a href="ProductosWeb.aspx">Productos</a> <a href="Somos.aspx">&iquest;Quienes Somos?</a> <a href="Contacto.aspx">Contactanos</a> <a href="Login.aspx">Login</a><a href="Register.aspx">Registrarme</a> <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		<div class="pull-right">
			<p style="color: black" class="d-inline pull-right">
				&#9742;9381180887 
			</p>
			<br />
			<p style="color: black" class="d-inline pull-right">
				&#9993;ventas@musebe.com.mx
			</p>
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
		</script>

	</body>
</asp:Content>


