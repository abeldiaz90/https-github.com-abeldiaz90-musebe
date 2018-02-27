<%@ Page Title="Registro" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MusebeWEBFinal.Register" %>

<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
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
	</script>

			<div class="panel panel-default">
				<div class="panel-heading">Datos Personales</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtNombre" runat="server" CssClass="form-control col-xs-3" Caption="Primer Nombre:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtSegundoNombre" runat="server" CssClass="form-control col-xs-3" Caption="Segundo Nombre:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtApellidoPaterno" runat="server" CssClass="form-control col-xs-3" Caption="Apellido Paterno:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings SetFocusOnError="True" ValidationGroup="Registro" ErrorTextPosition="Bottom">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtApellidoMaterno" runat="server" CssClass="form-control col-xs-3" Caption="Apellido Materno:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
							</dx:ASPxTextBox>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtCorreo" runat="server" CssClass="form-control col-xs-3" Caption="E-mail:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtTelefono" runat="server" CssClass="form-control col-xs-3" Caption="Telefono de contacto:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
						</div>
						<div class="col-md-3">
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtUsuario" runat="server" CssClass="form-control col-xs-3" Caption="Usuario:">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtPassword" runat="server" CssClass="form-control col-xs-3" Caption="Password:" Password="true">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
							<dx:ASPxTextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control col-xs-3" Caption="Confirme Password:" Password="true">
								<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
								<ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="Registro">
									<RequiredField IsRequired="True" />
								</ValidationSettings>
							</dx:ASPxTextBox>
						</div>
						<div class="col-md-3">
						</div>
					</div>
				</div>
			</div>


			</div>
			<dx:ASPxButton ID="btnGuardar" runat="server" Text="Registrarme" ValidationGroup="Registro" CssClass="btn btn-primary" OnClick="btnGuardar_Click"></dx:ASPxButton>
			<asp:LinkButton ID="lnkCancelar" runat="server" CssClass="btn btn-default" OnClick="lnkCancelar_Click">Cancelar</asp:LinkButton>

			</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
