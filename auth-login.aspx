<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="auth-login.aspx.vb" Inherits="Mersol.auth_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login | Sistema Mersol Sureste</title>
    <link rel="icon" href="dist/assets/images/favicon.png" />

    <!-- App css -->
	<link href="dist/assets/css/app.css" rel="stylesheet" />

	<!-- icons -->
	<link href="dist/assets/css/icons.min.css" rel="stylesheet" />
</head>
<body class="loading authentication-bg authentication-bg-pattern">
    <div class="account-pages my-5">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-4">
                        <div class="text-center">   
                            <a href="dashboard.html">
                                <img src="dist/assets/images/logo.png" alt="" height="85" class="mx-auto" />
                            </a>
                            <p class="text-muted mt-2 mb-4">Sistema Turboaleaciones</p>

                        </div>
                        <div class="card">
                            <div class="card-body p-4">
                                
                                <div class="text-center mb-4">
                                    <h4 class="text-uppercase mt-0">Iniciar sesión</h4>
                                </div>

                                <form id="formulario_login" runat="server">
                                    <div class="mb-3">
                                        <asp:Label ID="lblUsuario" runat="server" CssClass="form-label" Text="Usuario:"></asp:Label>
                                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Introduce tu usuario"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <asp:Label ID="lblPassword" runat="server" CssClass="form-label" Text="Contraseña:"></asp:Label>
                                        <asp:TextBox ID="tbPassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Introduce tu contraseña"></asp:TextBox>
                                    </div>

                                     <div class="mb-3 text-center">
                                         <asp:Label ID="lblDatos" runat="server" CssClass="text-muted mt-2 mb-4"></asp:Label>
                                        <asp:Label ID="lblError" runat="server" CssClass="text-muted mt-2 mb-4 text-danger"></asp:Label>
                                    </div>
                                    <!--div class="mb-3">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="checkbox-signin" checked>
                                            <label class="form-check-label" for="checkbox-signin">Recordar</label>
                                        </div>
                                    </div-->

                                    <div class="mb-3 d-grid text-center">
                                        <asp:Button ID="BtnIngresar" CssClass="btn btn-primary" runat="server" Text="Iniciar sesión" OnClick="BtnIngresar_Click"/>
                                    </div>
                                </form>

                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

    <!-- Vendor -->
    <script src="dist/assets/libs/jquery/jquery.min.js"></script>
    <script src="dist/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="dist/assets/libs/node-waves/waves.min.js"></script>
    <script src="dist/assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="dist/assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
    <script src="dist/assets/libs/feather-icons/feather.min.js"></script>

    <!-- App js -->
    <script src="dist/assets/js/app.min.js"></script>

</body>
</html>
