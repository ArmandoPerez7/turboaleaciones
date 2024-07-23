<%@ Page Title="Computo Facuras" Language="vb" EnableEventValidation="false" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="computo_facturas.aspx.vb" Inherits="Mersol.computo_facturas" %>
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
        .priority-1{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row justify-content-between">
                            <div class="col-md-5">
                                <h4 class="mt-0 header-title">Consulta de Facturas</h4>
                                <p class="text-muted font-14">Filtros</p>
                                <div class="mt-md-0 d-flex align-items-end">
                                    <div class="col-auto m-1">
                                        <label class="form-label">Estatus</label>
                                        <select id="sEstatus" name="estatus" class="form-select" runat="server">
                                            <option value="2">CERRADOS</option>
                                            <option value="1">PENDIENTES</option>
                                        </select>
                                    </div>
                                    <div class="col-auto m-1">
                                        <label class="form-label">Desde:</label>
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaI" runat="server" placeholder="Fecha inicio" autocomplete="off"/>
                                    </div>
            
                                    <div class="col-auto m-1">
                                        <label class="form-label">Hasta:</label>
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaF" runat="server" placeholder="Fecha fin" autocomplete="off"/>
                                    </div>
                                    <div class="col-auto m-1">
                                        <label class="form-label">Ingrese término:</label>
                                        <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscarDatos()" autocomplete="off"/>
                                    </div>
                                    <div class="col-auto m-1">
                                        <asp:Button ID="BtnBuscar" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnBuscar_Click"/>
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
                            <asp:GridView runat="server" ID="gvConsulta" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button runat="server" ID="BtnDetalle" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="DETALLE" OnClick="BtnDetalle_Click" AutoPostBack="False"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_orden" HeaderText="ID ORDEN" SortExpression="id_orden"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
                        
    </div> <!-- container-fluid -->

    <div id="facturaDetalle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Detalle de Inventario</h4>
                    <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                          <div class="col-md-6">
                              
                          </div>
                          <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                             
                              <asp:GridView runat="server" ID="gvFactura" autogeneratecolumns="False" CssClass="table nowrap" width="100%" BorderColor="White">
                                 <Columns>
                                    <asp:BoundField DataField="No_Archivo" HeaderText="Factura" SortExpression="No_Archivo"/>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                             <asp:Button runat="server" ID="BtnOpenArchivo" CssClass="btn form-control-sm btn-success"  Text="PDF" OnClick="BtnOpenArchivo_Click" AutoPostBack="False"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                              </asp:GridView>
                          </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                               
                                    <asp:GridView runat="server" ID="gvDetalleFactura" autogeneratecolumns="True" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        
                                    </asp:GridView>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div><!-- end col -->
                    </div>
                    <!-- end row -->  
 
                </div>
                <div class="modal-footer">
                    
                    <asp:Button CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                </div>
            </div>
        </div>
    </div><!-- /.modal -->

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
        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        });

        $(document).ready(function () {
            $('#gvDetalleFactura').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });


        function buscarDatos() {
            var searchTerm = document.getElementById('txtBusqueda').value.toUpperCase();
            var gridView = document.getElementById('<%= gvConsulta.ClientID %>');
            for (var i = 1; i < gridView.rows.length; i++) {
                var row = gridView.rows[i];
                var found = false;

                for (var j = 0; j < row.cells.length; j++) {
                    var cellText = row.cells[j].innerText.toUpperCase();
                    if (cellText.indexOf(searchTerm) > -1) {
                        found = true;
                        break;
                    }
                }

                row.style.display = found ? "" : "none";
            }
            // Aquí puedes realizar cualquier acción que desees con el contenido del input
        }
    </script>
    
    
</asp:Content>
