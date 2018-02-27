<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="MusebeWEBFinal.detailaspx" %><%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	<dx:ASPxImageGallery ID="sliders" runat="server">
			<SettingsFolder ImageCacheFolder="~\Thumb\" />
		</dx:ASPxImageGallery>
    
    </div>
    </form>
</body>
</html>
