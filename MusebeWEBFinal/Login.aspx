﻿<%@ Page Title="Multiservicios Bear Login" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MusebeWEBFinal.Login" %>
<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<style>
		body {
			background-image: url('Imagenes/PaginaWeb/Fondo.jpg');
			background-color: transparent;
			background-repeat: no-repeat;
			background-size:cover;
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
			  <asp:Image ID="Image1" ImageUrl="~/Imagenes/Logo/logo.jpg" runat="server" Width="7%" Height="7%" /><uc1:menupaginaweb runat="server" id="menupaginaweb" />
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
<%--	<div class="modal-content" style="align-content: center">
		<div class="modal-body" style="align-content: center">--%>
	<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <section id="loginForm" class="panel panel-default">
            <div class="panel-body">                
                <h2>Iniciar sesión</h2>
                <hr />
			<asp:Login ID="Login1" runat="server" CssClass="User" OnAuthenticate="Login1_Authenticate">
				<LayoutTemplate>
					<div id="loginform" class="form-horizontal" role="form">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="User Name"></asp:TextBox>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter an User Name" CssClass="error">Please enter an User Name</asp:RequiredFieldValidator>

						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<asp:TextBox runat="server" ID="Password" CssClass="form-control" placeholder="Password"
								TextMode="Password"></asp:TextBox>
						</div>
						<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter a password" CssClass="error">Please enter a password</asp:RequiredFieldValidator>



						<asp:Button ID="LoginButton" runat="server" CommandName="Login" class="btn btn-primary" ValidationGroup="Login" Text="Log in" UseSubmitBehavior="false" />
					</div>
				</LayoutTemplate>

			</asp:Login>
				</div></section></div></div>
<%--		</div>
		<div class="modal-footer">
		</div>
	</div>--%>
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
</asp:Content>
