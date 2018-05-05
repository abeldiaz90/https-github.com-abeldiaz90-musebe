<%@ Page Title="Mi Empresa" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MiEmpresa.aspx.cs" Inherits="MusebeWEBFinal.MiEmpresa" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
		 <div class="page-header">
        <h1>Mis Empresas</h1>
    </div>
    <dx:ASPxGridView ID="grdEmpresas" runat="server" AutoGenerateColumns="False" DataSourceID="Datos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%">
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="4" Caption="Telefono Oficina">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Correo" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Pagina" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RFC" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="9">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn VisibleIndex="11">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkButtonLogo_Click">Logo</asp:LinkButton>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataBinaryImageColumn Caption="Logo" FieldName="Logo" VisibleIndex="10">
            <PropertiesBinaryImage AlternateText="Logo" ImageAlign="Middle" ImageHeight="100px" ImageWidth="100px">
            </PropertiesBinaryImage>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataBinaryImageColumn>
    	<dx:GridViewDataTextColumn Caption="Celular" FieldName="Celular" VisibleIndex="5">
		</dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
    	<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
    <SettingsSearchPanel Visible="True" />
    <Styles>
        <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
        </Header>
        <Row HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
        </Row>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="Datos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" DeleteCommand="Empresas_Eliminar" DeleteCommandType="StoredProcedure" InsertCommand="Empresas_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Empresas_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Empresas_Modificar" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Empresa" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
        <asp:Parameter Name="Celular" Type="String" />
        <asp:Parameter Name="Correo" Type="String" />
        <asp:Parameter Name="Pagina" Type="String" />
        <asp:Parameter Name="RFC" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Empresa" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
        <asp:Parameter Name="Celular" Type="String" />
        <asp:Parameter Name="Correo" Type="String" />
        <asp:Parameter Name="Pagina" Type="String" />
        <asp:Parameter Name="RFC" Type="String" />
        <asp:Parameter Name="Activo" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>
<dx:ASPxPopupControl ID="popupLogo" runat="server" ClientInstanceName="popupLogo" HeaderText="Cargar Logo" Theme="Metropolis">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" FileUploadMode="OnPageLoad" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" UploadMode="Auto" Width="280px">
    </dx:ASPxUploadControl>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
</asp:Content>
