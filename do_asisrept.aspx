<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="do_asisrept.aspx.vb" Inherits="Mersol.do_asisrept" %>
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
                        <h4 class="mt-0 header-title">Reporte de Asistencia por rango</h4>
                        <p class="text-muted font-14">
                            Seleccione una fecha
                        </p>
                        <div class="col-md-2 m-2 d-flex">
                            <asp:Button ID="BtnPDF" CssClass="btn form-control-sm btn-success" runat="server" Text="Descargar PDF" OnClick="BtnPDF_Click" />
                        </div>
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">
                                    <div class="col-auto m-1">
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFecha" runat="server" placeholder="Fecha inicio" data-date-autoclose="true" autocomplete="off"/>
                                    </div>
            
                                    <div class="col-auto m-1">
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaF" runat="server" placeholder="Fecha fin" data-date-autoclose="true" autocomplete="off"/>
                                    </div>

                                    <div class="col-auto m-1" id="ocultarSucursal">
                                        <asp:DropDownList ID="DropDownList" class="form-select mySelectReport" onchange="sucursal()" runat="server" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-4 m-1">
                                        <div>
                                            <select class="usuarios form-control select2-multiple" id="usuarios" data-toggle="select2" onchange="agregarUsuarios();" data-width="100%" multiple="multiple" data-placeholder="Seleccione una o varias opciones ...">
                                            </select>
                                            <asp:HiddenField id="persona" runat="server" />
                                        </div> <!-- end col -->
                                    </div>

                                    <div class="col-auto m-1">
                                        <asp:Button ID="BtnAsistencia" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnAsistencia_Click" />
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
                        <asp:Label ID="txtsucursal" runat="server" CssClass="mt-0 mb-5 header-title" Text=""></asp:Label>        
                        <div class="container row mt-2">
                            <div class="table small" id="resutadoTable">
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

        sucursal();

        $(document).ready(function () {
            $('#gvasisfxdia').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        }); 


        function sucursal() {
            var selectedSucursal = document.getElementById('<%= DropDownList.ClientID %>').value;
            
            $.ajax({
                type: "POST",
                url: "do_asisrept.aspx/GetJson",
                data: '{ idSucursal: "' + selectedSucursal + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    datos = JSON.parse(response.d);
                    //var conthtml = "";
                    $("#usuarios").empty();
                    $("#usuarios").append('<option value="TODOS">TODOS</option>');
                    for (var i = 0; i < datos.length; i++) {
                        //sucursales.push(datos[i]["SUCURSAL"]);
                        //conthtml += '<option value="' + datos[i]["Personal"] + '">' + datos[i]["NombreCompleto"] + '</option>'
                        $("#usuarios").append('<option value="' + datos[i]["Personal"] + '">' + datos[i]["NombreCompleto"] + '</option>');
                    }
                    //document.getElementById("usuarios").innerHTML = conthtml;
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

        function agregarUsuarios(){
            var text = $('#usuarios option:selected').toArray().map(item => item.value).join();
            document.getElementById('<%= persona.ClientID %>').value = text;
            return text 
        }


        $(function () {
            $("[id*=BtnAsistencia]").click(function () {
                var fechaI = $("[id*=txtFecha]").val();
                var fechaF = $("[id*=txtFechaF]").val();
                var selectedSucursal = document.getElementById('<%= DropDownList.ClientID %>').value;
                var persona = agregarUsuarios()
                $.ajax({
                    type: "POST",
                    url: "do_asisrept.aspx/DatosJson",
                    data: '{ fechaI: "' + fechaI + '", fechaF: "' + fechaF + '", idSucursal: "' + selectedSucursal + '", persona: "' + persona + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        datos = JSON.parse(response.d);
                        var conthtml = "";
                        conthtml += '<table class="table" id="gvasisfxdia">';
                        conthtml += '<thead><tr>';
                            conthtml += '<th scope="col">Persona</th>';
                            conthtml += '<th scope="col">Nombre</th>';
                            conthtml += '<th scope="col">Fecha</th>';
                            conthtml += '<th scope="col">Entrada</th>';
                            conthtml += '<th scope="col">Salida</th>';
                            conthtml += '<th scope="col">Tiempo</th>';
                            conthtml += '<th scope="col">Retardo</th>';
                            conthtml += '<th scope="col">Salida</th>';
                            conthtml += '<th scope="col">Entrada</th>';
                            conthtml += '<th scope="col">Salida Pre.</th>';
                        conthtml += '</tr></thead ><tbody>';
                        for (var i = 0; i < datos.length; i++) {
                            
                            conthtml += '<tr>'
                            conthtml += '<th scope="row">' + datos[i]["Personal"] +'</th>'
                            conthtml += '<td>' + datos[i]["Nombre"] + '</td>';
                            conthtml += '<th scope="row">' + datos[i]["FechaD"] + '</th>'
                            conthtml += '<td>' + datos[i]["Entrada"] + '</td>';
                            conthtml += '<td>' + datos[i]["Salida"] + '</td>';
                            conthtml += '<td>' + datos[i]["TotalHoras"] + '</td>';
                            conthtml += '<td>' + datos[i]["Retardo"] + '</td>';
                            conthtml += '<td>' + datos[i]["SalidaC"] + '</td>';
                            conthtml += '<td>' + datos[i]["EntradaC"] + '</td>';
                            conthtml += '<td>' + datos[i]["SalidaA"] + '</td>';
                            conthtml += '</tr>'
                        }

                        conthtml += '</tbody></table>';
                        document.getElementById("resutadoTable").innerHTML = conthtml;
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
            });
        });

    </script>
    
    
</asp:Content>
