<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="Recibos.aspx.vb" Inherits="Mersol.Recibos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- third party css -->
    <link href="dist/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-select-bs5/css//select.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

    <style>
        .dtHorizontalExampleWrapper {
          max-width: 100%;
          display: block;
          overflow-x: auto;
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
                        <h4 class="mt-0 header-title">Control de Recibos</h4>
                        <p class="text-muted font-14 mb-3">
                            
                        </p>

                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dt-buttons btn-group flex-wrap mb-2">  
                                    <asp:Button ID="Button1" class="btn btn-success buttons-pdf buttons-html5" runat="server" Text="EXCEL"  OnClick="BtnExcel_Click"/> 
                                </div>
                            </div>
                        </div>
                        
                        <div class="container row">
                            <div class="table small">
                                <asp:GridView runat="server" ID="gvrecibos" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" 
                                            SortExpression="Sucursal" />
                                        <asp:BoundField DataField="INFORMACION DE PEDIDO" HeaderText="Información de Pedido" 
                                            SortExpression="INFORMACION DE PEDIDO" />
                                        <asp:BoundField DataField="PROVEEDOR" HeaderText="Proveedor" 
                                            SortExpression="PROVEEDOR" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                                            SortExpression="Nombre" />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" 
                                            SortExpression="Cantidad" />
                                        <asp:BoundField DataField="Factura" HeaderText="No° Factura" 
                                            SortExpression="Factura" />
                                        <asp:BoundField DataField="Fecha_ReciboFletera" HeaderText="Fecha de Recibo Fletera" 
                                            SortExpression="Fecha_ReciboFletera" />
                                        <asp:BoundField DataField="CajaBulto" HeaderText="Caja/Bulto" 
                                            SortExpression="CajaBulto" />
                                        <asp:BoundField DataField="Fecha_EnvioSistema" HeaderText="Fecha de Envío Sistema" 
                                            SortExpression="Fecha_EnvioSistema" />
                                        <asp:BoundField DataField="Fecha_EnvioEntrada" HeaderText="Fecha de Envío Entrada" 
                                            SortExpression="Fecha_EnvioEntrada" />
                                        <asp:BoundField DataField="Fecha_RecibeEntrada" HeaderText="Fecha Recibe Entrada" 
                                            SortExpression="Fecha_RecibeEntrada" />
                                        <asp:BoundField DataField="Fecha_ElaboraEntrada" HeaderText="Fecha Elaborada Entrada" 
                                            SortExpression="Fecha_ElaboraEntrada" />
                                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" 
                                            SortExpression="Observaciones" />
                                        <asp:BoundField DataField="Tiempo Respuesta 2" HeaderText="Tiempo de Respuesta" 
                                            SortExpression="Tiempo Respuesta 2" />
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

    <script>
        $(document).ready(function () {
            $('#gvrecibos').DataTable({
                "scrollX": true
            });
            $('.dataTables_length').addClass('bs-select');
        });
    </script>
    
</asp:Content>
