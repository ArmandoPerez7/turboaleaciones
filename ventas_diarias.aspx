<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="ventas_diarias.aspx.vb" Inherits="Mersol.ventas_diarias" %>
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
                            <label class="form-label">Seleccione una sucursal</label>
                            <select id="mySelectSucursal" class="form-select" required="">
                                <option value="">--Seleccione una opción--</option>
                                <option value="0">Villahermosa</option>
                                <option value="1">Paraíso</option>
                                <option value="2">Monterrey</option>
                                <option value="3">Veracruz</option>
                                <option value="4">Valladolid</option>
                                <option value="5">Tula</option>
                                <option value="6">Mérida</option>
                                <option value="7">Salina Cruz</option>
                                <option value="8">Tuxpan</option>
                            </select>
                        </div>
                        
                        <div class="col-auto">
                            <label class="form-label">Fecha</label>
                            <input type="text" class="form-control date" data-provide="datepicker" id="txtFecha" placeholder="Ingrese una fecha" />
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

        <div id="report">

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

        $(function () {
            $("[id*=btnEnviar]").click(function () {
                var selectedSucursal = $('#mySelectSucursal').val();
                var fecha = $("[id*=txtFecha]").val();
                //alert(fecha)
                mostrarloading();
                $.ajax({
                    type: "POST",
                    url: "ventas_diarias.aspx/GetJson",
                    data: '{ idReporte: 2, idSucursal: "' + selectedSucursal + '" , fecha: "' + fecha + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        ocultarloading();
                        datos = JSON.parse(response.d);
                        //alert("hola")
                        //alert("You have selected the name " + selectedItem);
                        $('#mostrar_reporte').show();

                        var sucursales = [];
                        var dias = [];

                        function formatoPesos(peso) {

                            const totalPrecioUsd = new Intl.NumberFormat("en-US", {
                                style: "currency",
                                currency: "USD",
                            }).format(peso)

                            return totalPrecioUsd;
                        }

                        for (var i = 0; i < datos.length; i++) {
                            sucursales.push(datos[i]["SUCURSAL"]);
                            dias.push(datos[i]["DIA"]);
                            //itemObject.push({ y: datos[i]["NombreAgente"], a: Math.abs(datos[i]["SumaTotalPesos"].toFixed(2)), b: Math.abs(datos[i]["Costo"].toFixed(2)), c: Math.abs(datos[i]["PrecioVenta"].toFixed(2)) })
                        }


                        function unique(arr) {
                            let result = [];

                            for (let str of arr) {
                                if (!result.includes(str)) {
                                    result.push(str);
                                }
                            }

                            return result;
                        }

                        let sucursalUnicos = unique(sucursales);
                        let diaMes = unique(dias);
                        let AgenteNombre = [];
                        let datosSucursales = [];
                        for (var i = 0; i < sucursalUnicos.length; i++) {
                            for (var j = 0; j < datos.length; j++) {
                                if (sucursalUnicos[i] == datos[j]["SUCURSAL"]) {
                                    datosSucursales.push({ Dia: datos[j]["DIA"], Sucursal: datos[j]["SUCURSAL"], Agente: datos[j]["AGENTE"], Nombre: datos[j]["NOMBRE"], Total: datos[j]["TOTAL"], TotalAcumulado: datos[j]["TotalAcumulado"] });
                                    if (datos[j]["DIA"] == "1") {
                                        AgenteNombre.push({ Nombre: datos[j]["NOMBRE"], Sucursal: datos[j]["SUCURSAL"], TotalAcumulado: datos[j]["TotalAcumulado"] });
                                    }

                                }
                            }
                        }
                        let ahora = new Date();
                        let obtenerYear = ahora.getFullYear();
                        let obtenerMes = ahora.getMonth();

                        //console.log("Estoy en el mes " + obtenerMes);
                        var cabezera = '<div class="row" id=""> <div class="col-xl-12"><div class="card"><div class="card-body"><h4 class="header-title mt-0 mb-3">Reporte Villahemrosa</h4><div class="table-responsive"><table class="table table-striped mb-0"><thead><tr><th>DIA/AGENTE</th>'
                        var PrimeraLinea = true;
                        var conthtml = "";
                        for (var i = 0; i < sucursalUnicos.length; i++) {
                            var total = "";
                            conthtml += '<div class="row" id=""> <div class="col-xl-12"><div class="card"><div class="card-body"><h4 class="header-title mt-0 mb-3">VENTAS DIARIAS ' + sucursalUnicos[i] + '</h4><div class="table-responsive"><table class="table table-hover table-striped mb-0" ><thead><tr style="--ct-table-bg: #72bbd1;"><th>DIA/AGENTE</th>';
                            for (var j = 0; j < diaMes.length; j++) {



                                if (PrimeraLinea == true) {
                                    total += '<tr class="fw-bold">';
                                    total += '<td></td>';
                                    for (var x = 0; x < AgenteNombre.length; x++) {
                                        if (AgenteNombre[x]["Sucursal"] == sucursalUnicos[i]) {
                                            conthtml += '<th>' + AgenteNombre[x]["Nombre"] + '</th>';
                                            total += '<td>' + formatoPesos(AgenteNombre[x]["TotalAcumulado"]) + '</td>';
                                        }
                                        if (x == AgenteNombre.length - 1) {
                                            conthtml += '</tr ></thead ><tbody id="">';
                                        }
                                    }
                                    total += '</tr>';
                                    PrimeraLinea = false;
                                }

                                conthtml += '<tr>';
                                conthtml += '<td class="table-info text-dark">' + (j + 1) + '/' + (obtenerMes + 1) + '/' + obtenerYear + '</td>';
                                for (var k = 0; k < datosSucursales.length; k++) {
                                    if (sucursalUnicos[i] == datosSucursales[k]["Sucursal"] && j + 1 == datosSucursales[k]["Dia"]) {
                                        conthtml += '<td>' + formatoPesos(datosSucursales[k]["Total"]) + '</td>';
                                    }
                                }
                                conthtml += '</tr>';

                            }

                            PrimeraLinea = true;
                            conthtml += total;
                            conthtml += '</tbody ></table ></div ></div ></div ></div ></div >';
                        }


                        document.getElementById("report").innerHTML = conthtml;
                        //console.log(AgenteNombre);
                        //console.log(datosSucursales);
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

