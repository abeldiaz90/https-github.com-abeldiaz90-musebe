<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="MusebeWEBFinal.Clientes" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="page-header">
        <h1>Clientes</h1>
    </div>
    <dx:ASPxGridView ID="grdClientes" runat="server" AutoGenerateColumns="False" DataSourceID="ClientesDatos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CodigoPostal" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Web" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RFC" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Representante" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="11">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
        <Settings ShowFilterRow="True" />
        <SettingsSearchPanel Visible="True" />
        <Styles>
            <Header Font-Bold="True" VerticalAlign="Top" Wrap="True">
            </Header>
            <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Cell>
        </Styles>
    </dx:ASPxGridView>
    
<asp:SqlDataSource ID="ClientesDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" InsertCommand="Clientes_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Clientes_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Clientes_Modificar" UpdateCommandType="StoredProcedure" DeleteCommand="Clientes_Eliminar" DeleteCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Cliente" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
        <asp:Parameter Name="CodigoPostal" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Web" Type="String" />
        <asp:Parameter Name="RFC" Type="String" />
        <asp:Parameter Name="Representante" Type="String" />
        <asp:Parameter Name="Activo" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Cliente" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
        <asp:Parameter Name="CodigoPostal" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Web" Type="String" />
        <asp:Parameter Name="RFC" Type="String" />
        <asp:Parameter Name="Representante" Type="String" />
        <asp:Parameter Name="Activo" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
