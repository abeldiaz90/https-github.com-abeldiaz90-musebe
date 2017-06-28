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
        <div class="col-md-6 col-md-offset-3">
            <section id="loginForm" class="panel panel-default">
                <div class="panel-body col-lg-12">
                    <h2>Inicio de Sesión</h2>
                    <hr />
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" FailureText="No fue posible inciar sesion intentelo nuevamente" LoginButtonText="Inciar Sesion" RenderOuterTable="False">
                    </asp:Login>
                </div>
            </section>
        </div>

    </form>
</body>
</html>
