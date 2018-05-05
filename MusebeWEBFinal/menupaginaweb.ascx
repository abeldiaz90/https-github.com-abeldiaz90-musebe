<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menupaginaweb.ascx.cs" Inherits="MusebeWEBFinal.menupaginaweb" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<div class="row">
	<div class="col-md-6">
		<dx:ASPxMenu ID="Menu" runat="server" NameField="MenuText" NavigateUrlField="destUrl"
			TextField="MenuText" AccessibilityCompliant="True" AutoSeparators="All"
			ClientIDMode="AutoID"
			GutterWidth="0px" HorizontalAlign="Center" ImageUrlField="ImageUrlField" 
			ToolTipField="tooltip" RenderMode="Lightweight"
			ItemImagePosition="Bottom" ShowAsToolbar="True"
			VerticalAlign="Middle" AllowSelectItem="True" EnableAdaptivity="true"
			ApplyItemStyleToTemplates="True"
			BackColor="DeepSkyBlue" ForeColor="White" Border-BorderColor="DeepSkyBlue" EnableSubMenuFullWidth="True">
			<ItemStyle BackColor="DeepSkyBlue" ForeColor="White" HoverStyle-BackgroundImage-HorizontalPosition="center" />
			<SubMenuItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
			</SubMenuItemStyle>
			<SubMenuStyle BackColor="DeepSkyBlue" />
			<Border BorderColor="DeepSkyBlue" />
		</dx:ASPxMenu>
	</div>
	<div class="col-md-6">
		<a href="#" id="linkcorreo" runat="server" style="color: black; font-size: smaller" title="Envienos sus dudas por correo electronico">&#9993;<dx:ASPxLabel ID="lblCorreo" runat="server" Text=""></dx:ASPxLabel></a>
		<a href="#" id="linktelefono" runat="server" style="color: black; font-size: smaller">&#9742;<dx:ASPxLabel ID="lblTel" runat="server" Text=""></dx:ASPxLabel></a>

		<div class="dropdown col-lg-3">
			<span>Bienvenido:</span>

			<button id="dropdownMenu1" aria-expanded="true" aria-haspopup="true" class="btn btn-default dropdown-toggle btn-group-justified" data-toggle="dropdown" type="button">
				<asp:LoginName ID="LoginName1" runat="server" />
				<span class="caret"></span>
			</button>
			<ul aria-labelledby="dropdownMenu1" class="dropdown-menu">
				<li>
					<asp:LinkButton ID="MisDatos" runat="server" OnClick="MisDatos_Click" Text="Mis Datos"></asp:LinkButton>
				</li>
				<li>
					<asp:LinkButton ID="lnkPassword" runat="server" OnClick="lnkPassword_Click" Text="Cambiar Contraseña"></asp:LinkButton>
				</li>
				<li><a href="#">
					<asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />
				</a></li>
			</ul>
		</div>
	</div>
</div>
<dx:ASPxPopupControl ID="popupPerfil" runat="server" HeaderText="Mis Datos" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Metropolis" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ShowPageScrollbarWhenModal="True">
	<ContentCollection>
		<dx:PopupControlContentControl runat="server">
			<dx:ASPxTextBox ID="txtNombre" runat="server" Caption="Primer Nombre:" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Middle" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarDatosPersonales" ErrorTextPosition="Bottom">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
			<dx:ASPxTextBox ID="txtSegundoNombre" runat="server" Caption="Segundo Nombre:" Theme="Metropolis" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Middle" />
			</dx:ASPxTextBox>
			<dx:ASPxTextBox ID="txtApellidoPaterno" runat="server" Caption="Apellido Paterno:" Theme="Metropolis" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Middle" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarDatosPersonales" ErrorTextPosition="Bottom">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
			<dx:ASPxTextBox ID="txtApellidoMaterno" runat="server" Caption="Apellido Materno:" Theme="Metropolis" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Middle" />
			</dx:ASPxTextBox>
			<dx:ASPxTextBox ID="txtCorreo" runat="server" Caption="Correo Electrónico:" Theme="Metropolis" CssClass="form-control">
				<CaptionSettings HorizontalAlign="Left" Position="Top" VerticalAlign="Middle" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="GuardarDatosPersonales" ErrorTextPosition="Bottom">
					<RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
			<dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="GuardarDatosPersonales" OnClick="btnGuardar_Click">
			</dx:ASPxButton>
			<dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" ValidationGroup="GuardarDatosPersonales">
			</dx:ASPxButton>
		</dx:PopupControlContentControl>
	</ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="popupPassword" runat="server" HeaderText="Cambio de Password" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Metropolis">
	<ContentCollection>
		<dx:PopupControlContentControl runat="server">
			<dx:ASPxTextBox ID="txtPasswordNuevo" ClientInstanceName="txtPasswordNuevo" runat="server" Caption="Password Nuevo" CssClass="form-control" Width="170px" EnableViewState="False" Native="True" Password="True">
				<CaptionSettings HorizontalAlign="Center" Position="Top" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="CambioPassword">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
			<dx:ASPxTextBox ID="txtPasswordNuevoConfirm" ClientInstanceName="txtPasswordNuevoConfirm" runat="server" AutoResizeWithContainer="True" Caption="Confirme su Password:" CssClass="form-control" Width="170px" EnableViewState="False" Native="True" Password="True">
				<ClientSideEvents Validation="function(s, e) {
		var originalPasswd = txtPasswordNuevo.GetText();
    var currentPasswd = s.GetText();
    e.isValid = (originalPasswd  == currentPasswd);
}" />
				<CaptionSettings HorizontalAlign="Center" Position="Top" />
				<ValidationSettings SetFocusOnError="True" ValidationGroup="CambioPassword">
					<RequiredField IsRequired="True" />
				</ValidationSettings>
			</dx:ASPxTextBox>
			<dx:ASPxButton ID="btnChangePassword" runat="server" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" Text="Cambiar Password" Theme="Metropolis" ValidationGroup="CambioPassword">
			</dx:ASPxButton>
		</dx:PopupControlContentControl>
	</ContentCollection>
</dx:ASPxPopupControl>


