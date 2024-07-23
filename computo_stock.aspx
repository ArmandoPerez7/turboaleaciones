<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="computo_stock.aspx.vb" Inherits="Mersol.computo_stock" %>
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
                        <div class="card-body">
                            <div class="row justify-content-between">
                                <div class="col-md-9">
                                    <h4 class="mt-0 header-title">STOCK DE COMPUTO MERCADO DE LA SOLDADURA DEL SURESTE</h4>
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
                                    <asp:Button ID="BtnExcel" CssClass="btn form-control-sm btn-success" runat="server" Text="Exportar Excel" OnClick="BtnExcel_Click" />
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
                                    <asp:GridView runat="server" ID="gvstock" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Inventario" HeaderText="Inventario" /> 
                                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                            <asp:BoundField DataField="Fecha_Alta" HeaderText="Fecha Alta" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                            <asp:BoundField DataField="Serie" HeaderText="Serie" />
                                            <asp:BoundField DataField="Marca" HeaderText="Marca" />
                                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                                            <asp:BoundField DataField="Color" HeaderText="Color" />
                                            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />
                                            <asp:BoundField DataField="Valor Activo" HeaderText="Valor Activo" />
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
            var gridView = document.getElementById('<%= gvstock.ClientID %>');
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