<%@ Page Title="Unidades de Medida" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="MusebeWEBFinal.Unidades" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="page-header">
        <h1>Unidades de Medida</h1>
    </div>
    <dx:ASPxGridView ID="grdUnidades" runat="server" AutoGenerateColumns="False" DataSourceID="UnidadesDatos" KeyFieldName="Id" Width="100%" EnableTheming="True" Theme="Metropolis">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Unidad" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Siglas" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="5">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
        <Settings ShowFilterRow="True" />
        <SettingsSearchPanel Visible="True" />
        <Styles>
            <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Header>
            <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Cell>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="UnidadesDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" InsertCommand="Unidades_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Unidades_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Unidades_Modificar" UpdateCommandType="StoredProcedure" DeleteCommand="Unidades_Eliminar" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Unidad" Type="String" />
            <asp:Parameter Name="Siglas" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Unidad" Type="String" />
            <asp:Parameter Name="Siglas" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
