<%@ Page Title="Computo Sucursal" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="computo_sucursal.aspx.vb" Inherits="Mersol.computo_sucursal" %>
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
    <style>
    .dtHorizontalExampleWrapper {
      max-width: 100%;
      max-height: 100vh;
      display: block;
      overflow-x: auto;
      overflow-y: auto;
      white-space: nowrap;
      padding: 0 0 40px 0;
      display: block;
    }

    .gvDetalleInvetatio{
        font-size: 13px;
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

    .btn-detalle{
        font-size: 10px !important;
    }
    .priority-1{
    display:none;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
            <div class="row" id="ocultar" runat="server" visible="true"> 
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            
                            <div class="row justify-content-between">
                                <div class="col-md-9">
                                    <h4 class="mt-0 header-title">INVENTARIO DE COMPUTO MERCADO DE LA SOLDADURA DEL SURESTE</h4>
                                    <p class="text-muted font-14">
                                        SUCURSAL <asp:Label ID="txtSucursal" runat="server" CssClass="" Text=""></asp:Label>
                                    </p>
                                    <div class="mt-md-0 d-flex">
                                        <div class="col-auto m-2">
                                            <asp:DropDownList ID="ddlSucursales" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true"  AutoPostBack="True" OnSelectedIndexChanged="ddlSucursales_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto m-2">
                                            <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscarComputo()"/>
                                        </div>
                                    </div>
                                </div><!-- end col-->
                                <div class="col-md-2 m-2 d-inline">
                                    <div class="col-auto mt-2">
                                        <asp:Button ID="BtnExcel" CssClass="btn form-control-sm btn-success" runat="server" Text="Exportar Excel" OnClick="BtnExcel_Click" />
                                    </div>
                                    <div class="col-auto mt-2">
                                        <asp:Button ID="BtnPendienteDevolucion" CssClass="btn form-control-sm btn-warning" runat="server" Text="Devoluciones " OnClick="BtnPendienteDevolucion_Click"/>
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
                            <div class="container row">
                                <div class="table small">
                                    <asp:GridView runat="server" ID="gvcomputo" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="BtnDetalle" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="DETALLE" OnClick="BtnDetalle_Click" AutoPostBack="False"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Id_Activo" HeaderText="ID ACTIVO" SortExpression="Id_Activo"/>
                                            <asp:BoundField DataField="Ip" HeaderText="IP"/>
                                            <asp:BoundField DataField="Serie" HeaderText="SERIE" SortExpression="Serie"/>
                                            <asp:BoundField DataField="Fecha_Alta" HeaderText="FECHA ALTA" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                            <asp:BoundField DataField="Usuario Asignado" HeaderText="USUARIO" SortExpression="Usuario Asignado"/> 
                                            <asp:BoundField DataField="Descripcion" HeaderText="TIPO"/>
                                            <asp:BoundField DataField="Sucursal" HeaderText="SUCURSAL" />
                                            <asp:BoundField DataField="Valor del Activo" HeaderText="VALOR ACTIVO"/>
                                            <asp:BoundField DataField="Estatus" HeaderText="ESTATUS"/>
                                            <asp:BoundField DataField="Puesto" HeaderText="PUESTO"/>
                                            <asp:BoundField DataField="Departamento Empleado" HeaderText="AREA"/>
                                            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div>

        </div>
        <!-- end row -->


        <div id="computoDetalle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detalle de Inventario</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                              <div class="col-md-6">
                                  <p class="sub-header">Usuario: <asp:Label ID="txtUsuario" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                                  <p class="sub-header">Serie: <asp:Label ID="txtSerie" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                              </div>
                              <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                                  <asp:Button runat="server" ID="BtnResponsiva" CssClass="btn form-control-sm btn-success"  Text="Responsiva" OnClick="BtnResponsiva_Click" AutoPostBack="False"/>
                              </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        

                                        <asp:GridView runat="server" ID="gvDetalleInvetatio" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="#" HeaderText="#" />
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                                <asp:BoundField DataField="Serie" HeaderText="Serie" />
                                                <asp:BoundField DataField="Marca/Modelo" HeaderText="Marca/Modelo" />
                                                <asp:BoundField DataField="Fecha Asiganada" HeaderText="Fecha Asiganada" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                                <asp:BoundField DataField="Id_Activo" HeaderText="Id_Activo" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                                <asp:BoundField DataField="Id_Inventario" HeaderText="Id_Inventario" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                                <asp:BoundField DataField="Id_Pieza" HeaderText="Id_Pieza" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            </Columns>
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

        
        <div id="computoResponsiva" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Responsiva</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                              <div class="col-md-12">
                                  <p class="sub-header">Usuario: <asp:Label ID="txtUsuarioRe" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                              </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <asp:GridView runat="server" ID="gvDetalleResponsiva" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Serie" HeaderText="Serie" />
                                                <asp:BoundField DataField="Id_Responsiva" HeaderText="# Responsiva" />
                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" ID="BtnOpenResponsiva" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="Ver" OnClick="BtnOpenResponsiva_Click" AutoPostBack="False"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="BtnRegresar" CssClass="btn form-control-sm btn-primary"  Text="Regresar" OnClick="BtnRegresar_Click" AutoPostBack="False"/>
                        <asp:Button CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->
    </div> <!-- container-fluid -->

    <div id="DetalleRecepcion" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
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
                              <p class="sub-header">Usuario: <asp:Label ID="txtusuarioRep" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                          </div>
                          <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                          </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                
                                    <asp:GridView runat="server" ID="gvRecepcion" autogeneratecolumns="False" CssClass="table dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="#" HeaderText="#" ReadOnly="true"/>
                                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="true"/>
                                            <asp:BoundField DataField="Serie" HeaderText="Serie" ReadOnly="true"/>
                                            <asp:BoundField DataField="Marca/Modelo" HeaderText="Marca/Modelo" ReadOnly="true"/>
                                            <asp:BoundField DataField="Fecha Asiganada" HeaderText="Fecha Asiganada" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                            <asp:BoundField DataField="Id_Activo" HeaderText="Id_Activo" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Id_Inventario" HeaderText="Id_Inventario" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Id_Pieza" HeaderText="Id_Pieza" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:TemplateField HeaderText="Checks">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chbItem" runat="server" AutoPostBack="False"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Observaciones">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtObeservacion" runat="server"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div><!-- end col -->
                    </div>
                    <!-- end row -->  
 
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                    <asp:Button runat="server" ID="BtnGuardarRep" CssClass="btn form-control-sm btn-primary"  Text="Guardar" OnClick="BtnGuardarRep_Click" AutoPostBack="False"/>
                </div>
            </div>
        </div>
    </div><!-- /.modal -->

    <div id="devolucionDetalle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Devoluciones pendientes</h4>
                    <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                     <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                
                                    <asp:GridView runat="server" ID="gvDevoluciones" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="BtnDevolucion" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="Devolución" OnClick="BtnDevolucion_Click" AutoPostBack="False"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Dato" HeaderText="ACTIVO" />
                                            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                                            <asp:BoundField DataField="Departamento" HeaderText="DEPARTAMENTO" />
                                            <asp:BoundField DataField="Puesto" HeaderText="PUESTO" />
                                            <asp:BoundField DataField="Estatus" HeaderText="ESTATUS" />
                                            <asp:BoundField DataField="Id_DetalleUsuario" HeaderText="Id_DetalleUsuario" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                        </Columns>
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

    <!-- Plugins js-->
    <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-pickers.init.js"></script>

    <!-- Plugins js -->
    <script src="dist/assets/libs/dropify/js/dropify.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-fileuploads.init.js"></script>

    <script>

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        }); 

        $(document).ready(function () {
            $('#gvcomputo').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        function buscarComputo() {
            var searchTerm = document.getElementById('txtBusqueda').value.toUpperCase();
            var gridView = document.getElementById('<%= gvcomputo.ClientID %>');
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