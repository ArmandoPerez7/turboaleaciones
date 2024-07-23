<%@ Page Title="Ventas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="ventas_mkt.aspx.vb" Inherits="Mersol.ventas_mkt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- third party css -->
    <link href="dist/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-select-bs5/css//select.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

    <!-- Plugins css -->
        <link href="dist/assets/libs/mohithg-switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="dist/assets/libs/multiselect/css/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="dist/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="dist/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />
        <link href="dist/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css" />

    <style>
        .dtHorizontalExampleWrapper {
          max-width: auto;
          max-height: 100vh;
          display: block;
          overflow-x: auto;
          overflow-y: auto;
          white-space: nowrap;
          padding: 0 0 40px 0;
          display: block;
        }

        /* Estilos para motores Webkit y blink (Chrome, Safari, Opera... )*/

        .table::-webkit-scrollbar {
            -webkit-appearance: none;
        }

        .table::-webkit-scrollbar:vertical {
            width:10px;
        }

        .table::-webkit-scrollbar-button:increment,.contenedor::-webkit-scrollbar-button {
            display: none;
        } 

        .table::-webkit-scrollbar:horizontal {
            height: 10px;
        }

        .table::-webkit-scrollbar-thumb {
            background-color: #797979;
            border-radius: 20px;
            border: 2px solid #f1f2f3;
        }

        .table::-webkit-scrollbar-track {
            border-radius: 10px;  
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Consulta Inventario de Articulos</h4>
                        <p class="text-muted font-14">
                            Buscar en el sitema: 
                        </p>
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">

                                    <div class="col-auto m-1">
                                        <input type="text" class="form-control" id="txtFactura" runat="server" placeholder="Codigo Interno" />
                                    </div>
            
                                    <div class="col-auto m-1">
                                        <asp:Button ID="BtnAsistencia" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnAsistencia_Click"/>
                                    </div>

                                    <div class="col-md-2 m-1 d-inline">
                                        <asp:Button ID="BtnExcel" CssClass="btn form-control-sm btn-success" runat="server" Text="Descargar Excel" OnClick="BtnExcel_Click" />
                                    </div>
                                </div>

                            </div><!-- end col-->
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table small">
                            <asp:GridView runat="server" ID="gvConsulta" autogeneratecolumns="True" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">

                            </asp:GridView>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
                        
    </div> <!-- container-fluid -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- third party js -->
    <script src="dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="dist/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <!-- third party js ends -->

    <!-- Datatables init -->
    <script src="dist/assets/js/pages/datatables.init.js"></script>

    <!-- Plugins js-->
    <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-pickers.init.js"></script>

    <!-- Plugins js -->
    <script src="dist/assets/libs/dropify/js/dropify.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-fileuploads.init.js"></script>


    <script src="dist/assets/libs/selectize/js/standalone/selectize.min.js"></script>
    <script src="dist/assets/libs/mohithg-switchery/switchery.min.js"></script>
    <script src="dist/assets/libs/multiselect/js/jquery.multi-select.js"></script>
    <script src="dist/assets/libs/select2/js/select2.min.js"></script>
    <script src="dist/assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
    <script src="dist/assets/libs/devbridge-autocomplete/jquery.autocomplete.min.js"></script>
    <script src="dist/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="dist/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-advanced.init.js"></script>

    <script>

    </script>
    
    
</asp:Content>
