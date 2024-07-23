<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="firma.aspx.vb" Inherits="Mersol.firma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Firma | Sistema Mersol Sureste</title>
    <!-- App favicon -->
    <link rel="icon" href="dist/assets/images/favicon.png" />
    <!-- App css -->
    <link href="dist/assets/css/app.css" rel="stylesheet"/>
    <!-- icons -->
    <link href="dist/assets/css/icons.min.css" rel="stylesheet" />
</head>

<!-- body start -->
    <body class="loading" data-layout-color="light"  data-layout-mode="default" data-layout-size="fluid" data-topbar-color="light" data-leftbar-position="fixed" data-leftbar-color="light" data-leftbar-size='default' data-sidebar-user='true'>
        <form id="form1" runat="server">
            <!-- Begin page -->
            <div id="wrapper">
    
                <!-- ============================================================== -->
                <!-- Start Page Content here -->
                <!-- ============================================================== -->

                <div class="content" style="padding: 0 12px 65px 12px; margin-top: 70px;">
                    <div class="content">

                        <!-- Start Content-->
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card text-center d-flex align-items-center">
                                        <div class="card-body">
                                            <h4 class="card-title">Firma institucional</h4>
                                            <p class="card-text">Verificar que los datos en su firma sean los correctos, en caso contrario comunicarse al área de Marketing para su corrección. </p>
                                                <a href="Controllers/GenerarImagen.ashx" download="Firma.png" class="btn btn-primary">Descargar Firma</a>
                                        </div>
                                        <div >
                                            <img class="card-img-top img-fluid w-50" src="Controllers/GenerarImagen.ashx" alt="Firma"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
                        </div> <!-- container -->

                    </div> <!-- content -->

                    <!-- Footer Start -->
                    <footer class="footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <script>document.write(new Date().getFullYear())</script> &copy; Sistema <a href="">Mersol Sureste</a> 
                                </div>
                                <div class="col-md-6">
                                    <div class="text-md-end footer-links d-none d-sm-block">
                                        <a href="javascript:void(0);">Página Oficial Mersol Sureste</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </footer>
                    <!-- end Footer -->

                </div>

                <!-- ============================================================== -->
                <!-- End Page content -->
                <!-- ============================================================== -->


            </div>
            <!-- END wrapper -->
        </form>
        


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
