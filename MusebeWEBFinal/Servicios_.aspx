<%@ Page Title="Multiservicios Bear Catalogo de servicios" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Servicios_.aspx.cs" Inherits="MusebeWEBFinal.Servicios" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
		<asp:LinkButton ID="lnkEditar" runat="server" OnClick="lnkEditar_Click">Editar</asp:LinkButton>
	<div class="container" style="margin-top:0px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="Imagenes/HomeGaleria/taquizas.jpg" alt="taquizas" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Taquizas</h3>
						<a href="#" class="btn btn-danger">Ver Mas...</a>

					</div>
				</div>

				<div class="item">
					<img src="Imagenes/HomeGaleria/CoffeBreak.jpg" alt="Coffe Break" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Coffe Break</h3>
						<a href="#" class="btn btn-danger">Ver Mas...</a>

					</div>
				</div>

				<div class="item">
					<img src="Imagenes/HomeGaleria/Bocadillos.jpg" alt="Bocadillos" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Bocadillos</h3>
						<a href="#" class="btn btn-danger">Ver Mas...</a>

					</div>
				</div>
				<div class="item">
					<img src="Imagenes/HomeGaleria/banquetes.jpg" alt="Banquetes" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Banquetes</h3>
						<a href="#" class="btn btn-danger">Ver Mas...</a>

					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
<dx:ASPxPopupControl ID="popupServicios" runat="server" ClientInstanceName="popupServicios" CloseOnEscape="True" Maximized="True" Modal="True" Width="100%">
	<ContentCollection>
<dx:PopupControlContentControl runat="server">
	<dx:ASPxGridView ID="grdServicios" runat="server" AutoGenerateColumns="False" DataSourceID="ServiciosDatos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
				<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Servicio" ShowInCustomizationForm="True" VisibleIndex="2">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Foto" ShowInCustomizationForm="True" VisibleIndex="4">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="5">
				<DataItemTemplate>
					<asp:LinkButton ID="lnkDetalle" runat="server" OnClick="lnkDetalle_Click">Detalle</asp:LinkButton>
				</DataItemTemplate>
			</dx:GridViewDataTextColumn>
		</Columns>
		<Settings ShowFilterRow="True" ShowGroupPanel="True" />
		<SettingsSearchPanel Visible="True" />
	</dx:ASPxGridView>
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
			margin: 0;
		}

		.topnav {
			overflow: hidden;
			background-color: #333;
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
	</style>

	<body>
		<div class="topnav" id="myTopnav">
			<a href="Index.aspx">Home</a><a href="Servicios.aspx">Servicios</a> <a href="ProductosWeb.aspx">Productos</a> <a href="Somos.aspx">&iquest;Quienes Somos?</a> <a href="Contacto.aspx">Contactanos</a> <a href="Login.aspx">Login</a> <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		<div class="pull-right">
			<p style="color: white" class="d-inline pull-right">
				&#9742;4499996662
			</p>
			<br />
			<p style="color: white" class="d-inline pull-right">
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


