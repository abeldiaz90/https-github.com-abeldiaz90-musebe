<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menupaginaweb.ascx.cs" Inherits="MusebeWEBFinal.menupaginaweb" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

			<dx:ASPxMenu ID="Menu" runat="server" NameField="MenuText" NavigateUrlField="destUrl"
									TextField="MenuText" AccessibilityCompliant="True" AutoSeparators="All"
									ClientIDMode="AutoID"
									GutterWidth="0px" HorizontalAlign="Center" ImageUrlField="ImageUrlField" ShowPopOutImages="True"
									 ToolTipField="tooltip"
									ItemImagePosition="Bottom" ShowAsToolbar="True"
									VerticalAlign="Middle" AllowSelectItem="True" EnableAdaptivity="true"
									ApplyItemStyleToTemplates="True"
									EnableSubMenuScrolling="True" SelectParentItem="True" BackColor="DeepSkyBlue" ForeColor="White" Border-BorderColor="DeepSkyBlue">
				<SubMenuStyle BackColor="DeepSkyBlue" />
				<Border BorderColor="DeepSkyBlue" />
								</dx:ASPxMenu>

