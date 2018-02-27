<%@ Page Title="Productos" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="productosweb.aspx.cs" Inherits="MusebeWEBFinal.productosweb" %>

<%@ Register Src="~/menupaginaweb.ascx" TagPrefix="uc1" TagName="menupaginaweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
	<asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
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
				<dx:ASPxMenu ID="subMenuServicios" runat="server"></dx:ASPxMenu>
				<script type="text/javascript">
					function myFunction() {
						var x = document.getElementById("myTopnav");
						if (x.className === "topnav") {
							x.className += " responsive";
						} else {
							x.className = "topnav";
						}
					}

					function CallServerMethod(dato) {
						var s = dato.value;
						window.location.href = "productosweb.aspx?code=" + s;
						//alert(s)
						//testDataVal(s);
					}

					function testDataVal(DataID) {
						PageMethods.Compra(DataID, onSuccess, onFailure);
					}

					function onSuccess(val) {
						//alert(val);
						window.location.href = val;
					}

					function onFailure() { }

					function mostrarcarrito()
					{
						popupCarrito.Show();
					}
				</script>


				<%--		<script src="scripts/jquery-2.1.4.min.js" type="text/javascript" >
					function CallServerMethod(dato) {
						console.log(dato);
						testDataVal(dato);
					
						$(document).ready(function () {
							console.log(dato);
							alert("<%= Compra("hola") %>");					
							//document.write(dato);
							//document.getElementById("Label1").innerHTML = "marro";
							
						});
					}
				</script>--%>




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
						<SettingsTableLayout ColumnCount="6" RowsPerPage="6" />
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

								<asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' ForeColor="black" />
								<br />
								<b>Clave</b>:
				<asp:Label ID="ClaveLabel" runat="server" Text='<%# Eval("Clave") %>' ForeColor="Black" />

								<a href="#">
									<dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Imagen") %>' Width="100%" Height="100%" ImageAlign="TextTop">
									</dx:ASPxBinaryImage>
								</a>
								</b>
									<br />
								<button type="button" class="btn btn-default" aria-label="Left Align" title="Detalles">
									<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default" aria-label="Left Align" title="Agregar al carrito" onclick="CallServerMethod(<%# Eval("Clave") %>)" value='<%# Eval("Clave") %>' name='<%# Eval("Clave") %>'>
									<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
								</button>
								<%--		<button type="submit" class="btn btn-default" aria-label="Left Align" title="Agregar al carrito" onserverclick="Unnamed_ServerClick" runat="server" value='<%# Eval("Clave") %>' name='<%# Eval("Clave") %>'>
									<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
								</button>--%>
								<br></br>
							</div>
						</ItemTemplate>
						<LoadingPanelStyle HorizontalAlign="Center">
						</LoadingPanelStyle>
						<PagerPanelLeftTemplate>						
							<button type="button" class="btn btn-default" aria-label="Left Align" title="Agregar al carrito" onclick="mostrarcarrito()" >
								<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							</button>
						</PagerPanelLeftTemplate>
					</dx:ASPxDataView>
					<asp:SqlDataSource ID="Datos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Visibles" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
					<asp:SqlDataSource ID="datosbusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Visibles_Busquedas_Descripcion" SelectCommandType="StoredProcedure">
						<SelectParameters>
							<asp:ControlParameter ControlID="txtBusqueda" Name="Descripcion" PropertyName="Text" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
					<asp:SqlDataSource ID="busquedaGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Productos_Consultar_Visibles_Busquedas_Grupo" SelectCommandType="StoredProcedure">
						<SelectParameters>
							<asp:QueryStringParameter Name="Uuid" QueryStringField="Guid" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
				</div>
				<!-- /.row -->
				<dx:ASPxPopupControl ID="popupCarrito" runat="server" HeaderText="Mi carrito" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" MaxHeight="600px" Width="600px" ClientInstanceName="popupCarrito" Theme="Aqua" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" CloseOnEscape="True" Height="600px" ScrollBars="Auto" ShowMaximizeButton="True" ShowPageScrollbarWhenModal="True">
		<ContentCollection>
			<dx:PopupControlContentControl runat="server">
				<div class="row">
					<div class="col-md-6">
						<asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>

					</div>
					<div class="col-md-6">
						<dx:ASPxSpinEdit ID="txtCantidad" Caption="Cantidad:" runat="server" Number="0" NullText="Cantidad" CssClass="form-control">
							<CaptionSettings HorizontalAlign="Left" VerticalAlign="Top" Position="Top" />
						</dx:ASPxSpinEdit>
						<dx:ASPxButton ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" ClientInstanceName="btnAgregar" Theme="Aqua" CssClass="btn btn-primary">
						</dx:ASPxButton>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<dx:ASPxGridView ID="grdCotizaciones" runat="server" AutoGenerateColumns="False" DataSourceID="DatosCotizciones" KeyFieldName="Id" Width="100%" EnableTheming="True" Theme="Glass">
							<Columns>
								<dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
								</dx:GridViewCommandColumn>
								<dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
									<EditFormSettings Visible="False" />
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Producto" ReadOnly="True">
									<EditFormSettings Visible="False" />
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Cantidad" Width="100px">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataBinaryImageColumn FieldName="imagen" ShowInCustomizationForm="True" VisibleIndex="5">
									<PropertiesBinaryImage ImageAlign="Middle" ImageHeight="100px" ImageWidth="100px" IsPng="True">
									</PropertiesBinaryImage>
								</dx:GridViewDataBinaryImageColumn>
							</Columns>
							<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
							<Settings ShowFilterRow="True" />
						</dx:ASPxGridView>
						<asp:SqlDataSource ID="DatosCotizciones" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="PedidosUsuarios" SelectCommandType="StoredProcedure" DeleteCommand="PedidoTemporalEliminarProducto" DeleteCommandType="StoredProcedure" UpdateCommand="PedidoTemporalActualizarProducto" UpdateCommandType="StoredProcedure">
							<DeleteParameters>
								<asp:Parameter Name="Id" Type="Int32" />
							</DeleteParameters>
							<SelectParameters>
								<asp:SessionParameter Name="Usuario" SessionField="Usuario" Type="String" />
							</SelectParameters>
							<UpdateParameters>
								<asp:Parameter Name="Id" Type="Int32" />
								<asp:Parameter Name="Cantidad" Type="Int32" />
							</UpdateParameters>
						</asp:SqlDataSource>
					</div>
				</div>


				<dx:ASPxButton ID="btnEnviarPedido" runat="server" Text="Solicitar Cotización" CssClass="btn btn-success" OnClick="btnEnviarPedido_Click" ClientInstanceName="btnEnviarPedido">
				</dx:ASPxButton>
				<dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click">
				</dx:ASPxButton>
			</dx:PopupControlContentControl>
		</ContentCollection>
	</dx:ASPxPopupControl>
			</body>

		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID="popupCarrito" />
		</Triggers>
	</asp:UpdatePanel>
	
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
</asp:Content>


