<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pages_error.aspx.vb" Inherits="Mersol.pages_error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <title>Pagina de Error | Sistema Mersol Sureste</title>
        <link rel="icon" href="dist/assets/images/favicon.png" />

        <!-- App css -->
        <link href="dist/assets/css/app.css" rel="stylesheet" />

        <!-- icons -->
        <link href="dist/assets/css/icons.min.css" rel="stylesheet" />

    </head>

    <body class="loading authentication-bg authentication-bg-pattern">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="text-center">
                            <a href="index.html" class="logo">
                                <img src="dist/assets/images/logo_merosol_sureste.png" alt="" height="85" class="mx-auto" />
                            </a>
                            <p class="text-muted mt-2 mb-4">Sistema Mersol Sureste</p>
                        </div>
                        <div class="card">

                            <div class="card-body p-4">

                                <div class="text-center">
                                    <h1 class="text-error">404</h1>
                                    <h3 class="mt-3 mb-2">Acceso Denegado.</h3>
                                    <p class="text-muted mb-3">Parece que has tomado un camino equivocado. No te preocupes... nos pasa a todos...</p>
                                    <p class="text-muted mb-3">Comuníquese con el departamento de sistemas para habilitar acceso.</p>

                                    <a href="inicio.aspx" class="btn btn-danger waves-effect waves-light"><i class="fas fa-home me-1"></i> Regresar a Página Principal</a>
                                </div>
    

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