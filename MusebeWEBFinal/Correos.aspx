<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Correos.aspx.cs" Inherits="MusebeWEBFinal.Correos" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
	<dx:ASPxTextBox ID="txtPara" runat="server" Caption="Para" CssClass="form-control" Width="100%">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxTextBox ID="txtCC" runat="server" Caption="CC" CssClass="form-control" Width="100%" NullText="Escriba destinatarios separados por ;">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxTextBox ID="txtCCO" runat="server" Caption="CCO" CssClass="form-control" Width="100%" NullText="Escriba destinatarios separados por ;">
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxTextBox ID="txtAsunto" runat="server" Caption="Asunto" CssClass="form-control" Width="100%" >
	</dx:ASPxTextBox>
	<br />
	<dx:ASPxMemo ID="txtMensaje" runat="server" Caption="Mensaje" CssClass="form-control"  Height="71px" Width="100%">
	</dx:ASPxMemo>
	<br />
	<dx:ASPxButton ID="txtEnviar" runat="server" OnClick="txtEnviar_Click" Text="Enviar Correo" CssClass="btn btn-success">
	</dx:ASPxButton>
</asp:Content>
