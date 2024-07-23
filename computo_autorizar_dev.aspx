<%@ Page Title="Autorizar Devolución" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="computo_autorizar_dev.aspx.vb" Inherits="Mersol.computo_autorizar_dev" %>
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
                                    <h4 class="mt-0 header-title">AUTORIZAR DEVOLUCIÓN DE EQUIPO</h4>
                                    <p class="text-muted font-14">
                                        SUCURSAL <asp:Label ID="txtSucursal" runat="server" CssClass="" Text=""></asp:Label>
                                    </p>
                                    <div class="mt-md-0 d-flex">
                                        <div class="col-auto m-2">
                                            <asp:DropDownList ID="ddlSucursales" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true"  AutoPostBack="True" OnSelectedIndexChanged="ddlSucursales_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto m-2">
                                            <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscarDatos()"/>
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
                            <div class="container row">
                                <div class="table small">
                                    <asp:GridView runat="server" ID="gvConsulta" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="BtnDetalle" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="AUTORIZAR" OnClick="BtnDetalle_Click" AutoPostBack="False"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Id_Usuario" HeaderText="ID" SortExpression="Id_Usuario"/>
                                            <asp:BoundField DataField="Nombre" HeaderText="NOMBRE"/>
                                            <asp:BoundField DataField="Fecha_Alta" HeaderText="FECHA ALTA" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                            <asp:BoundField DataField="Departamento" HeaderText="DEPARTAMENTO" SortExpression="Departamento"/>
                                            <asp:BoundField DataField="Sucursal" HeaderText="SUCURSAL" SortExpression="Sucursal"/> 
                                            <asp:BoundField DataField="Fecha_Registro" HeaderText="FECHA REGISTRO" HtmlEncode="False" DataFormatString = "{0:dd/MM/yyyy}" ReadOnly="True"/>
                                            <asp:BoundField DataField="Puesto" HeaderText="PUESTO"/>
                                            <asp:BoundField DataField="Personal" HeaderText="PERSONAL" />
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

    <div id="autorizarAlerta" class="modal fade show" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center">
                        <i class="dripicons-warning h1 text-warning"></i>
                        <h4 class="mt-2" id="titleWarning" runat="server">Advertencia</h4>
                        <p class="mt-3" id="cuerpoWarning" runat="server">¿Está seguro de autorizar la devolución del equipo de <asp:Label ID="txtNombre" runat="server" CssClass="" Text=""></asp:Label> ?</p>
                        
                        <asp:Button runat="server" ID="BtnAutorizar" CssClass="btn form-control-sm btn-primary"  Text="Si" OnClick="BtnAutorizar_Click" AutoPostBack="False"/>
                        <button type="button" class="btn btn-warning my-2" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
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