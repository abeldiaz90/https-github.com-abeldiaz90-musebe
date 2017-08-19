<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MusebeWEBFinal.Productos" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<dx:ASPxButton ID="btnImprimirCatalogo" runat="server" Text="Exportar Catalogo a Excel" OnClick="btnImprimirCatalogo_Click">
</dx:ASPxButton>
    <dx:ASPxButton ID="btnExportar" runat="server" Text="Imprimir Catalogo" OnClick="btnExportar_Click">
</dx:ASPxButton>
    <dx:ASPxGridViewExporter ID="grdExportar" runat="server" GridViewID="grdProductos">
    </dx:ASPxGridViewExporter>
<dx:ASPxGridView ID="grdProductos" runat="server" AutoGenerateColumns="False" DataSourceID="ProductosDatos" KeyFieldName="Id" Theme="Metropolis" ClientInstanceName="grdProductos" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" VisibleIndex="2" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="4">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NombreCorto" VisibleIndex="5" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Clave" VisibleIndex="6">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Dimension" VisibleIndex="10">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PiezasPaquete" VisibleIndex="12">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PaquetesCajaBulto" VisibleIndex="13">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PiezasCajaBulto" VisibleIndex="14">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PrecioPieza" VisibleIndex="15">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PrecioPaquete" VisibleIndex="16">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PrecioCajaBulto" VisibleIndex="17">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Imagen" VisibleIndex="18" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Creo" VisibleIndex="19" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Creado" VisibleIndex="20" Visible="False">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="21">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn Caption="Marca" FieldName="IdMarca" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="MarcasDatos" TextField="Marca" ValueField="Id">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Material" FieldName="IdMaterial" VisibleIndex="9">
                <PropertiesComboBox DataSourceID="Materiales" TextField="Material" ValueField="Id">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Grupo" FieldName="IdGrupo" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="GruposDatos" TextField="Grupo" ValueField="Id">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="ProductoNuevo">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn VisibleIndex="28">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cargar Imagen" >
                        <ClientSideEvents Click="function(s, e) {
	popupImagen.Show();
}" />
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataBinaryImageColumn Caption="Imagen" VisibleIndex="27" FieldName="Imagen">
                <PropertiesBinaryImage ImageAlign="Middle" ImageHeight="100px" ImageWidth="100px">
                </PropertiesBinaryImage>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataComboBoxColumn Caption="Unidad" FieldName="IdUnidad" VisibleIndex="11">
                <PropertiesComboBox DataSourceID="Unidades" TextField="Unidad" ValueField="Id">
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Stock Minimo" FieldName="Min" VisibleIndex="22">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Stock Máximo" FieldName="Max" VisibleIndex="23">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad Inicial" FieldName="Inicial" VisibleIndex="24">
                <PropertiesTextEdit>
                    <Style CssClass="form-control">
                    </Style>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Producto Aplica IVA" FieldName="Iva" VisibleIndex="25">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Inventariable" FieldName="Inventariable" VisibleIndex="26">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsText PopupEditFormCaption="Productos" Title="Productos" />
        <SettingsPopup>
            <EditForm AllowResize="True" Height="100%" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="600px" />
        </SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <Styles>
            <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Header>
            <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Cell>
        </Styles>
        <StylesEditors>
            <TextBox CssClass="form-control">
            </TextBox>
        </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="Unidades" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Unidades_Consultar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <dx:ASPxPopupControl ID="popupImagen" runat="server"
        ClientInstanceName="popupImagen" HeaderText="Seleccione la Fotografia"
        Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" Theme="Metropolis" Width="300px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxUploadControl ID="SubirImagen" runat="server" ClientInstanceName="SubirImagen"
                    EnableTheming="True" FileUploadMode="OnPageLoad"
                    OnFileUploadComplete="SubirImagen_FileUploadComplete" ShowProgressPanel="True"
                    ShowUploadButton="True" Theme="Metropolis" UploadMode="Auto" Width="280px">
                    <ClientSideEvents FileUploadComplete="function(s, e) {
	grdProductos.Refresh();
}" />
                    <ClientSideEvents FileUploadComplete="function(s, e) {
	grdEmpleados.Refresh();
}"></ClientSideEvents>

                    <TextBoxStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:ASPxUploadControl>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
</rsweb:ReportViewer>
<br />
    <asp:SqlDataSource ID="ProductosDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" InsertCommand="Productos_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Productos_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Productos_Modificar" UpdateCommandType="StoredProcedure" DeleteCommand="Productos_Eliminar" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Producto" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="NombreCorto" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="IdGrupo" Type="Int32" />
            <asp:Parameter Name="IdMarca" Type="Int32" />
            <asp:Parameter Name="IdMaterial" Type="Int32" />
            <asp:Parameter Name="IdUnidad" Type="Int32" />
            <asp:Parameter Name="Dimension" Type="Single" />
            <asp:Parameter Name="PiezasPaquete" Type="Int32" />
            <asp:Parameter Name="PaquetesCajaBulto" Type="Int32" />
            <asp:Parameter Name="PrecioPieza" Type="Decimal" />
            <asp:Parameter Name="PrecioPaquete" Type="Decimal" />
            <asp:Parameter Name="PrecioCajaBulto" Type="Decimal" />
            <asp:Parameter Name="Creo" Type="String" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="Min" Type="Single" />
            <asp:Parameter Name="Max" Type="Single" />
            <asp:Parameter Name="Inicial" Type="Single" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Producto" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="NombreCorto" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="IdGrupo" Type="Int32" />
            <asp:Parameter Name="IdMarca" Type="Int32" />
            <asp:Parameter Name="IdMaterial" Type="Int32" />
            <asp:Parameter Name="IdUnidad" Type="Int32" />
            <asp:Parameter Name="Dimension" Type="Single" />
            <asp:Parameter Name="PiezasPaquete" Type="Int32" />
            <asp:Parameter Name="PiezasCajaBulto" Type="Int32" />
            <asp:Parameter Name="PaquetesCajaBulto" Type="Int32" />
            <asp:Parameter Name="PrecioPieza" Type="Decimal" />
            <asp:Parameter Name="PrecioPaquete" Type="Decimal" />
            <asp:Parameter Name="PrecioCajaBulto" Type="Decimal" />
            <asp:Parameter Name="Creo" Type="String" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="Min" Type="Single" />
            <asp:Parameter Name="Max" Type="Single" />
            <asp:Parameter Name="Inicial" Type="Single" />
            <asp:Parameter Name="Iva" Type="Boolean" />
            <asp:Parameter Name="Inventariable" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MarcasDatos" runat="server" ConnectionString="Data Source=SQL5033.SmarterASP.NET;Initial Catalog=DB_9B18B8_musebe;Persist Security Info=True;User ID=DB_9B18B8_musebe_admin;Password=Imperio90" ProviderName="System.Data.SqlClient" SelectCommand="Marcas_Consultar_activas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Materiales" runat="server" ConnectionString="Data Source=SQL5033.SmarterASP.NET;Initial Catalog=DB_9B18B8_musebe;Persist Security Info=True;User ID=DB_9B18B8_musebe_admin;Password=Imperio90" ProviderName="System.Data.SqlClient" SelectCommand="Materiales_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="GruposDatos" runat="server" ConnectionString="Data Source=SQL5033.SmarterASP.NET;Initial Catalog=DB_9B18B8_musebe;Persist Security Info=True;User ID=DB_9B18B8_musebe_admin;Password=Imperio90" ProviderName="System.Data.SqlClient" SelectCommand="Grupos_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
