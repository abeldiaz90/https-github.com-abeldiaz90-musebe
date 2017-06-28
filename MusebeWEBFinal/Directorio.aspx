<%@ Page Title="Directorio" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Directorio.aspx.cs" Inherits="MusebeWEBFinal.Directorio" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="page-header">
        <h1>Directorio</h1>
    </div>
    <dx:ASPxGridView ID="grdDirectorio" runat="server" AutoGenerateColumns="False" DataSourceID="DirectorioDatos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="4">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SegundoNombre" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApellidoPaterno" VisibleIndex="6">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApellidoMaterno" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Correo" VisibleIndex="8">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="9">
                <PropertiesTextEdit DisplayFormatInEditMode="True">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Extension" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Celular" VisibleIndex="11">
                <PropertiesTextEdit>
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="12">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn Caption="Cliente" FieldName="IdCliente" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="ClientesDatos" TextField="Cliente" ValueField="Id">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="Directorio">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Styles>
            <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Header>
            <Cell HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Cell>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="DirectorioDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" DeleteCommand="Directorio_Eliminar" DeleteCommandType="StoredProcedure" InsertCommand="Directorio_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Directorio_Consultar_Todos" SelectCommandType="StoredProcedure" UpdateCommand="Directorio_Modificar" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdCliente" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="SegundoNombre" Type="String" />
            <asp:Parameter Name="ApellidoPaterno" Type="String" />
            <asp:Parameter Name="ApellidoMaterno" Type="String" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="IdCliente" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="SegundoNombre" Type="String" />
            <asp:Parameter Name="ApellidoPaterno" Type="String" />
            <asp:Parameter Name="ApellidoMaterno" Type="String" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClientesDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="Clientes_Consultar_Activos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
