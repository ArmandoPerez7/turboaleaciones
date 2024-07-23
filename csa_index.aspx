<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="csa_index.aspx.vb" Inherits="Mersol.csa_index" %>
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
        <div class="row" id="ocultar" runat="server" visible="true"> 
            <div class="col-12">
                <div class="card">
                    <div class="card-body" style="padding: 0.5rem 1.5rem;">
                        <div class="row justify-content-between">
                            <div class="col-md-8 d-flex align-items-center">

                                <div class="mt-md-0 d-flex">
                                    <div class="col-auto m-1">
                                         <h4 class="mt-0 header-title">Consulta de Ordenes de Trabajo</h4>
                                    </div>
        
                                </div>
                            </div><!-- end col-->
                            <div class="col-md-3 m-1 d-flex">
                                <div class="col-auto m-1">
                                     <a href="csa_orden_trabajo_nueva.aspx" class="btn btn-link waves-effect waves-success font-14"><i class="mdi mdi-plus me-1"></i> Nueva Orden</a>
                                </div>
                                <div class="col-auto m-1">
                                    <p class="mt-1"> | </p>
                                </div>
                                <div class="col-auto m-1">
                                      <button type="button" class="btn btn-link waves-effect waves-success font-14"><i class="mdi mdi-file-excel me-1"></i> Enviar a Excel</button>
                                </div>
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
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">

                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Folio: </p>
                                        <input type="text" class="form-control" id="txtFolio" runat="server" placeholder="No. Folio" />
                                    </div>

                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Estatus: </p>
                                        <select id="sltSistema" class="form-select sltSistema" runat="server">
                                            <option value="">Seleccione una opción..</option>
                                        </select>
                                    </div>

                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Fecha Alta: </p>
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtinicio" placeholder="Ingrese una fecha" />
                                    </div>
                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Fecha Recepción: </p>
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtfin" placeholder="Ingrese una fecha" />
                                    </div>

                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Cliente: </p>
                                        <input type="text" class="form-control" id="Text1" runat="server" placeholder="Nombre Cliente" />
                                    </div>

                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Producto: </p>
                                        <input type="text" class="form-control" id="Text2" runat="server" placeholder="Producto" />
                                    </div>

                                    <div class="col-auto m-1 mt-3">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;"></p>
                                        <asp:Button ID="BtnAsistencia" CssClass="btn form-control-sm btn-primary" runat="server" Text="Buscar" OnClick="BtnAsistencia_Click"/>
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
                        <div class="row justify-content-between">
                            <div class="col-md-12 m-1 d-flex justify-content-end">
                                <div class="col-auto m-1 d-inline-flex">
                                     <div class="widget-chart-box-1 float-start" dir="ltr">
                                        <i class="mdi mdi-circle text-success"></i>
                                    </div>
                                    <div class="widget-detail-1 text-end">
                                        <p class="text-muted mb-1"> Menos de a días</p>
                                    </div>
                                </div>
                                <div class="col-auto m-1 d-inline-flex">
                                    <div class="widget-chart-box-1 float-start" dir="ltr">
                                        <i class="mdi mdi-circle text-warning"></i>
                                    </div>
                                    <div class="widget-detail-1 text-end">
                                        <p class="text-muted mb-1"> Más de 4 días</p>
                                    </div>
                                </div>
                                <div class="col-auto m-1 d-inline-flex">
                                    <div class="widget-chart-box-1 float-start" dir="ltr">
                                        <i class="mdi mdi-circle text-danger"></i>
                                    </div>
                                    <div class="widget-detail-1 text-end">
                                        <p class="text-muted mb-1"> Más de 8 días</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end row -->
                        <div class="table-responsive">
                            <table class="table mb-0 font-12">
                                <thead>
                                <tr>
                                    <th>Prioridad</th>
                                    <th>Folio</th>
                                    <th>Clave</th>
                                    <th>Días Transcurridos</th>
                                    <th>Cliente</th>
                                    <th>Producto</th>
                                    <th>Num Serie</th>
                                    <th>Fecha Alta</th>
                                    <th>Fecha Recepción</th>
                                    <th>Tipo Falla</th>
                                    <th>Estatus</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">
                                        <i class="mdi mdi-circle text-success" style="font-size: 18px"></i>
                                    </th>
                                    <td>303599</td>
                                    <td>CS373</td>
                                    <td>1</td>
                                    <td>CONCRETOS Y AGREGADOS DE TABASCO SA DE CV</td>
                                    <td>POLACSA</td>
                                    <td></td>
                                    <td>13-DIC-2023</td>
                                    <td>13-DIC-2023</td>
                                    <td></td>
                                    <td>Recibido en CSA</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <i class="mdi mdi-circle text-warning" style="font-size: 18px"></i>
                                    </th>
                                    <td>303534</td>
                                    <td>CS373</td>
                                    <td>4</td>
                                    <td>CONCRETOS Y AGREGADOS DE TABASCO SA DE CV</td>
                                    <td>POLACSA</td>
                                    <td></td>
                                    <td>13-DIC-2023</td>
                                    <td>13-DIC-2023</td>
                                    <td>CF FALLA RECURRENTE</td>
                                    <td>Recibido en CSA</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <i class="mdi mdi-circle text-danger" style="font-size: 18px"></i>
                                    </th>
                                    <td>303534</td>
                                    <td>CS373</td>
                                    <td>4</td>
                                    <td>CONCRETOS Y AGREGADOS DE TABASCO SA DE CV</td>
                                    <td>POLACSA</td>
                                    <td></td>
                                    <td>13-DIC-2023</td>
                                    <td>13-DIC-2023</td>
                                    <td>CF FALLA RECURRENTE</td>
                                    <td>Recibido en CSA</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
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