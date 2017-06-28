<%@ Page Title="Ordenes de Compra" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="OrdenesCompra.aspx.cs" Inherits="MusebeWEBFinal.OrdenesCompra" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <dx:ASPxTextBox ID="txtNumeroCotizacion" runat="server" Caption="Ingrese el Número de Cotización" CssClass="form-control" Width="100%" HorizontalAlign="Center" NullText="Ingrese el Numero de Folio">
                <CaptionSettings HorizontalAlign="Center" Position="Top" VerticalAlign="Top" />
                <ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
            <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary"></dx:ASPxButton>
        </div>
        <div class="col-md-4">
        </div>
    </div>
    <br />
</asp:Content>
