﻿<%@ Page Title="¿Quienes somos?" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="somos.aspx.cs" Inherits="MusebeWEBFinal.somos" %>
<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:LinkButton ID="lnkEditar" runat="server" OnClick="lnkEditar_Click">Editar Contenido</asp:LinkButton>
	<div class='jumbotron' id="somostexto" runat="server" style="background-color:transparent">
	</div>

	<dx:ASPxPopupControl ID="popupSomos" runat="server" CloseOnEscape="True" HeaderText="Edición" Height="700px" Maximized="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" Theme="PlasticBlue" Width="700px" BackColor="Transparent">
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<asp:LinkButton ID="lnkPublicar" runat="server" OnClick="lnkPublicar_Click">Publicar</asp:LinkButton>
				<dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" EnableTheming="True" Theme="Office2003Blue" Width="100%" BackColor="Transparent">
				</dx:ASPxHtmlEditor>
			</dx:PopupControlContentControl>
		</ContentCollection>

	</dx:ASPxPopupControl>
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
					background-color: #F0D27B;
					color: white;
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
			<asp:Image ID="imglogo" ImageUrl="~/Imagenes/Logo/logo.jpg" runat="server" Width="7%" Height="7%" /><uc1:menupaginaweb runat="server" id="menupaginaweb" />
		</div>
		<div class="pull-right">
			<p style="color: black" class="d-inline pull-right">
				&#9742;<a style="color:black" href="tel:+529381180887">9381180887</a> 
			</p>
			<br />
			<p style="color: black" class="d-inline pull-right">
				&#9993;<a style="color:black" href="mailto:ventas@musebe.com.mx" title="Envienos sus dudas por correo electronico">ventas@musebe.com.mx</a>
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



