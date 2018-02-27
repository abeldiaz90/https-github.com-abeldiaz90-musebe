<%@ Page Title="Multiservicios Bear Contacto" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="MusebeWEBFinal.Contacto" %>
<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
		<div class="panel panel-primary">
				<div class="panel-heading">Registro</div>
				<div class="panel-body">

			
		<div class="form-group">
			<label for="txtCorreo">Email:</label>
			<dx:ASPxTextBox ID="txtCorreo" runat="server" Theme="Glass" NullText="jane.doe@example.com" CssClass="form-control" HorizontalAlign="Center" Width="100%">
				<CaptionSettings HorizontalAlign="Left" Position="Top" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar" ErrorTextPosition="Bottom">
					<RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
		</div>
		<div class="form-group">
			<label for="txtTelefono">Telefono:</label>
			<dx:ASPxTextBox ID="txtTelefono" runat="server" Theme="Glass" NullText="Telefono de contacto:" ClientInstanceName="txtTelefono" CssClass="form-control" HorizontalAlign="Center" Width="100%">
				<MaskSettings Mask="(999) 000-0000" />
				<CaptionSettings HorizontalAlign="Left" Position="Top" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar" ErrorTextPosition="Bottom">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
		</div>
		<div class="form-group">
			<label for="txtbody">Asunto:</label>
			<dx:ASPxMemo ID="txtbody" runat="server" Height="71px" Width="100%"  HorizontalAlign="Center" NullText="Contactenos por este medio permitanos ayudarle" Theme="Glass" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar" ErrorTextPosition="Bottom">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxMemo>
		</div>
					</div></div>
		<asp:LinkButton ID="lnkEnviar" runat="server" OnClick="lnkEnviar_Click" CssClass="btn btn-default">Enviar</asp:LinkButton>		

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
						z-index:0;
						position:relative;
					}

						.topnav a:hover {
							background-color: #F0D27B;
							color: white;
							position:relative;
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
						display:inherit;
					}
				}

				@media screen and () {
					.topnav.responsive {
						position:absolute;
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

	
</asp:Content>



