<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="inv_vales.aspx.vb" Inherits="Mersol.inv_vales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- third party css -->
    <link href="dist/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
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
                        
                        <div class="row justify-content-between">
                            <div class="col-md-8">
                                <div class="mt-md-0">
                                    <h4 class="mt-0 header-title">SEGUIMIENTO DE CONTROL DE VALES DE ADEUDO ALMACEN </h4>
                                    <p class="text-muted font-14">
                                        Seleccione el Almacen de Ventas
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-2 m-2 d-inline">
                                <asp:Button ID="BtnExcel" CssClass="btn form-control-sm btn-success" runat="server" Text="Descargar Excel" OnClick="BtnExcel_Click" />
                            </div>
                        </div>
                        
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">
                                    
                                    <div class="col-auto m-1">
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaI" runat="server" placeholder="Fecha inicio" />
                                    </div>
            
                                    <div class="col-auto m-1">
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaF" runat="server" placeholder="Fecha fin" />
                                    </div>
                                    <div class="col-auto m-1" id="ocultarSucursal">
                                        <asp:DropDownList ID="DropDownList" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true" Visible="True">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-auto m-1">
                                        <select id="sltEstatus" class="form-select sltEstatus" onchange="personal(this)" runat="server">
                                            <option value="">Seleccione una opción..</option>
                                            <option value="TERMINADO">TERMINADO</option>
                                            <option value="IMPRESO">IMPRESO</option>
                                            <option value="CONCLUIDO">CONCLUIDO/SURT. PARCIAL</option>
                                            <option value="SURTIDO TOTAL">SURTIDO TOTAL</option>
                                        </select>
                                    </div>
                                    <div class="col-auto m-1">
                                        <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscar()" style="width: 200px;"/>
                                    </div>
                                    <div class="col-auto m-1">
                                        <asp:Button ID="BtnAlmacen" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnAlmacen_Click" />
                                    </div>
                                </div>
                            </div><!-- end col-->
                            
                        </div> <!-- end row -->

                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>
        <div class="row">
            <div class="col-md-3">
              <div class="p-2 mb-2 text-black bold">ESTATUS:</div>
            </div>
            <div class="col-md-2">
              <div class="p-2 mb-2 text-black-50" style="background: rgb(250, 229, 211);">TERMINADO</div>
            </div>

            <div class="col-md-2">
              <div class="p-2 mb-2 text-black-50" style="background: rgb(235, 245, 251);">IMPRESO</div>
            </div>

            <div class="col-md-3">
              <div class="p-2 mb-2 text-black-50" style="background: rgb(212, 239, 223);">CONCLUIDO/ SURTIDO TOTAL</div>
            </div>

            <div class="col-md-2">
              <div class="p-2 mb-2 text-black-50" style="background: rgb(249, 231, 159);">SURTIDO PARCIAL</div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <asp:Label ID="txtsucursal" runat="server" CssClass="mt-0 mb-5 header-title" Text=""></asp:Label>        
                        <div class="container row mt-2">
                            <div class="table small">
                                <asp:GridView runat="server" ID="gvVales" autogeneratecolumns="False" CssClass="table dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Serie" HeaderText="FOLIO VALE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Fecha_Emision" HeaderText="FECHA EMISIÓN" ReadOnly="true"/>
                                        <asp:BoundField DataField="Factura_Referencia" HeaderText="FOLIO FACTURA" ReadOnly="true"/>
                                        <asp:BoundField DataField="Id_Cliente" HeaderText="ID CLIENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Cliente" HeaderText="NOMBRE DEL CLIENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Direccion" HeaderText="DIRECCIÓN" ReadOnly="true"/>
                                        <asp:BoundField DataField="Telefonos" HeaderText="TELÉFONO" ReadOnly="true"/>
                                        <asp:BoundField DataField="Codigo_Alterno" HeaderText="CODIGO FABRICANTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Codigo_Interno" HeaderText="CODIGO INTERNO" ReadOnly="true"/>
                                        <asp:BoundField DataField="Descripcion" HeaderText="DESCRIPCIÓN" ReadOnly="true"/>
                                        <asp:BoundField DataField="Cantidad" HeaderText="TOTAL PENDIENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Unidad" HeaderText="UNIDAD" ReadOnly="true"/>
                                        <asp:BoundField DataField="Entregado" HeaderText="CANTIDAD ENTREGADA" ReadOnly="true"/>
                                        <asp:BoundField DataField="Pendiente" HeaderText="CANTIDAD PENDIENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Agente" HeaderText="NOMBRE AGENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Estatus Partida" HeaderText="ESTATUS PARTIDA" ReadOnly="true"/>
                                        <asp:BoundField DataField="Fecha_Movimiento" HeaderText="FECHA ENTREGADA AL CLIENTE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Estatus" HeaderText="ESTATUS VALE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Causa_Vale" HeaderText="CAUSA VALE" ReadOnly="true"/>
                                        <asp:BoundField DataField="Observaciones" HeaderText="OBSERVACIONES" ReadOnly="true"/>
                                    </Columns>
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

    !-- Plugins js-->
    <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-pickers.init.js"></script>

    <script>
        $(document).ready(function () {
            $('#gvrecibos').DataTable({
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        });

        function buscar() {
            var searchTerm = document.getElementById('txtBusqueda').value.toUpperCase();
            var gridView = document.getElementById('<%= gvVales.ClientID %>');
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
