<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="inicio.aspx.vb" Inherits="Mersol.inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Lightbox css -->
    <link href="dist/assets/libs/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content-->
    <div class="container-fluid">
              <h4 class="mt-0 header-title">Nuestras Sucursales</h4>         
        <div class="row">
            <div class="col-lg-12">
                <div class="portfolioFilter">
                    <a href="#" data-filter="*" class="current waves-effect waves-primary">Todos</a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                    <a href="#" data-filter="" class="waves-effect waves-primary"></a>
                </div>
            </div>
        </div>

        <div class="port mb-2">
            <div class="row portfolioContainer">
                <div class="col-xl-3 col-lg-4 col-md-6 villahermosa">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img1.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img1.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 paraiso">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img2.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img2.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 apodaca">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img3.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img3.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 veracruz">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img4.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img4.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 valladolid">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img5.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img5.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 tula">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img6.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img6.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 merida">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img7.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img7.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 salinacruz">
                    <div class="gal-detail thumb">
                        <a href="dist/assets/images/sucursal/img8.jpg" class="image-popup" title="Screenshot-1">
                            <img src="dist/assets/images/sucursal/img8.jpg" class="thumb-img img-fluid" alt="work-thumbnail"/>
                        </a>
                                    
                        <div class="text-center">
                            <h4></h4>
                            <p class="font-13 text-muted mb-2"></p>
                        </div>
                    </div>
                </div>

            </div><!-- end portfoliocontainer-->
        </div> <!-- End row -->
        
    </div> <!-- container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- isotope filter plugin -->
    <script src="dist/assets/libs/isotope-layout/isotope.pkgd.min.js"></script>

    <!-- Magnific Popup-->
    <script src="dist/assets/libs/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Gallery Init-->
    <script src="dist/assets/js/pages/gallery.init.js"></script>
</asp:Content>
