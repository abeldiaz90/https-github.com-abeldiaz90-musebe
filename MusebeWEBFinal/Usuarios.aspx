<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="MusebeWEBFinal.Usuarios" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="page-header">
        <h1>Usuarios</h1>
    </div>
    <dx:ASPxButton ID="btnNuevoUsuario" runat="server" OnClick="btnNuevoUsuario_Click" Text="Crear Usuario">
    </dx:ASPxButton>
    <dx:ASPxGridView ID="grdUsuarios" runat="server" AutoGenerateColumns="False" DataSourceID="UsuariosDatos" EnableTheming="True" KeyFieldName="Id" Theme="Metropolis" Width="100%" OnRowInserting="grdUsuarios_RowInserting" OnRowUpdating="grdUsuarios_RowUpdating">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>

            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Uuid" VisibleIndex="2" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Password" VisibleIndex="4">
                <PropertiesTextEdit Password="True">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Correo" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Estado" VisibleIndex="12">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="Nombre" VisibleIndex="6" FieldName="Nombre">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Segundo Nombre" FieldName="Segundo_Nombre" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Apellido Paterno" FieldName="Apellido_Paterno" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Apellido Materno" FieldName="Apellido_Materno" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Rol" FieldName="ID_ROL" VisibleIndex="10">
                <PropertiesComboBox DataSourceID="RolesDatos" TextField="ROL" ValueField="ID_ROL">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Empresa" FieldName="IdEmpresa" VisibleIndex="11">
                <PropertiesComboBox DataSourceID="EmpresasDaos" TextField="Empresa" ValueField="Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Styles>
            <Header Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Header>
            <Cell Font-Bold="False" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Cell>
        </Styles>
    </dx:ASPxGridView>
   
    <asp:SqlDataSource ID="UsuariosDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" InsertCommand="Usuarios_Insertar" InsertCommandType="StoredProcedure" SelectCommand="Usuarios_Consultar" SelectCommandType="StoredProcedure" DeleteCommand="Usuarios_Eliminar" DeleteCommandType="StoredProcedure" UpdateCommand="Usuarios_Modificar" UpdateCommandType="StoredProcedure">
        <insertparameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="ID_ROL" Type="Int32" />
            <asp:Parameter Name="Correo" Type="String" />
        </insertparameters>
        <updateparameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="ID_ROL" Type="Int32" />
            <asp:Parameter Name="Correo" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Segundo_Nombre" Type="String" />
            <asp:Parameter Name="Apellido_Paterno" Type="String" />
            <asp:Parameter Name="Apellido_Materno" Type="String" />
        </updateparameters>
        <deleteparameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </deleteparameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="RolesDatos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="ROLES_MOSTRAR_TODOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="EmpresasDaos" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9B18B8_musebeConnectionString %>" SelectCommand="select Id, Empresa from Empresas where Activo=1"></asp:SqlDataSource>
        <dx:ASPxPopupControl ID="popupUsuario" runat="server" HeaderText="Nuevo Usuario:" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" Theme="Metropolis">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxTextBox ID="txtUsuario" runat="server" Caption="Usuario:" Theme="Office2003Olive" Width="170px">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarUsuario">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Caption="Correo Electrónico:" Theme="Office2003Olive" Width="170px">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarUsuario">
                            <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxTextBox ID="txtContraseña" runat="server" Caption="Contraseña" ClientInstanceName="txtContraseña" EnableTheming="True" Password="True" Theme="Office2003Olive" Width="170px">
                        <ClientSideEvents Validation="function(s, e) {
}" />
                        <CaptionSettings Position="Top" />
                        <ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarUsuario">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxTextBox ID="txtConfirmarContraseña" runat="server" Caption="Confirmar Contraseña:" ClientInstanceName="txtConfirmarContraseña" EnableTheming="True" Password="True" Theme="Office2003Olive" Width="170px">
                        <ClientSideEvents Validation="function(s, e) {
		var originalPasswd = txtContraseña.GetText();
    var currentPasswd = s.GetText();
    e.isValid = (originalPasswd  == currentPasswd );
	
}" />
                        <CaptionSettings Position="Top" />
                        <ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarUsuario">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                    <dx:ASPxComboBox ID="cboRol" runat="server" Caption="Rol:" DataSourceID="RolesDatos" EnableTheming="True" TextField="ROL" Theme="Metropolis" ValueField="ID_ROL">
                        <CaptionSettings Position="Top" />
                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="GuardarUsuario">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <dx:ASPxButton ID="btnGuardarUsuario" runat="server" OnClick="btnGuardarUsuario_Click" Text="Guardar" Theme="Metropolis" ValidationGroup="GuardarUsuario">
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancelar" Theme="Default">
                    </dx:ASPxButton>
                    <br />
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>     
</asp:Content>
