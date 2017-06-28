<%@ Page Title="Marcas" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="MusebeWEBFinal.Marcas" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="page-header">
        <h1>Marcas</h1>
    </div>
    <dx:ASPxGridView ID="grdMarcas" runat="server" AutoGenerateColumns="False" DataSourceID="MarcasDatos" KeyFieldName="Id" Width="100%" Theme="Metropolis">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="4" Width="100px">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="MarcasDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" InsertCommand="Marcas_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Marcas_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Marcas_Modificar" UpdateCommandType="StoredProcedure" DeleteCommand="Marcas_Eliminar" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Marca" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="Marca" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
