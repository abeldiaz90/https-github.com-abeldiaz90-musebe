<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MusebeWEBFinal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Scripts/bootstrap.min.css">
    <link rel="stylesheet" href="dist/css/bootstrapValidator.css" />
    <script type="text/javascript" src="Scripts/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title">Log in</asp:Label>
        </div>

        <div class="modal-body">

            <asp:Login ID="Login1" runat="server" CssClass="User" OnAuthenticate="Login1_Authenticate">
                <LayoutTemplate>
                    <div id="loginform" class="form-horizontal" role="form">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="User Name"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter an User Name" CssClass="error">Please enter an User Name</asp:RequiredFieldValidator>

                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox runat="server" ID="Password" CssClass="form-control" placeholder="Password"
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" Display="Dynamic" ValidationGroup="Login" ErrorMessage="Please enter a password" CssClass="error">Please enter a password</asp:RequiredFieldValidator>

                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                            </label>
                        </div>
                        <div class="form-group">
                            <div>
                                Don't have an account!
                            <%--Pressing the link will take us to the desired modal by using a javascript function --%>
                                <a href="javascript:$('#myModal .modal-content').load('Modals/modalDefaultRegister.aspx',function(e){$('#myModal').modal('show');});">Register here</a>
                            </div>

                        </div>
                        <button type="button" id="btnClose" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" class="btn btn-primary" ValidationGroup="Login" Text="Log in" UseSubmitBehavior="false" />
                    </div>
                </LayoutTemplate>

            </asp:Login>

        </div>
        <div class="modal-footer">
        </div>
    </div>
<%--        <div class="col-md-6 col-md-offset-3">
            <section id="loginForm" class="panel panel-default">
                <div class="panel-body col-lg-12">
                    <h2>Inicio de Sesión</h2>
                    <hr />
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" FailureText="No fue posible inciar sesion intentelo nuevamente" LoginButtonText="Inciar Sesion" RenderOuterTable="False">
                    </asp:Login>
                </div>
            </section>
        </div>--%>

    </form>
</body>
</html>
