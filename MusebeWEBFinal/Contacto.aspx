<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraWeb.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="MusebeWEBFinal.Contacto" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="col-xs-12">
        <div class="center-block">
            <dx:ASPxTextBox ID="txtCorreo" runat="server" Caption="Correo Electrónico:" Theme="Glass" Width="170px" NullText="Correo Electronico">
                <CaptionSettings HorizontalAlign="Left" Position="Top" />
                <ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar">
                    <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
            <dx:ASPxMemo ID="txtContacto" runat="server" Height="71px" Width="100%" Caption="Solicite Información" HorizontalAlign="Center" NullText="Escribanos sus dudas queremos ayudarle" Theme="Glass">
                <CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Top" />
                <ValidationSettings SetFocusOnError="True" ValidationGroup="Enviar">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxMemo>
            <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" Theme="Glass" ValidationGroup="Enviar">
            </dx:ASPxButton>
            <!-- Contenido -->
        </div>
    </div>
</asp:Content>

