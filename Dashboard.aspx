<%@ Page Title="Dashboard - Sistema Mesol" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="Dashboard.aspx.vb" Inherits="Mersol.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="row">

            <div class="col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0">Total Activos</h4>

                        <div class="widget-chart text-center">
                            <div id="total_activos" dir="ltr" style="height: 245px;" class="morris-chart"></div>
                            <ul class="list-inline chart-detail-list mb-0">
                                <li class="list-inline-item">
                                    <h5 style="color: #188ae2;"><i class="fa fa-circle me-1"></i>Equipo activos</h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- end col -->

            <div class="col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0">En linea</h4>

                        <div class="widget-chart text-center">
                            <div id="en_linea" dir="ltr" style="height: 245px;" class="morris-chart"></div>
                            <ul class="list-inline chart-detail-list mb-0">
                                <li class="list-inline-item">
                                    <h5 style="color: #10c469;"><i class="fa fa-circle me-1"></i>Activos</h5>
                                </li>
                                <li class="list-inline-item">
                                    <h5 style="color: #f05050;"><i class="fa fa-circle me-1"></i>Inactivos</h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- end col -->

            <div class="col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0">Total Ticket</h4>

                        <div class="widget-chart text-center">
                            <div id="total_ticket" dir="ltr" style="height: 245px;" class="morris-chart"></div>
                            <ul class="list-inline chart-detail-list mb-0">
                                <li class="list-inline-item">
                                    <h5 style="color: #f9c851;"><i class="fa fa-circle me-1"></i>Pendientes</h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- end col -->

            <div class="col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="dropdown float-end">
                            <a href="#" class="dropdown-toggle arrow-none card-drop">
                                <i class="mdi mdi-calendar-blank-outline"></i>
                            </a>
                        </div>
                        <h4 class="header-title mt-0">Mantenimiento</h4>

                        <div class="widget-chart text-center">
                            <div id="mantenimiento" dir="ltr" style="height: 245px;" class="morris-chart"></div>
                            <ul class="list-inline chart-detail-list mb-0">
                                <li class="list-inline-item">
                                    <h5 style="color: #f9c851;"><i class="fa fa-circle me-1"></i>Vencidos</h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- end col -->

        </div>
        <!-- end row --> 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- knob plugin -->
    <script src="dist/assets/libs/jquery-knob/jquery.knob.min.js"></script>

    <!--Morris Chart-->
    <script src="dist/assets/libs/morris.js06/morris.min.js"></script>
    <script src="dist/assets/libs/raphael/raphael.min.js"></script>

    <!-- Dashboar init js-->
    <script src="dist/assets/js/pages/dashboard.init.js"></script>
    <script>
        $(document).ready(function () {
            
        })

        !function ($) {
            "use strict";
            var datos;
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetJson",
                data: '{ Sucursal: "' + <%=Session("Id_Sucursal")%> +'" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    datos = JSON.parse(response.d);
                    Dashboard1.prototype.init(datos[0]["ACTIVO"], datos[0]["INACTIVO"], datos[0]["PENDIENTES"], datos[0]["VENCIDOS"]);
                }
            });

            var Dashboard1 = function () {
                this.$realData = [];
            };

            //creates Bar chart
            Dashboard1.prototype.createBarChart = function (element, data, xkey, ykeys, labels, lineColors) {
                Morris.Bar({
                    element: element,
                    data: data,
                    xkey: xkey,
                    ykeys: ykeys,
                    labels: labels,
                    hideHover: 'auto',
                    resize: true, //defaulted to true
                    gridLineColor: 'rgba(173, 181, 189, 0.1)',
                    barSizeRatio: 0.2,
                    dataLabels: false,
                    barColors: lineColors
                });
            },

            //creates line chart
            Dashboard1.prototype.createLineChart = function (element, data, xkey, ykeys, labels, opacity, Pfillcolor, Pstockcolor, lineColors) {
                Morris.Line({
                    element: element,
                    data: data,
                    xkey: xkey,
                    ykeys: ykeys,
                    labels: labels,
                    fillOpacity: opacity,
                    pointFillColors: Pfillcolor,
                    pointStrokeColors: Pstockcolor,
                    behaveLikeLine: true,
                    gridLineColor: 'rgba(173, 181, 189, 0.1)',
                    hideHover: 'auto',
                    resize: true, //defaulted to true
                    pointSize: 0,
                    dataLabels: false,
                    lineColors: lineColors
                });
            },

            //creates Donut chart
            Dashboard1.prototype.createDonutChart = function (element, data, colors) {
                Morris.Donut({
                    element: element,
                    data: data,
                    resize: true, //defaulted to true
                    colors: colors,
                    backgroundColor: 'transparent'
                });
            },


            Dashboard1.prototype.init = function (activos, inactivos, pendientes, vencidos) {

                var self = this;

                $('#total_activos').empty();
                $('#en_linea').empty();
                $('#total_ticket').empty();
                $('#mantenimiento').empty();

                //creating donut chart
                var $donutData = [
                    { label: "Activos", value: activos },
                ];
                this.createDonutChart('total_activos', $donutData, ['#188ae2']);

                //creating donut chart
                var $donutData = [
                    { label: "Activos", value: activos },
                    { label: "Inactivos", value: inactivos }
                ];
                this.createDonutChart('en_linea', $donutData, ['#10c469', '#f05050']);

                //creating donut chart
                var $donutData = [
                   { label: "Pendientes", value: pendientes }
                ];
                this.createDonutChart('total_ticket', $donutData, ['#f9c851']);

                //creating donut chart
                var $donutData = [
                   { label: "Vencidos", value: vencidos }
                ];
                this.createDonutChart('mantenimiento', $donutData, ['#f9c851']);

            },
            //init
            $.Dashboard1 = new Dashboard1, $.Dashboard1.Constructor = Dashboard1
        }(window.jQuery),

        //initializing 
        function ($) {
            "use strict";
            $.Dashboard1.init();

            window.addEventListener('adminto.setBoxed', function (e) {
                $.Dashboard1.init();
            });

            window.addEventListener('adminto.setFluid', function (e) {
                $.Dashboard1.init();
            })
        }(window.jQuery);

    </script>
</asp:Content>
