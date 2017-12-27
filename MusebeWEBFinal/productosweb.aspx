<%@ Page Title="Productos" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="productosweb.aspx.cs" Inherits="MusebeWEBFinal.productosweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<style>
				@import url('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css');

				body {
					background-image: url('Imagenes/PaginaWeb/Fondo.jpg');
					background-color: transparent;
					background-repeat: no-repeat;
					background-size: cover;
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
				<dx:ASPxMenu ID="subMenuServicios" runat="server"></dx:ASPxMenu>


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




				<div class="row" style="align-content: flex-start">
					<div class="col-lg-12">
						<div class="input-group">
							<asp:TextBox ID="txtBusqueda" runat="server" placeholder="Busque sus productos aqui" CssClass="form-control"></asp:TextBox>
							<asp:AutoCompleteExtender ID="txtBusqueda_AutoCompleteExtender" runat="server" TargetControlID="txtBusqueda" Enabled="True" MinimumPrefixLength="1"
								EnableCaching="true" CompletionSetCount="1"
								DelimiterCharacters="" ShowOnlyCurrentWordInCompletionListItem="true"
								ServiceMethod="BusquedaItemsWeb" ServicePath="~/ServicioWeb.asmx">
							</asp:AutoCompleteExtender>
							<span class="input-group-btn">
								<dx:ASPxButton ID="btnBuscar" CssClass="btn btn-success" runat="server" Text="Buscar" OnClick="btnBuscar_Click"></dx:ASPxButton>
							</span>

						</div>
					</div>
					<dx:ASPxDataView ID="grdProductos" runat="server" DataSourceID="Datos" Width="100%" BackColor="Transparent">
						<SettingsTableLayout ColumnCount="4" RowsPerPage="4" />
						<PagerSettings ShowNumericButtons="False"></PagerSettings>
						<ItemTemplate>
							<div class="text-center">
								<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' Visible="False" />
								<br />
								<asp:Label ID="UuidLabel" runat="server" Text='<%# Eval("Uuid") %>' Visible="False" />
								<br />
								<b class="">
									<br />
									Producto</b>: <%--  <asp:Label ID="ProductoLabel" runat="server" Text='<%# Eval("Producto") %>' />
			<br />--%>

								<asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' ForeColor="White" />
								<br />
								<b>Clave</b>:
				<asp:Label ID="ClaveLabel" runat="server" Text='<%# Eval("Clave") %>' />
								<br />
								<b style="color: white">Precio: <%# "$ " + String.Format("{0:C2}", Convert.ToString(Eval("PrecioPieza")) ) %></b><br />



								<a href="#">
									<dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Imagen") %>' Width="100%" Height="100%" ImageAlign="TextTop">
									</dx:ASPxBinaryImage>
								</a>
								</b>
									<br />
								<button type="button" class="btn btn-default" aria-label="Left Align" title="Detalles">
									<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default" aria-label="Left Align" title="Agregar al carrito">
									<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
								</button>
								</br>
							</div>
						</ItemTemplate>
						<LoadingPanelStyle HorizontalAlign="Center">
						</LoadingPanelStyle>
					</dx:ASPxDataView>
					<asp:SqlDataSource ID="Datos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Visibles" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
					<asp:SqlDataSource ID="datosbusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Visibles_Busquedas_Descripcion" SelectCommandType="StoredProcedure">
						<SelectParameters>
							<asp:ControlParameter ControlID="txtBusqueda" Name="Descripcion" PropertyName="Text" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
				</div>
				<!-- /.row -->



			</body>

		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
</asp:Content>


