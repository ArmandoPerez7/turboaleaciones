<%@ Page Title="TB31 Arrollo Moreno" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="tb31_arrollomoreno.aspx.vb" Inherits="Mersol.tb31_arrollomoreno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- third party css -->
        <link href="dist/assets/libs/datatables.net/2.0.5/css/dataTables.bootstrap5.css" rel="stylesheet"
            type="text/css" />
        <link href="dist/assets/libs/datatables.net/responsive/3.0.2/css/responsive.bootstrap5.css" rel="stylesheet"
            type="text/css" />
        <link href="dist/assets/libs/datatables.net/buttons/3.0.2/css/buttons.bootstrap5.css" rel="stylesheet"
            type="text/css" />

        <!-- third party css end -->

        <!-- third party css -->
        <link href="dist/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">

            <div class="row" id="ocultar" runat="server" visible="true"> 
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="mt-0 header-title">DataLog TB31 Arrollo Moreno</h4>
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
    
                            <table id="datatable" class="table table-centered dataTable" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>TagName</th>
                                        <th>TagIndex</th>
                                        <th>DateAndTime</th>
                                        <th>Val</th>
                                    </tr>
                                </thead>
                                <tbody id="datos">
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                    <td><p class="placeholder-glow"><span class="placeholder col-12"></span></p></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                               
                </div>
            </div> <!-- end row -->

    </div>
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">

        <!-- third party js -->
        <script src="dist/assets/libs/datatables.net/2.0.5/js/dataTables.js"></script>
        <script src="dist/assets/libs/datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script>
        <script src="dist/assets/libs/datatables.net/responsive/3.0.2/js/dataTables.responsive.js"></script>
        <script src="dist/assets/libs/datatables.net/responsive/3.0.2/js/responsive.bootstrap5.js"></script>
        <script src="dist/assets/libs/datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
        <script src="dist/assets/libs/datatables.net/buttons/3.0.2/js/buttons.bootstrap5.js"></script>
        <script src="dist/assets/libs/jszip/3.10.1/jszip.min.js"></script>
        <script src="dist/assets/libs/pdfmake/build/pdfmake.min.js"></script>
        <script src="dist/assets/libs/pdfmake/build/vfs_fonts.js"></script>
        <script src="dist/assets/libs/datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
        <script src="dist/assets/libs/datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
        <script src="dist/assets/libs/datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>
        <!-- third party js ends -->
        <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
        <!-- Plugins js-->
        <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <script>

            var dataTableIsInitialized = false;

            //cargar();
            

            function cargar() {

                console.log("cargado");

                if (dataTableIsInitialized) {
                    $('#datatable').DataTable().destroy();
                }

                $.ajax({
                    type: "POST",
                    url: "tb31_arrollomoreno.aspx/GetJson",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        oc = JSON.parse(response.d);

                        document.getElementById("datatable").innerHTML = "";
                        var conthtml = "";

                        conthtml += '<thead>';
                        conthtml += '<tr>';
                        conthtml += '<th>TagName</th>';
                        conthtml += '<th>TagIndex</th>';
                        conthtml += '<th>DateAndTime</th>';
                        conthtml += '<th>Val</th>';
                        conthtml += '</tr>';
                        conthtml += '</thead>';

                        conthtml += '<tbody>';
                        for (var i = 0; i < oc.length; i++) {

                            conthtml += '<tr>';
                            conthtml += '<td>' + oc[i]["TagName"] + '</td>';
                            conthtml += '<td>' + oc[i]["TagIndex"] + '</td>';
                            //conthtml += '<td>' + moment(oc[i]["FechaEmision"]).format('DD/MM/YYYY HH:MM:SS') + '</td>';
                            conthtml += '<td>' + oc[i]["DateAndTime"] + '</td>';
                            conthtml += '<td>' + oc[i]["Val"] + '</td>';
                            conthtml += '</tr>';

                        }

                        conthtml += '</tbody>';
                        //$('#datos').html(conthtml);
                        document.getElementById("datatable").innerHTML = conthtml;


                        var tableN = $("#datatable").DataTable({
                            scrollX: true,
                            layout: {
                                topStart: {
                                    buttons: [
                                        {
                                            extend: 'copy',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'excel',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'pdf',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'colvis',
                                            postfixButtons: [
                                                {
                                                    extend: 'columnToggle',
                                                    text: 'MARCAR/DESMARCAR TODO',
                                                }
                                            ]
                                        }
                                    ]
                                }
                            },
                            language: {
                                url: 'dist/assets/libs/datatables.net/2.0.5/i18n/es-ES.json',
                            }
                        });

                        //tableN.buttons().container().appendTo("#datatable_wrapper .col-md-6:eq(0)");

                        dataTableIsInitialized = true;

                        
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
            }

            setInterval(cargar(), 10000);

        </script>

    </asp:Content>