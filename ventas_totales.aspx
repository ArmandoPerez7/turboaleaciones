<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="ventas_totales.aspx.vb" Inherits="Mersol.ventas_totales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Plugins css -->
    <link href="dist/assets/libs/spectrum-colorpicker2/spectrum.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/chartist/chartist.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">

      <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <h4 class="header-title">Reportes de Ventas</h4>
                    <p class="sub-header">
                       
                    </p>
    
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="form-label">Fecha Inicio</label>
                            <input type="text" class="form-control date" data-provide="datepicker" id="txtinicio" placeholder="Ingrese una fecha" />
                        </div>
                        <div class="col-auto">
                            <label class="form-label">Fecha fin</label>
                            <input type="text" class="form-control date" data-provide="datepicker" id="txtfin" placeholder="Ingrese una fecha" />
                        </div>
                        
                        <div class="col-auto">
                            <br />
                            <button type="submit" class="btn btn-primary waves-effect waves-light" id="btnEnviar">Enviar</button>
                        </div>
                    </div>

                </div> <!-- end card-body -->
            </div> <!-- end card -->
        </div> <!-- end col -->
    </div>

        <div class="row" id="mostrar_reporte1">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Villahermosa</h4>
                        <div class="text-center">
                            <ul class="list-inline chart-detail-list">
                                <li class="list-inline-item">
                                    <h5 style="color: #10c469;"><i class="mdi mdi-checkbox-blank-circle"></i> Ventas Totales</h5>
                                </li>
                                <li class="list-inline-item">
                                    <h5 style="color: #ff5b5b;"><i class="mdi mdi-checkbox-blank-circle"></i> Devoluciones</h5>
                                </li>
                                <li class="list-inline-item">
                                    <h5 style="color: #f9c851;"><i class="mdi mdi-checkbox-blank-circle"></i> Descuento</h5>
                                </li>
                            </ul>
                        </div>
                        <div id="multi-line-chart1" class="ct-chart ct-golden-section"></div>

                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla1">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte2">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Paraíso</h4>    
                        <div id="multi-line-chart2" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla2">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte3">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Monterrey</h4>    
                        <div id="multi-line-chart3" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla3">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte4">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Veracruz</h4>    
                        <div id="multi-line-chart4" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla4">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte5">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Valladolid</h4>    
                        <div id="multi-line-chart5" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla5">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte6">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Tula</h4>    
                        <div id="multi-line-chart6" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla6">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte7">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Mérida</h4>    
                        <div id="multi-line-chart7" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla7">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte8">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Salina Cruz</h4>    
                        <div id="multi-line-chart8" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla8">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                               
            </div><!-- end col-->
        </div>
        <!-- end row -->

        <div class="row" id="mostrar_reporte9">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mt-0 mb-3">Reporte Tuxpan</h4>    
                        <div id="multi-line-chart9" class="ct-chart ct-golden-section"></div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Agente</th>
                                        <th>Ventas Totales</th>
                                        <th>Devoluciones</th>
                                        <th>Descuento</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla9">
                            
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                       
            </div><!-- end col-->
        </div>
    </div>
    <!-- end row --> 

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">



    <!-- Plugins js-->
    <script src="dist/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

    <!-- Init js-->
    <script src="dist/assets/js/pages/form-pickers.init.js"></script>

    <script src="dist/assets/libs/chartist/chartist.min.js"></script>
    <script src="dist/assets/libs/chartist-plugin-tooltips/chartist-plugin-tooltip.min.js"></script>

    <script type="text/javascript">
        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        }); 
        $('#mostrar_reporte').hide(); //oculto mediante id
        $('#mostrar_reporte1').hide(); //oculto mediante id
        $('#mostrar_reporte2').hide(); //oculto mediante id
        $('#mostrar_reporte3').hide(); //oculto mediante id
        $('#mostrar_reporte4').hide(); //oculto mediante id
        $('#mostrar_reporte5').hide(); //oculto mediante id
        $('#mostrar_reporte6').hide(); //oculto mediante id
        $('#mostrar_reporte7').hide(); //oculto mediante id
        $('#mostrar_reporte8').hide(); //oculto mediante id
        $('#mostrar_reporte9').hide(); //oculto mediante id

        $(function () {
            $("[id*=btnEnviar]").click(function () {
                var fechaInicio = $("[id*=txtinicio]").val();
                var fechaFin = $("[id*=txtfin]").val();
                mostrarloading();
                $.ajax({
                    type: "POST",
                    url: "ventas_totales.aspx/GetJson",
                    data: '{ fechaInicio: "' + fechaInicio + '", fechaFin: "' + fechaFin + '", idReporte: 1}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        datos = JSON.parse(response.d);

                        $('#mostrar_reporte1').show(); //oculto mediante id
                        $('#mostrar_reporte2').show(); //oculto mediante id
                        $('#mostrar_reporte3').show(); //oculto mediante id
                        $('#mostrar_reporte4').show(); //oculto mediante id
                        $('#mostrar_reporte5').show(); //oculto mediante id
                        $('#mostrar_reporte6').show(); //oculto mediante id
                        $('#mostrar_reporte7').show(); //oculto mediante id
                        $('#mostrar_reporte8').show(); //oculto mediante id
                        $('#mostrar_reporte9').show(); //oculto mediante id
                        //Dashboard1.prototype.init(datos[0]["ACTIVO"], datos[0]["INACTIVO"], datos[0]["PENDIENTES"], datos[0]["VENCIDOS"]);
                        ocultarloading();

                        let itemObject = [];
                        let vhsaNombre = [];
                        let vhsaSumaTotal = [];
                        let vhsaDevolucion = [];
                        let vhsaDescuento = [];

                        let parNombre = [];
                        let parSumaTotal = [];
                        let parDevolucion = [];
                        let parDescuento = [];

                        let mtyNombre = [];
                        let mtySumaTotal = [];
                        let mtyDevolucion = [];
                        let mtyDescuento = [];

                        let verNombre = [];
                        let verSumaTotal = [];
                        let verDevolucion = [];
                        let verDescuento = [];

                        let vallNombre = [];
                        let vallSumaTotal = [];
                        let vallDevolucion = [];
                        let vallDescuento = [];

                        let tulNombre = [];
                        let tulSumaTotal = [];
                        let tulDevolucion = [];
                        let tulDescuento = [];

                        let merNombre = [];
                        let merSumaTotal = [];
                        let merDevolucion = [];
                        let merDescuento = [];

                        let szaNombre = [];
                        let szaSumaTotal = [];
                        let szaDevolucion = [];
                        let szaDescuento = [];

                        let tuxNombre = [];
                        let tuxSumaTotal = [];
                        let tuxDevolucion = [];
                        let tuxDescuento = [];

                        function formatoPesos(peso) {

                            const totalPrecioUsd = new Intl.NumberFormat("en-US", {
                                style: "currency",
                                currency: "USD",
                            }).format(peso)

                            return totalPrecioUsd;
                        }

                        for (var i = 0; i < datos.length; i++) {

                            if (datos[i]["Sucursal"] == "VILLAHERMOSA") {
                                vhsaNombre.push(datos[i]["NombreAgente"]);
                                vhsaSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                vhsaDevolucion.push((datos[i]["Devolucion"]));
                                vhsaDescuento.push(datos[i]["DescuentoImporte"]);
                            }
                            if (datos[i]["Sucursal"] == "PARAÍSO") {
                                parNombre.push(datos[i]["NombreAgente"]);
                                parSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                parDevolucion.push(datos[i]["Devolucion"]);
                                parDescuento.push(datos[i]["DescuentoImporte"]);
                            }
                            if (datos[i]["Sucursal"] == "APODACA") {
                                mtyNombre.push(datos[i]["NombreAgente"]);
                                mtySumaTotal.push(datos[i]["SumaTotalPesos"]);
                                mtyDevolucion.push(datos[i]["Devolucion"]);
                                mtyDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "VERACRUZ") {
                                verNombre.push(datos[i]["NombreAgente"]);
                                verSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                verDevolucion.push(datos[i]["Devolucion"]);
                                verDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "VALLADOLID") {
                                vallNombre.push(datos[i]["NombreAgente"]);
                                vallSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                vallDevolucion.push(datos[i]["Devolucion"]);
                                vallDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "TULA") {
                                tulNombre.push(datos[i]["NombreAgente"]);
                                tulSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                tulDevolucion.push(datos[i]["Devolucion"]);
                                tulDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "MÉRIDA") {
                                merNombre.push(datos[i]["NombreAgente"]);
                                merSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                merDevolucion.push(datos[i]["Devolucion"]);
                                merDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "SALINA CRUZ") {
                                szaNombre.push(datos[i]["NombreAgente"]);
                                szaSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                szaDevolucion.push(datos[i]["Devolucion"]);
                                szaDescuento.push(datos[i]["DescuentoImporte"]);
                            }

                            if (datos[i]["Sucursal"] == "TUXPAN") {
                                tuxNombre.push(datos[i]["NombreAgente"]);
                                tuxSumaTotal.push(datos[i]["SumaTotalPesos"]);
                                tuxDevolucion.push(datos[i]["Devolucion"]);
                                tuxDescuento.push(datos[i]["DescuentoImporte"]);
                            }
                            //itemObject.push({ y: datos[i]["NombreAgente"], a: Math.abs(datos[i]["SumaTotalPesos"].toFixed(2)), b: Math.abs(datos[i]["Costo"].toFixed(2)), c: Math.abs(datos[i]["PrecioVenta"].toFixed(2)) })
                        }
                        //let obj = JSON.stringify(itemObject);
                        //console.log(itemObject);
                        //console.log(vhsaNombre);
                        //console.log(vhsaSumaTotal);


                        var tablahtml = "";
                        var totalhtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < vhsaNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + vhsaNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(vhsaSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(vhsaDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(vhsaDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += vhsaSumaTotal[i];
                            sumaventasucursal += vhsaDescuento[i];
                            sumacosto += vhsaDevolucion[i];

                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) +'</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla1").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < parNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + parNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(parSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(parDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(parDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += parSumaTotal[i];
                            sumaventasucursal += parDescuento[i];
                            sumacosto += parDevolucion[i];

                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla2").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < mtyNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + mtyNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(mtySumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(mtyDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(mtyDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += mtySumaTotal[i];
                            sumaventasucursal += mtyDescuento[i];
                            sumacosto += mtyDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla3").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < verNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + verNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(verSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(verDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(verDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += verSumaTotal[i];
                            sumaventasucursal += verDescuento[i];
                            sumacosto += verDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla4").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < vallNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + vallNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(vallSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(vallDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(vallDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += vallSumaTotal[i];
                            sumaventasucursal += vallDescuento[i];
                            sumacosto += vallDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla5").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < tulNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + tulNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(tulSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(tulDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(tulDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += tulSumaTotal[i];
                            sumaventasucursal += tulDescuento[i];
                            sumacosto += tulDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla6").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < merNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + merNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(merSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(merDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(merDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += merSumaTotal[i];
                            sumaventasucursal += merDescuento[i];
                            sumacosto += merDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla7").innerHTML = tablahtml;

                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < szaNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + szaNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(szaSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(szaDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(szaDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += szaSumaTotal[i];
                            sumaventasucursal += szaDescuento[i];
                            sumacosto += szaDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla8").innerHTML = tablahtml;


                        var tablahtml = "";
                        var sumatotalsucursal = 0, sumaventasucursal = 0, sumacosto = 0;
                        for (var i = 0; i < tuxNombre.length; i++) {

                            tablahtml += '<tr>';
                            tablahtml += '<th scope="row">' + (i + 1) + '</th>';
                            tablahtml += '<td>' + tuxNombre[i] + '</td>';
                            tablahtml += '<td>' + formatoPesos(tuxSumaTotal[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(tuxDescuento[i]) + '</td>';
                            tablahtml += '<td>' + formatoPesos(tuxDevolucion[i]) + '</td>';
                            tablahtml += '</tr>'
                            sumatotalsucursal += tuxSumaTotal[i];
                            sumaventasucursal += tuxDescuento[i];
                            sumacosto += tuxDevolucion[i];
                        }
                        tablahtml += '<tr>';
                        tablahtml += '<td colspan="2" class="text-end">Total</td>'
                        tablahtml += '<td>' + formatoPesos(sumatotalsucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumaventasucursal) + '</td>';
                        tablahtml += '<td>' + formatoPesos(sumacosto) + '</td>';
                        tablahtml += '</tr>';
                        document.getElementById("tabla9").innerHTML = tablahtml;

                        "use strict";

                        new Chartist.Bar("#multi-line-chart1", {
                            labels: vhsaNombre,
                            series: [vhsaSumaTotal, vhsaDevolucion, vhsaDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart2", {
                            labels: parNombre,
                            series: [parSumaTotal, parDevolucion, parDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart3", {
                            labels: mtyNombre,
                            series: [mtySumaTotal, mtyDevolucion, mtyDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart4", {
                            labels: verNombre,
                            series: [verSumaTotal, verDevolucion, verDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart5", {
                            labels: vallNombre,
                            series: [vallSumaTotal, vallDevolucion, vallDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart6", {
                            labels: tulNombre,
                            series: [tulSumaTotal, tulDevolucion, tulDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart7", {
                            labels: merNombre,
                            series: [merSumaTotal, merDevolucion, merDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart8", {
                            labels: szaNombre,
                            series: [szaSumaTotal, szaDevolucion, szaDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        }), new Chartist.Bar("#multi-line-chart9", {
                            labels: tuxNombre,
                            series: [tuxSumaTotal, tuxDevolucion, tuxDescuento]
                        }, {
                            seriesBarDistance: 10,
                            axisX: {
                                offset: 60
                            },

                            axisY: {
                                offset: 80,
                                labelInterpolationFnc: function (e) {
                                    return e
                                },

                                scaleMinSpace: 15
                            },

                            plugins: [Chartist.plugins.tooltip()]
                        });

                    },
                    error: function (data) {
                        var errors = data.responseJSON;
                        if (errors) {
                            $.each(errors, function (i) {
                                console.log(errors[i]);
                            });
                        }
                    },
                    timeout: 3600000
                });

                
            return false;
        });
        });
    </script>
</asp:Content>

