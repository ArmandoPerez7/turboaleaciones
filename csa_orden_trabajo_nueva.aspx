<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="csa_orden_trabajo_nueva.aspx.vb" Inherits="Mersol.csa_orden_trabajo_nueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Plugins css -->
    <link href="dist/assets/libs/dropify/css/dropify.min.css" rel="stylesheet" type="text/css" />

    <!-- third party css -->
    <link href="dist/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-select-bs5/css//select.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content-->
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-body">
                            
                            <div class="row justify-content-between">
                                <div class="col-md-9">
                                    <h4 class="mt-0 header-title">DATOS DEL CLIENTE</h4>
                                    <div class="mt-md-0 d-flex">
                                        <div class="col-auto m-1">
                                            <label class="visually-hidden" for="inlineFormInput">Name</label>
                                            <input type="text" class="form-control mb-2" id="inlineFormInput" placeholder="Ingrese el teléfono">
                                        </div>
                                        <div class="col-auto m-1">
                                            <button type="submit" class="btn btn-primary waves-effect waves-light mb-2">Buscar</button>
                                        </div>
                                    </div>
                                </div><!-- end col-->
                                <div class="col-md-2 m-2 d-inline">
                                    <button type="button" class="btn btn-success waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#con-close-modal">Agregar Cliente</button>
                                </div>
                            </div> <!-- end row -->

                        <div class="row">
                            <div class="col-md-6">
                                <div >
                                    <label class="form-label" for="inlineFormInput">Nombre del Cliente: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Empresa: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Domicilio: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Ciudad: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Teléfono: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">E-mail: </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div>
                                    <label for="field-2" class="form-label">C.P. </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Estado: </label>
                                </div>
                                <div>
                                    <label class="form-label" for="inlineFormInput">Celular: </label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div> <!-- end card -->
            </div> <!-- end col -->
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-body">
                    
                            <div class="row justify-content-between">
                                <div class="col-md-12">
                                    <h4 class="mt-0 header-title">DATOS DEL PRODUCTO</h4>
                                    <div class="mt-md-0 d-flex">
                                        <div class="col-3 m-1">
                                            <label class="form-labe font-12" for="inlineFormInput">Código Producto:</label>
                                            <input type="text" class="form-control mb-2" id="inlineFormInput" placeholder="Agregar Código">
                                        </div>
                                        <div class="col-2 m-1">
                                             <label class="form-labe font-12" for="inlineFormInput">Fecha de Compra:</label>
                                            <input type="text" class="form-control date" data-provide="datepicker" id="txtDia" placeholder="Ingrese un Dia" runat="server"/>
                                        </div> 
                                        <div class="col-3 m-1">
                                            <label class="form-labe font-12" for="inlineFormInput">Lugar de Compra:</label>
                                            <input type="text" class="form-control mb-2" id="inlineFormInput" placeholder="Tienda o Distribuidor">
                                        </div>
                                        <div class="col-3 m-1">
                                            <label class="form-labe font-12" for="inlineFormInput">Tipo de Servicio:</label>
                                            <select id="sltSistema" class="form-select sltSistema" runat="server">
                                                <option value="">Seleccione una opción..</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="txtObservaciones" class="form-label">Observaciones o Comentarios</label>
                                        <textarea id="txtObservaciones" class="form-control" name="txtObservaciones" runat="server"> </textarea>
                                    </div>

                                    <div>
                                        <a href="csa_index.aspx" class="btn btn-link waves-effect waves-success font-14"><i class="mdi mdi-chevron-double-left me-1"></i> Regresar</a>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="button" class="btn btn-success waves-effect waves-light">Guardar</button>
                                    </div>
                                </div>
                            </div> <!-- end row -->

                    </div>
                </div> <!-- end card -->
            </div> <!-- end col -->
        </div>

        <div id="con-close-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Agregar Clientes</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="field-1" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="field-1" placeholder="John">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="field-2" class="form-label">Empresa</label>
                                    <input type="text" class="form-control" id="field-2" placeholder="Doe">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-1" class="form-label">RFC</label>
                                    <input type="text" class="form-control" id="field-1" placeholder="John">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-2" class="form-label">Correo electrónico</label>
                                    <input type="text" class="form-control" id="field-2" placeholder="Doe">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-5" class="form-label">Domicilio</label>
                                    <input type="text" class="form-control" id="field-5" placeholder="United States">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-6" class="form-label">Código Postal</label>
                                    <input type="text" class="form-control" id="field-6" placeholder="123456">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-1" class="form-label">Estado</label>
                                    <input type="text" class="form-control" id="field-1" placeholder="John">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-2" class="form-label">Ciudad</label>
                                    <input type="text" class="form-control" id="field-2" placeholder="Doe">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-1" class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" id="field-1" placeholder="John">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="field-2" class="form-label">Extensión</label>
                                    <input type="text" class="form-control" id="field-2" placeholder="Doe">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-info waves-effect waves-light">Guardar</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->


    </div> <!-- container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- third party js -->
    <script src="dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="dist/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <!-- third party js ends -->

    <!-- Plugins js-->
    <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-pickers.init.js"></script>

    <!-- Plugins js -->
    <script src="dist/assets/libs/dropify/js/dropify.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-fileuploads.init.js"></script>

    <script>
        $('.loanding').hide();
        $('.deshabilitar').click(function () {
            $('.loanding').show();
            $('.accionGuardar').hide();
            $('.staticBackdropLabel').hide();
        });

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        });

    </script>
</asp:Content>