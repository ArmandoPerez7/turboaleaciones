<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="control_sala.aspx.vb" Inherits="Mersol.control_sala" %>
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
    <link href="dist/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/multiselect/css/multi-select.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css" />

    <style>
    /*Vamos a ocultar la segunda columna*/
    .txtError{
        color: red;
        font-size: 12px;
    }

    .priority-1{
        display:none;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content-->
    <div class="container-fluid">
        
        <div class="row" id="agregarLlamadas">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">CONTROL SALA MERCADO DE LA SOLDADURA DEL SURESTE</h4>
                        <div class="row justify-content-between">
                            <div class="col-md-9">

                                <div class="mt-md-0 d-flex">
                                    <div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">Fecha: </p>
                                        <input type="text" class="form-control date" data-provide="datepicker" id="txtFecha" placeholder="Ingrese un fecha" runat="server" data-date-autoclose="true"/>
                                    </div> 
                                    <div class="col-auto m-1 mt-3">
                                        <asp:Button ID="BtnBuscar" CssClass="btn form-control-sm btn-primary" runat="server" Text="Cargar" OnClick="BtnBuscar_Click" />
                                    </div>
                    
                                </div>
                            </div><!-- end col-->
                            <div class="col-md-2 m-2 d-inline">
                                <button type="button" class="btn btn-primary" id="agendarPermiso" data-bs-toggle="modal" data-bs-target="#agendar_sala" runat="server" visible="true">Agendar</button>
                            </div>
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
        <!-- end row-->
         
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table small">
                            <asp:GridView runat="server" ID="gvAgenda" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                    <asp:BoundField DataField="Responsable" HeaderText="Responsable" SortExpression="Responsable"/>
                                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo"/>
                                    <asp:BoundField DataField="Departamento" HeaderText="Departamento" SortExpression="Departamento" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                    <asp:BoundField DataField="FechaRequerida" HtmlEncode="False" DataFormatString = "{0:D}" HeaderText="Fecha Requerida" ReadOnly="True" /> 
                                    <asp:BoundField DataField="HoraEntrada" HeaderText="Entrada" SortExpression="Estatus" ItemStyle-Width="80px"/>
                                    <asp:BoundField DataField="HoraSalida" HeaderText="Salida" SortExpression="HoraSalida" ItemStyle-Width="80px" Visible="True"/>
                                    <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" ItemStyle-Width="100px" Visible="True"/>
                                    <asp:BoundField DataField="Observacion" HeaderText="Observación"/>
                                    <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Button runat="server" ID="BtnActualizar" CssClass="btn form-control-sm btn-success"  Text="VER" OnClick="BtnActualizar_Click"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>

        <!-- Modal -->
        <div class="modal fade" id="agendar_sala" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Agendar Sala</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                 
                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Agendar Fecha</label>
                    <input type="text" class="form-control date" data-provide="datepicker" id="txtFechaRequerida" runat="server" placeholder="Ingrese una fecha" data-date-autoclose="true"/>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Agendar Entrada</label>
                    <input type="text" id="txtEntrada" runat="server" class="form-control flatpickr-input entrada" placeholder="Ingrese la hora de entrada" readonly="readonly"/>
                </div>
                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Agendar Salida</label>
                    <input type="text" id="txtSalida" runat="server" class="form-control flatpickr-input salida" placeholder="Ingrese la hora de salida" readonly="readonly"/>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Sala</label>
                    <asp:DropDownList ID="ddlSalas" class="form-select" runat="server" AppendDataBoundItems="true"  AutoPostBack="False">
                    </asp:DropDownList>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Responsable</label>
                    <input type="text" class="form-control" name="txtResponsable" id="txtResponsable" placeholder="Nombre" runat="server"/>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Departamento</label>
                    <asp:DropDownList ID="ddlDepartamento" CssClass="form-control" runat="server" AutoPostBack="False">
                        <asp:ListItem Text="Seleccione una opción.." Value=""></asp:ListItem>
                        <asp:ListItem Text="VENTAS" Value="VENTAS"></asp:ListItem>
                        <asp:ListItem Text="ADMINISTRACION" Value="ADMINISTRACION"></asp:ListItem>
                        <asp:ListItem Text="AUDITORIA" Value="AUDITORIA"></asp:ListItem>
                        <asp:ListItem Text="CENTRO DE SERVICIO" Value="CENTRO DE SERVICIO AUTORIZADO"></asp:ListItem>
                        <asp:ListItem Text="COMPRAS" Value="COMPRAS"></asp:ListItem>
                        <asp:ListItem Text="CONTABILIDAD" Value="CONTABILIDAD"></asp:ListItem>
                        <asp:ListItem Text="CREDITO Y COBRANZA" Value="CREDITO Y COBRANZA"></asp:ListItem>
                        <asp:ListItem Text="DESARROLLO ORGANIZACIONAL" Value="DESARROLLO ORGANIZACIONAL"></asp:ListItem>
                        <asp:ListItem Text="FACTURACION" Value="FACTURACION"></asp:ListItem>
                        <asp:ListItem Text="LOGISTICA" Value="LOGISTICA"></asp:ListItem>
                        <asp:ListItem Text="MARKETING" Value="MARKETING"></asp:ListItem>
                        <asp:ListItem Text="OPERACIONES" Value="OPERACIONES"></asp:ListItem>
                        <asp:ListItem Text="SISTEMAS" Value="SISTEMAS"></asp:ListItem>
                        <asp:ListItem Text="Otros" Value="Otros..."></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Label ID="txtError" runat="server" CssClass="form-label text-danger" Text=""></asp:Label>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <asp:Button ID="BtnAgendar" CssClass="btn form-control-sm btn-success" runat="server" Text="Guardar" OnClick="BtnAgendar_Click" />
              </div>
            </div>
          </div>
        </div>

        
        <!-- Modal -->
        <div class="modal fade" id="sala_observacion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel2">Sala Agendada</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                 
                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Fecha: <asp:Label ID="txtFechaRe" runat="server" CssClass="form-label" Text=""></asp:Label></label>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Entrada: <asp:Label ID="txtEntradaH" runat="server" CssClass="form-label" Text=""></asp:Label></label>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Salida: <asp:Label ID="txtSalidaH" runat="server" CssClass="form-label" Text=""></asp:Label></label>
                </div>
                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Sala: <asp:Label ID="txtSala" runat="server" CssClass="form-label" Text=""></asp:Label></label>
                </div>
                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Responsable: <asp:Label ID="txtResonsebleOb" runat="server" CssClass="form-label" Text=""></asp:Label></label>
                </div>

                <div class="col-auto mt-2 mb-2">
                    <label class="form-label">Cambiar Estatus</label>
                    <select id="sEstatus" name="estatus" class="form-select" onchange="ShowSelected();" runat="server">
                        <option value="">-----------------</option>
                        <option value="EN PROCESO">EN PROCESO</option>
                        <option value="FINALIZADO">FINALIZADO</option>
                        <option value="CANCELADO">CANCELADO</option>
                        <option value="SIN USO">SIN USO</option>
                    </select>
                </div>
                <div class="col-auto mt-2 mb-2" id="observaciones">
                    <label for="txtObservaciones" class="form-label">Observaciones o Comentarios</label>
                    <textarea id="txtObservaciones" class="form-control" name="txtObservaciones" runat="server"> </textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <asp:Button ID="BtnActualizarModal" CssClass="btn form-control-sm btn-success" runat="server" Text="Guardar" OnClick="BtnActualizarModal_Click" />
              </div>
            </div>
          </div>
        </div>

        <div id="success-alert-modal"  class="modal fade" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content modal-filled bg-success">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="dripicons-checkmark h1 text-white"></i>
                            <h4 class="mt-2 text-white" id="titleSuccess">¡Bien Hecho!</h4>
                            <p class="mt-3 text-white" id="cuerpoSuccess">Sala agendada</p>
                            <asp:Button CssClass="btn btn-light my-2" runat="server" data-bs-dismiss="modal" Text="Continuar" AutoPostBack="False"/>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

    </div> <!-- container -->
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

    <!-- Plugin js-->
    <script src="dist/assets/libs/flatpickr/flatpickr.min.js"></script>
    <script src="dist/assets/libs/parsleyjs/parsley.min.js"></script>

    <script>
        $('.date').datepicker({
            format: 'dd-mm-yyyy'
        }); 
        $(".entrada").flatpickr({ enableTime: !0, noCalendar: !0, dateFormat: "H:i" });
        $(".salida").flatpickr({ enableTime: !0, noCalendar: !0, dateFormat: "H:i" });

        $("#observaciones").hide();

        function ShowSelected() {
            /* Para obtener el valor */
            var cod = document.getElementById("<%= sEstatus.ClientID %>").value;
            if (cod == "FINALIZADO") {
                $("#observaciones").show();
            } else {
                $("#observaciones").hide();
            }
        }

    </script>
</asp:Content>
