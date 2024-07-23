<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="ultimas_entradas.aspx.vb" Inherits="Mersol.ultimas_entradas" %>
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
                        <h4 class="mt-0 header-title">Utimas Entradas</h4>
                        <p class="text-muted font-14">
                            Seleccione el Almacen de Ventas
                        </p>
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">
                                    <div class="col-auto m-2" id="ocultarSucursal">
                                        <asp:DropDownList ID="DropDownList" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true" Visible="True">
                                        </asp:DropDownList>
                                    </div>
            
                                    <div class="col-auto m-2">
                                        <asp:Button ID="BtnAlmacen" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnAlmacen_Click" />
                                    </div>
                                    
                                </div>
                            </div><!-- end col-->
                            <div class="col-md-2 m-2 d-inline">
                                <asp:Button ID="BtnExcel" CssClass="btn form-control-sm btn-success" runat="server" Text="Descargar Excel" OnClick="BtnExcel_Click" />
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
                                <asp:GridView runat="server" ID="gvrecibos" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                              
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
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });
    </script>
    
    
</asp:Content>
