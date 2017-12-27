<%@ Page Title="Multiservicios BEAR" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MusebeWEBFinal.scripts.Index" %>

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
			background-repeat:no-repeat;
			background-size:cover;
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
	<asp:LinkButton ID="btnEditarGaleria" runat="server" CssClass="btn btn-danger" OnClick="btnEditarGaleria_Click">Editar Galeria</asp:LinkButton>
	<asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-success" OnClick="btnEditar_Click">Editar Contenido Noticias</asp:LinkButton>
	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
		Visita nuestras video Galerias</button>
	<div class="collapse" id="collapseExample">
		<div class="well">
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Video 1
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<img class="galleryImg1" src="your image src here" />
							<video width="320" height="240" controls>
								<source src="Videos/movie.ogg" type="video/ogg">
								<source src="Videos/movie.mp4" type="video/mp4">
								<object data="movie.mp4" width="320" height="240">
									<embed width="320" height="240" src="movie.swf">
								</object>
							</video>
							<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Video 2
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<img class="galleryImg2" src="your image src here" />
							<video width="320" height="240" controls>
								<source src="Videos/movie.ogg" type="video/ogg">
								<source src="Videos/movie.mp4" type="video/mp4">
								<object data="movie.mp4" width="320" height="240">
									<embed width="320" height="240" src="movie.swf">
								</object>
							</video>
							<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Video 3
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							<img class="galleryImg3" src="your image src here" />
							<video width="320" height="240" controls>
								<source src="Videos/movie.ogg" type="video/ogg">
								<source src="Videos/movie.mp4" type="video/mp4">
								<object data="movie.mp4" width="320" height="240">
									<embed width="320" height="240" src="movie.swf">
								</object>
							</video>
							<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<dx:ASPxNewsControl ID="news" runat="server" Width="100%" DataSourceID="Datos" HeaderTextField="HeaderField" NameField="NameField" NavigateUrlField="NavigateUrl" TextField="TextField"></dx:ASPxNewsControl>
	<asp:SqlDataSource ID="Datos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="News_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	<dx:ASPxPopupControl ID="popupEditarNoticias" runat="server" AllowDragging="True" CloseOnEscape="True" HeaderText="Editor de contenido" Maximized="True" Modal="True" PopupElementID="popupEdicion" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" Theme="Office2010Blue" Width="100%">

		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<dx:ASPxGridView ID="grdNews" runat="server" AutoGenerateColumns="False" Caption="NOTICIAS" DataSourceID="Noticias" EnableTheming="True" KeyFieldName="Id" Theme="Glass">
					<Columns>
						<dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
						</dx:GridViewCommandColumn>
						<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="HeaderField" ShowInCustomizationForm="True" VisibleIndex="2">
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="NameField" ShowInCustomizationForm="True" VisibleIndex="3">
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="NavigateUrl" ShowInCustomizationForm="True" VisibleIndex="4">
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="TextField" ShowInCustomizationForm="True" VisibleIndex="5">
						</dx:GridViewDataTextColumn>
					</Columns>
					<Settings ShowFilterRow="True" />
					<SettingsSearchPanel Visible="True" />
				</dx:ASPxGridView>
				<asp:SqlDataSource ID="Noticias" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" DeleteCommand="News_Eliminar" DeleteCommandType="StoredProcedure" InsertCommand="News_Insertar" InsertCommandType="StoredProcedure" SelectCommand="News_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="News_Modificar" UpdateCommandType="StoredProcedure">
					<DeleteParameters>
						<asp:Parameter Name="Id" Type="Int32" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="HeaderField" Type="String" />
						<asp:Parameter Name="NameField" Type="String" />
						<asp:Parameter Name="NavigateUrl" Type="String" />
						<asp:Parameter Name="TextField" Type="String" />
					</InsertParameters>
					<UpdateParameters>
						<asp:Parameter Name="Id" Type="Int32" />
						<asp:Parameter Name="HeaderField" Type="String" />
						<asp:Parameter Name="NameField" Type="String" />
						<asp:Parameter Name="NavigateUrl" Type="String" />
						<asp:Parameter Name="TextField" Type="String" />
					</UpdateParameters>
				</asp:SqlDataSource>
			</dx:PopupControlContentControl>
		</ContentCollection>

	</dx:ASPxPopupControl>


	<dx:ASPxPopupControl ID="popupEditarGaleria" runat="server" AllowDragging="True" CloseOnEscape="True" HeaderText="Editor de contenido" Maximized="True" Modal="True" PopupElementID="popupEdicion" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" Theme="Office2010Blue" Width="100%">
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">

			</dx:PopupControlContentControl>
		</ContentCollection>

	</dx:ASPxPopupControl>

	<script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}

		//$('img.galleryImg').each(function () {

		//	//$(this).next().get(0).stop();
		//});

		function video() {
			var vid = document.getElementById("galleryImg3");
			vid.autoplay = false;
			vid.load();
		}
	</script>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
