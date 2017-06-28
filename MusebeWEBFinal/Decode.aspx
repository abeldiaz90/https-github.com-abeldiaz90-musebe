<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Decode.aspx.cs" Inherits="MusebeWEBFinal.Decode" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Caption="Usuario:" CssClass="form-control" NullText="Ingrese un Usuario:">
            </dx:ASPxTextBox>
            <dx:ASPxButton ID="btnDecodificar" Image-AlternateText="Decodificar" runat="server" Text="Decodificar" OnClick="btnDecodificar_Click"></dx:ASPxButton>
            <dx:ASPxLabel ID="lblPassword" runat="server" Text=""></dx:ASPxLabel>
        </div>
    </form>
</body>
</html>
