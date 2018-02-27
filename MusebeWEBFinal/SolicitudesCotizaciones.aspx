<%@ Page Title="Solicitudes de Cotización" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="SolicitudesCotizaciones.aspx.cs" Inherits="MusebeWEBFinal.SolicitudesCotizaciones" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<dx:ASPxPageControl ID="tabSolicitudes" runat="server" ActiveTabIndex="0" Width="100%">
		<TabPages>
			<dx:TabPage Text="No Atendidas">
				<ContentCollection>
					<dx:ContentControl runat="server">
						<dx:ASPxGridView ID="grdCotizacionesNoAtendidas" runat="server" AutoGenerateColumns="False" DataSourceID="SolicitudesCotizacion" EnableTheming="True" KeyFieldName="IdPedido" Theme="Aqua" Width="100%">
							<Columns>
								<dx:GridViewDataTextColumn FieldName="IdPedido" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataDateColumn FieldName="FechaPedido" ShowInCustomizationForm="True" VisibleIndex="2">
								</dx:GridViewDataDateColumn>
								<dx:GridViewDataTextColumn FieldName="Usuario" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="RazonSocial" ShowInCustomizationForm="True" VisibleIndex="4">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0">
									<DataItemTemplate>
										<asp:LinkButton ID="lnkVer" runat="server" OnClick="lnkVer_Click">Abrir</asp:LinkButton>
									</DataItemTemplate>
								</dx:GridViewDataTextColumn>
							</Columns>
							<SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
						</dx:ASPxGridView>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
			<dx:TabPage Text="Atendidas">
				<ContentCollection>
					<dx:ContentControl runat="server">
						<dx:ASPxGridView ID="grdCotizaciones0" runat="server" AutoGenerateColumns="False" DataSourceID="SolicitudesCotizacion" EnableTheming="True" Theme="Aqua" Width="100%">
							<Columns>
								<dx:GridViewDataTextColumn FieldName="IdPedido" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataDateColumn FieldName="FechaPedido" ShowInCustomizationForm="True" VisibleIndex="2">
								</dx:GridViewDataDateColumn>
								<dx:GridViewDataTextColumn FieldName="Usuario" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="RazonSocial" ShowInCustomizationForm="True" VisibleIndex="4">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0">
								</dx:GridViewDataTextColumn>
							</Columns>
						</dx:ASPxGridView>
					</dx:ContentControl>
				</ContentCollection>
			</dx:TabPage>
		</TabPages>
	</dx:ASPxPageControl>
	<br />
	<asp:SqlDataSource ID="SolicitudesCotizacion" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="PedidosTodos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	<dx:ASPxPopupControl ID="popupDetalleCotizacion" runat="server" HeaderText="Detalle de Pedido" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Aqua" Width="700px">
		<ContentCollection>
<dx:PopupControlContentControl runat="server">
	<dx:ASPxGridView ID="grdCotizacionesDetalle" runat="server" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Id" OnAfterPerformCallback="grdCotizacionesDetalle_AfterPerformCallback" Theme="Aqua" Width="100%">
		<Columns>
<dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Visible="False">
	<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Clave" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
			</dx:GridViewDataTextColumn>
		<dx:GridViewDataBinaryImageColumn FieldName="Imagen" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
									<EditFormSettings Visible="False" />
								</dx:GridViewDataBinaryImageColumn>
		</Columns>
		<Styles>
			<Header HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
			</Header>
		</Styles>
	</dx:ASPxGridView>
	<dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Generar Cotización" Theme="Aqua">
	</dx:ASPxButton>
			</dx:PopupControlContentControl>
</ContentCollection>
	</dx:ASPxPopupControl>
</asp:Content>
