<%@ Page Title="Corte de Caja - Sistema Mesol" Language="vb" EnableEventValidation="false" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="Cortes.aspx.vb" Inherits="Mersol.Cortes" %>
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
        /*Vamos a ocultar la segunda columna*/
        .priority-1{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
            <div class="row"> 
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="mt-0 header-title">CORTE MERCADO DE LA SOLDADURA DEL SURESTE</h4>
                            <div class="row justify-content-between">
                                <div class="col-md-9">

                                    <div class="mt-md-0 d-flex">
                                        <div class="col-auto m-1" id="ocultar" runat="server" visible="true">
                                            <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Caja: </p>
                                            <asp:DropDownList ID="DropDownList" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto m-1">
                                            <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Mes: </p>
                                            <asp:DropDownList ID="DropMeses" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Selected="True" Value="0">Seleccione el Mes</asp:ListItem>
                                                <asp:ListItem Value="1">Enero</asp:ListItem>
                                                <asp:ListItem Value="2">Febrero</asp:ListItem>
                                                <asp:ListItem Value="3">Marzo</asp:ListItem>
                                                <asp:ListItem Value="4">Abril</asp:ListItem>
                                                <asp:ListItem Value="5">Mayo</asp:ListItem>
                                                <asp:ListItem Value="6">Junio</asp:ListItem>
                                                <asp:ListItem Value="7">Julio</asp:ListItem>
                                                <asp:ListItem Value="8">Agosto</asp:ListItem>
                                                <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                            </asp:DropDownList>                                                     
                                        </div>

                                        <div class="col-auto m-1">
                                            <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Año: </p>
                                            <input type="text" class="form-control ano" data-provide="datepicker" id="txtAno" placeholder="Ingrese un año" runat="server" data-date-autoclose="true"/>
                                        </div> 
                                        <div class="col-auto m-1 mt-3">
                                            <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscarComputo()"/>
                                        </div>
                                        <div class="col-auto m-1 mt-3">
                                            <asp:Button ID="BtnUsuario" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnUsuario_Click" />
                                        </div>
                    
                                    </div>
                                </div><!-- end col-->
                                <div class="col-md-2 m-2 d-inline">
                                    <asp:Button ID="BtnCrear" CssClass="btn form-control-sm btn-success" runat="server" Text="Crear Corte" OnClick="BtnCrear_Click" />
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
                            
                            <div class="mt-md-0 d-flex justify-content-between">
                                <div class="col-auto m-3">
                                    <h4 class="mt-0 header-title">Corte de Caja</h4>
                                    <p class="text-muted font-14 mb-0">
                                        SUCURSAL <asp:Label ID="txtSucursal" runat="server" CssClass="" Text=""></asp:Label>
                                    </p>
                                </div>                         
                            </div>
                            
                            <div class="container row">
                                <div class="table small">
                                    <asp:GridView runat="server" ID="gvcortes" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Id_Sucursal" HeaderText="Id_Sucursal" SortExpression="Id_Sucursal" ItemStyle-Width="0px"/>
                                            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Sucursal" SortExpression="Id_Sucursal" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Ruta" HeaderText="Ruta" SortExpression="Ruta" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            <asp:BoundField DataField="Fecha_Generado" HtmlEncode="False" DataFormatString = "{0:D}" HeaderText="Fecha inicio de corte" ReadOnly="True" /> 
 
                                            <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" ItemStyle-Width="80px"/>
                                            <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" SortExpression="Carpeta" ItemStyle-Width="80px" Visible="True"/>
                                            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="BtnSubir" CssClass="btn form-control-sm btn-success"  Text="Archivos" OnClick="BtnSubir_Click"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div>
            <div id="corte-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Corte del día <asp:Label ID="txtFechaCorte" runat="server" CssClass="header-title h4" Text=""></asp:Label></h4>
                            <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                             <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="header-title"></h4>
                                            <p class="sub-header">
                                                
                                            </p>

                                            <div class="col mb-2" id="FileCargarArchivo" runat="server" visible="true">
                                                <label for="formFileMultiple text-secondary" class="form-label">Seleccione uno o varios archivos</label>
                                                <asp:FileUpload ID="FileCorte" class="form-control" runat="server" AllowMultiple="True"/>
                                            </div>

                                            <asp:GridView runat="server" ID="gvdetallecorte" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="#" HeaderText="#" /> 

                                                    <asp:HyperLinkField DataTextField="Archivo" HeaderText="Archivo" />
                                                </Columns>
                                            </asp:GridView>

                                        </div> <!-- end card-body-->
                                    </div> <!-- end card-->
                                </div><!-- end col -->
                            </div>
                            <!-- end row -->  
         
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnCerrar" CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" OnClick="BtnCerrar_Click" />
                            <button id="BtnGuardarArchivo" runat="server" visible="true" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Guardar</button>
                        </div>
                    </div>
                </div>
            </div><!-- /.modal -->


            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">¿Desea finalizar corte?</h5>
                  </div>
                  <div class="modal-body loanding text-center">
                      <div class="text-center mt-5">
                          <div class="spinner-border text-primary" style="width: 8rem; height: 8rem;" role="status">
                            <span class="sr-only">Subiendo Archivo...</span>
                          </div>
                        </div>
                      <h4 class="mt-4 mb-5">Subiendo Archivo(s)...</h4>
                  </div>
                  <div class="modal-footer accionGuardar">
                      <asp:Button ID="BtnGuardar" CssClass="btn btn-info waves-effect waves-light deshabilitar" runat="server" Text="No" OnClick="BtnGuardar_Click"/>
                      <asp:Button ID="BtnFinalizar" CssClass="btn btn-info waves-effect waves-light deshabilitar" runat="server" Text="Si" OnClick="BtnFinalizar_Click"/>
                  </div>
                </div>
              </div>
            </div>

            <div id="crear-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Corte del día <asp:Label ID="Label1" runat="server" CssClass="header-title h4" Text=""></asp:Label></h4>
                            <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                             <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="header-title"></h4>
                                            <p class="sub-header">
                                    
                                            </p>
                                            
                                            <label class="form-label">Seleccione a la cajera</label>
                                            <asp:DropDownList ID="DropFacturista" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true"></asp:DropDownList>

                                            <div class="col-auto mt-2 mb-2">
                                                <label class="form-label">Fecha del Corte</label>
                                                <input type="text" class="form-control date" data-provide="datepicker" id="txtFecha" runat="server" placeholder="Ingrese una fecha" />
                                            </div>
                                            <asp:Label ID="txtError" runat="server" CssClass="form-label text-danger" Text=""></asp:Label>

                                        </div> <!-- end card-body-->
                                    </div> <!-- end card-->
                                </div><!-- end col -->
                            </div>
                            <!-- end row -->  
         
                        </div>
                        <div class="modal-footer">
                            <asp:Button CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" />
                            <asp:Button ID="BtnCrearCorte" CssClass="btn form-control-sm btn-primary" runat="server" Text="Crear Corte" OnClick="BtnCrearCorte_Click" />
                        </div>
                    </div>
                </div>
            </div><!-- /.modal -->

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
        $('.loanding').hide();
        $('.deshabilitar').click(function () {
            $('.loanding').show();
            $('.accionGuardar').hide();
            $('.staticBackdropLabel').hide();
        });

        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        }); 

        $('.ano').datepicker({
            format: " yyyy",
            viewMode: "years",
            minViewMode: "years"
        });

        function seleccionarMes(e) {
            __doPostBack("<%= DropMeses.UniqueID %>", "");
        }

        function buscarComputo() {
            var searchTerm = document.getElementById('txtBusqueda').value.toUpperCase();
            var gridView = document.getElementById('<%= gvcortes.ClientID %>');
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