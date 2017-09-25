<%@ Page Title="Productos" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="productosweb.aspx.cs" Inherits="MusebeWEBFinal.productosweb" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="Datos" EnableTheming="True" Theme="Glass" Width="100%">
		<PagerSettings ShowNumericButtons="False"></PagerSettings>
		<ItemTemplate>

			<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' Visible="False" />
			<br />
			<asp:Label ID="UuidLabel" runat="server" Text='<%# Eval("Uuid") %>' Visible="False" />
			<br />
			<b class="">Producto</b>:
          <%--  <asp:Label ID="ProductoLabel" runat="server" Text='<%# Eval("Producto") %>' />
			<br />--%>
			<!--<h1><b>Descripcion</b>:</h1>-->
            <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
			<br />
			<%--<b>NombreCorto</b>:
            <asp:Label ID="NombreCortoLabel" runat="server" Text='<%# Eval("NombreCorto") %>' />
			<br />--%>
			<b>Clave</b>:
            <asp:Label ID="ClaveLabel" runat="server" Text='<%# Eval("Clave") %>' />
			</br>
			<b>Precio: </b>
            <%# "$ " + String.Format("{0:C2}", Convert.ToString(Eval("PrecioPieza")) ) %>
			<%--<b>PrecioPaquete</b>:
            <%# String.Format("{0:C2}", Convert.ToString(Eval("PrecioPaquete")) ) %>
			<b>PrecioCajaBulto</b>:
            <%# String.Format("{0:C2}", Convert.ToString(Eval("PrecioCajaBulto")) ) %>--%>
			<dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Imagen") %>'>
			</dx:ASPxBinaryImage>
			<dx:ASPxButton ID="btnComprar" Text="detalle" runat="server" CssClass="btn btn-danger" PostBackUrl='<%# "detail.aspx?Art="+Eval("Uuid") %>'></dx:ASPxButton>
		</ItemTemplate>
		<LoadingPanelStyle HorizontalAlign="Center">
		</LoadingPanelStyle>
	</dx:ASPxDataView>
	<asp:SqlDataSource ID="Datos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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


