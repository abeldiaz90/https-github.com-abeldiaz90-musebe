<%@ Page Title="Materiales" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Materiales.aspx.cs" Inherits="MusebeWEBFinal.Materiales" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <dx:ASPxGridView ID="grdMateriales" runat="server" AutoGenerateColumns="False" DataSourceID="MaterialesDatos" KeyFieldName="Id" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Material" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="4" Width="100px">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="MaterialesDatos" runat="server" ConnectionString="Data Source=SQL5033.SmarterASP.NET;Initial Catalog=DB_9B18B8_musebe;Persist Security Info=True;User ID=DB_9B18B8_musebe_admin;Password=Imperio90" InsertCommand="Materiales_Insertar" InsertCommandType="StoredProcedure" ProviderName="System.Data.SqlClient" SelectCommand="Materiales_Consultar" SelectCommandType="StoredProcedure" UpdateCommand="Materiales_Modificar" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Material" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Material" Type="String" />
            <asp:Parameter Name="Activo" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
