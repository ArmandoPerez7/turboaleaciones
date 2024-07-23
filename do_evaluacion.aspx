<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="false" MasterPageFile="~/Mersol.Master" CodeBehind="do_evaluacion.aspx.vb" Inherits="Mersol.do_evaluacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Reporte de Evaluación</h4>
                        <p class="text-muted font-14">
                            Seleccione una fecha
                        </p>
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">
                                    <div class="col-auto mt-2 mb-2">
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFecha" runat="server" placeholder="Ingrese una fecha" data-date-autoclose="true" autocomplete="off"/>
                                    </div>

                                    <div class="col-auto m-2">
                                        <asp:Button ID="BtnBuscar" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnBuscar_Click" />
                                    </div>
                                    
                                </div>
                            </div><!-- end col-->
                            <div class="col-md-2 m-2 d-inline">
                               
                            </div>
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <asp:Label ID="txtsucursal" runat="server" CssClass="mt-0 mb-5 header-title" Text=""></asp:Label>        
                        <div class="container row mt-2">
                            <div class="table small">
                                <asp:GridView runat="server" ID="gvEvaluacion" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                              
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
                               
            </div>
        </div>
        <!-- end row -->
                        
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

    <script>
        $(document).ready(function () {
            $('#gvasisfxdia').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        });
    </script>
    
    
</asp:Content>
