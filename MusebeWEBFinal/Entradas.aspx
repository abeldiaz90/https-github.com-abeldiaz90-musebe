<%@ Page Title="Entradas de Almacen" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Entradas.aspx.cs" Inherits="MusebeWEBFinal.Entradas" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-header">
                <h1>Entradas al almacen
                </h1>
            </div>
            <button class="btn btn-primary" type="button">
                Folio: <span class="badge">
                    <dx:ASPxLabel ID="txtFolio" runat="server" Text=""></dx:ASPxLabel>
                </span>
            </button>
            <dx:ASPxButton ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" CssClass="btn btn-default"></dx:ASPxButton>
            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" ValidationGroup="Guardar" CssClass="btn btn-success"></dx:ASPxButton>
            <div class="panel panel-primary">
                <div class="panel-heading">Datos del Proveedor</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="cboNombre" runat="server" Caption="Origen:" Theme="Metropolis" Width="100%" CssClass="form-control">
                                <Items>
                                    <dx:ListEditItem Text="Compra o Adquisición" Value="1" />
                                    <dx:ListEditItem Text="Devolución" Value="2" />
                                    <dx:ListEditItem Text="Cortesia" Value="3" />
                                </Items>
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                                <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="cboProveedor" runat="server" Caption="Proveedor:" DataSourceID="proveedores" EnableTheming="True" TextField="Proveedor" Theme="Metropolis" ValueField="Id" Width="100%" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                                <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Proveedores_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxDateEdit ID="fechaEntrada" runat="server" Caption="Fecha de Ingreso:" Theme="Metropolis" Width="100%" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="Guardar">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                                <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxDateEdit>
                        </div>
                    </div>

                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Productos Adquiridos</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="cboProducto" runat="server" Caption="Producto:" DataSourceID="Productos" TextField="Descripcion" ValueField="Id" Width="100%" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="Productos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="select id , descripcion, iva from productos where inventariable=1"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtCantidad" runat="server" Caption="Cantidad:" Width="100%" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                </FocusedStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                              <dx:ASPxTextBox ID="txtPrecioUnitario" runat="server" Caption="Precio Unitario:" Width="100%" CssClass="form-control" HorizontalAlign="Center">
                                  <MaskSettings IncludeLiterals="DecimalSymbol" Mask="$&lt;0..99999g&gt;.&lt;00..99&gt;" />
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                                  <ValidationSettings ErrorTextPosition="Bottom">
                                      <RequiredField IsRequired="True" />
                                  </ValidationSettings>
                                  <FocusedStyle BackColor="#FFFF99" HorizontalAlign="Center" Wrap="True">
                                  </FocusedStyle>
                            </dx:ASPxTextBox>
                            <dx:ASPxButton ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <dx:ASPxGridView ID="grdProductos" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="DatosEntradaDetalle" EnableTheming="True" Theme="MetropolisBlue" Caption="Articulos Agregados">
                        <Columns>
                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="IdEntrada" ReadOnly="True" Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="3">
                                <PropertiesTextEdit>
                                    <Style HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                            </Style>
                                </PropertiesTextEdit>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                                <PropertiesTextEdit>
                                    <Style HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                            </Style>
                                </PropertiesTextEdit>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CostoUnitario" VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="IVA" FieldName="CostoIva" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Precio Con IVA" FieldName="CostoConIva" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="SubTotal" FieldName="SubTotal" VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="c2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
                        <Styles>
                            <Header Font-Bold="True" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                            </Header>
                            <Cell Font-Bold="True" Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle">
                            </Cell>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="DatosEntradaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Entrada_Consultar_Detalle" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFolio" Name="Id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">Datos de Facturación</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxTextBox ID="txtNumeroFactura" runat="server" Caption="Número de Factura:" Width="100%" CssClass="form-control">
                                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                            </dx:ASPxTextBox>
                        </div>
                        <div class="col-md-3">
                            <label for="subirFactura" title="Suba su Factura">
                                Suba su Factura
                
                            </label>
                            <dx:ASPxUploadControl ID="subirFactura" runat="server" Width="100%" Theme="Metropolis" AutoStartUpload="True" FileUploadMode="OnPageLoad" OnFileUploadComplete="subirFactura_FileUploadComplete"></dx:ASPxUploadControl>

                            <dx:ASPxGridView ID="grdFacturas" runat="server" AutoGenerateColumns="False" Caption="Factura" DataSourceID="DatosFacturas" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IdOrigen" Visible="False" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IdProveedor" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="Fecha" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="Factura" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Factura" FieldName="Documento" VisibleIndex="5">
                                        <PropertiesHyperLinkEdit Target="_blank">
                                        </PropertiesHyperLinkEdit>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="DatosFacturas" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Entradas_Consultar_Detalle" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtFolio" Name="Id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
            <dx:ASPxPopupControl ID="popupEdicion" runat="server" ClientInstanceName="popupEdicion" HeaderText="Seleccione la Entrada" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" Theme="Metropolis">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="grdEntradas" runat="server" AutoGenerateColumns="False" DataSourceID="EntradasDatos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Proveedor" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                    <DataItemTemplate>
                                        <asp:LinkButton ID="lnkSeleccionar" runat="server" OnClick="lnkSeleccionar_Click">Seleccionar</asp:LinkButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="EntradasDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Entradas_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
