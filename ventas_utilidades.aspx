<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="ventas_utilidades.aspx.vb" Inherits="Mersol.ventas_utilidades" %>
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

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <asp:Label ID="txtsucursal" runat="server" CssClass="mt-0 mb-5 header-title" Text=""></asp:Label>        
                        <div class="container row mt-2">
                            <div class="table small">
                                <asp:GridView runat="server" ID="gvutilidades" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                      
                                </asp:GridView>
                                <div id="tablaUsuarios"></div>
                            </div>
                        </div>

                    </div>
                </div>
                       
            </div>
        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Buttons example</h4>
                        <table class="table" id="datatable-buttons">
                        <thead>
                        <tr>
                            <th>Movimiento</th>
                            <th>Fecha Emisión</th>
                            <th>Mov</th>
                            <th>MovID</th>
                            <th>Venta_MXN</th>
                            <th>% Utilidad_MXN</th>
                        </tr>

                        </thead>
                        <tbody id="tableUtilidades">
                        </tbody>

                        </table>
                    </div>
                </div>
                               
            </div>
        </div>
                        
    </div> <!-- container-fluid -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="dist/assets/libs/jquery/jquery.min.js"></script>
    <script src="dist/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="dist/assets/libs/node-waves/waves.min.js"></script>
    <script src="dist/assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="dist/assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
    <script src="dist/assets/libs/feather-icons/feather.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-advanced.init.js"></script>

    <!-- third party js -->
    <script src="dist/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="dist/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="dist/assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="dist/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="dist/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
    <script src="dist/assets/libs/pdfmake/build/pdfmake.min.js"></script>
    <script src="dist/assets/libs/pdfmake/build/vfs_fonts.js"></script>
    <!-- third party js ends -->

    <!-- Datatables init -->
    <script src="dist/assets/js/pages/datatables.init.js"></script>

    <script>

        //utilidades();

        $(document).ready(function () {
            $('#gvasisfxdia').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });


        var usuarios = [];
        $(document).ready(function () {
            $.getJSON("src/data/utilidades.json", function (json) {
                var datos = json;
                //alert(json.length)
                var conthtml = "";
                for (i in datos) {
                    //alert(datos[i].nombre)

                    conthtml += '<tr>'
                    conthtml += '<td>' + datos[i].mov + ' ' + datos[i].movid + '</td>'
                    conthtml += '<td>' + datos[i].fechaemision + '</td>';
                    conthtml += '<td>' + datos[i].Mov1 + '</td>';
                    conthtml += '<td>' + datos[i].movid + '</td>';
                    conthtml += '<td>' + datos[i].costo + '</td>';
                    conthtml += '<td>' + datos[i].Utilidad_MXN + '</td>';
                    conthtml += '</tr>'
                }


                document.getElementById("tableUtilidades").innerHTML = conthtml;
            });
        });


        function utilidades() {
            $.ajax({
                type: "POST",
                url: "ventas_utilidades.aspx/DatosJson",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    datos = JSON.parse(response.d);
                    var conthtml = "";
                    
                    for (var i = 0; i < 5; i++) {

                        conthtml += '<tr>'
                        conthtml += '<td>' + datos[i]["mov"] + ' ' + datos[i]["movid"] + '</td>'
                        conthtml += '<td>' + datos[i]["fechaemision"] + '</td>';
                        conthtml += '<td>' + datos[i]["Cliente"] + '</td>'
                        conthtml += '<td>' + datos[i]["Agente"] + '</td>';
                        conthtml += '<td>' + datos[i]["mov"] + '</td>';
                        conthtml += '<td>' + datos[i]["movid"] + '</td>';
                        conthtml += '<td>' + datos[i]["Venta_MXN"] + '</td>';
                        conthtml += '<td>' + datos[i]["Utilidad_MXN"] + '</td>';
                        conthtml += '<td>' + datos[i]["%"] + '</td>';
                        conthtml += '</tr>'
                    }

                    
                    document.getElementById("tableUtilidades").innerHTML = conthtml;
                },
                error: function (data) {
                    var errors = data.responseJSON;
                    if (errors) {
                        $.each(errors, function (i) {
                            console.log(errors[i]);
                        });
                    }
                },
                timeout: 3600000,
            });
            return false;
        }


    </script>
    
    
</asp:Content>
