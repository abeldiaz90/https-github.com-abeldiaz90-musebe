<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="MusebeWEBFinal.Contacto" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	    <div class="col-xs-12">
        <div class="center-block">
            <dx:ASPxTextBox ID="txtCorreo" runat="server" Caption="Correo Electrónico:" Theme="Glass" Width="170px" NullText="Correo Electronico">
                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                <ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar">
                    <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
            <dx:ASPxMemo ID="txtContacto" runat="server" Height="71px" Width="100%" Caption="Solicite Información" HorizontalAlign="Center" NullText="Escribanos sus dudas queremos ayudarle" Theme="Glass">
                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                <ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxMemo>
            <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" Theme="Glass" ValidationGroup="Enviar">
            </dx:ASPxButton>
            <!-- Contenido -->
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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



