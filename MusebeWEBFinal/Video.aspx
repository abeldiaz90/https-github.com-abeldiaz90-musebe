<%@ Page Title="Video de Sitio web" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="MusebeWEBFinal.Video" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">   
    <dx:ASPxUploadControl ID="popupDocumentos" runat="server" UploadMode="Auto" Width="100%" AutoStartUpload="True" OnFileUploadComplete="popupDocumentos_FileUploadComplete" ShowProgressPanel="True" Theme="Metropolis"></dx:ASPxUploadControl>
</asp:Content>
