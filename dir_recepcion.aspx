<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="dir_recepcion.aspx.vb" Inherits="Mersol.dir_recepcion" %>
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
    /*Vamos a ocultar la segunda columna*/
    .txtError{
        color: red;
        font-size: 12px;
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
                        <h4 class="header-title">Datos del Cliente</h4>
                        <p class="sub-header"></p>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="txtEmpresa" class="form-label">Empresa :</label>
                                <input type="text" class="form-control" name="txtEmpresa" id="txtEmpresa" runat="server">
                            </div> <!-- end col -->

                            <div class="col-md-4">
                                <label for="txtRazon" class="form-label">Razon Social :</label>
                                <input type="text" id="txtRazon" class="form-control" name="txtRazon" runat="server">
                            </div> <!-- end col -->

                            <div class="col-md-4">
                                <label for="txtLocalidad" class="form-label">Localidad :</label>
                                <input type="text" id="txtLocalidad" class="form-control" name="txtLocalidad" runat="server">
                            </div> <!-- end col -->

                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="txtNombre" class="form-label">Nombre :</label>
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre" runat="server">
                            </div> <!-- end col -->

                            <div class="col-md-4">
                                <label for="email" class="form-label">Correo Electrónico :</label>
                                <input type="email" id="email" class="form-control" name="email" data-parsley-trigger="change" runat="server">
                            </div> <!-- end col -->

                            <div class="col-md-4">
                                <label for="txtTelefono" class="form-label">Teléfono :</label>
                                <input type="number" class="form-control" name="txtTelefono" id="txtTelefono" runat="server">
                            </div> <!-- end col -->                                                         
                        </div>

                        <div class="mb-3">
                            <label for="txtObservaciones" class="form-label">Observaciones o Comentarios</label>
                            <textarea id="txtObservaciones" class="form-control" name="txtObservaciones" runat="server"> </textarea>
                        </div>


                        <h4 class="header-title">Registro de llamadas</h4>
                        <p class="sub-header"></p>

                        <div id="demo-form" data-parsley-validate="">

                            <div class="mb-3">
                                <label for="sltDepartamento" class="form-label">Departamento *:</label>
                                <asp:DropDownList ID="ddlDepartamento" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged">
                                    <asp:ListItem Text="Seleccione una opción.." Value="0"></asp:ListItem>
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
                                <asp:Label CssClass="txtError" runat="server" ID="txtErrorDepartamento" Text=""></asp:Label>
                            </div>

                            <div class="mb-3" id="divTipo" runat="server" visible="false">
                                <label class="form-label">Tipo *:</label>
                                <div class="form-check">
                                    <asp:RadioButton ID="rbOpcion1" runat="server" Text=" Cliente" GroupName="Grupo1" />
                                </div>
                                <div class="form-check">
                                    <asp:RadioButton ID="rbOpcion2" runat="server" Text=" Prospecto" GroupName="Grupo1" />
                                </div>
                            </div>

                            <div class="mb-3" id="divTipoCSA" runat="server" visible="false">
                                <label class="form-label">Tipo *:</label>

                                <div class="form-check mb-1">
                                    <asp:RadioButton ID="rbOpcion3" runat="server" Text=" Refacciones" GroupName="Grupo1" />
                                </div>
                                <div class="form-check">
                                    <asp:RadioButton ID="rbOpcion4" runat="server" Text=" Garantía" GroupName="Grupo1" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="sltSucursal" class="form-label">Sucursal * :</label>
                                    <asp:DropDownList ID="ddlSucursal" CssClass="form-select" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                                    </asp:DropDownList>
                                     <asp:Label CssClass="txtError" runat="server" ID="txtErrorSucursal" Text=""></asp:Label>
                                </div> <!-- end col -->

                                <div class="col-md-6">
                                    <label for="sltPersonal" class="form-label">Personal * :</label>
                                    <asp:DropDownList ID="ddlPersonal" CssClass="form-select" runat="server" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                     <asp:Label CssClass="txtError" runat="server" ID="txtErrorPersonal" Text=""></asp:Label>
                                </div> <!-- end col -->
                            </div>
                                            
                            <div class="mb-3">
                                <label for="sltMotivo" class="form-label">Motivo de llamada * :</label>
                                <select id="sltMotivo" class="form-select" runat="server">
                                    <option value="0">Seleccione una opción..</option>
                                    <option value="Cotizaciones">Cotizaciones</option>
                                    <option value="Cobranza">Cobranza</option>
                                    <option value="Facturacion">Facturación</option>
                                    <option value="Administración">Administración</option>
                                    <option value="Centro de Servicio">Centro de Servicio</option>
                                    <option value="Quejas y Sugerencias">Quejas y Sugerencias</option>
                                    <option value="Referencias laborales">Referencias laborales</option>
                                    <option value="Otros">Otros..</option>
                                </select>
                                <asp:Label CssClass="txtError" runat="server" ID="txtErrorMotivo" Text=""></asp:Label>
                            </div>
                            
                            <div class="mb-3" id="divProcuto">
                                <label for="sltProcuto" class="form-label">Producto :</label>
                                <select id="sltProcuto" class="form-select" runat="server">
                                    <option value="">Seleccione una opción..</option>
                                    <option value="Abrasivos">Abrasivos</option>
                                    <option value="EPP">EPP</option>
                                    <option value="Ferretería">Ferretería</option>
                                    <option value="Insdustria">Insdustria</option>
                                    <option value="Importacíon">Importacíon</option>
                                    <option value="Otros">Otros..</option>
                                </select>
                                <asp:Label CssClass="txtError" runat="server" ID="txtErrorProducto" Text=""></asp:Label>
                            </div>

                            <div>
                                <asp:Button ID="BtnGuardar" CssClass="btn form-control-sm btn-primary" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" AutoPostBack="False"/>
                            </div>

                        </div>
                    </div>
                </div> <!-- end card-->
            </div> <!-- end col-->
        </div>
        <!-- end row-->
         
        <div class="row">
            <div class="container row">
                <div class="table small">
                    <asp:GridView runat="server" ID="gvrecepcion" autogeneratecolumns="True" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                    </asp:GridView>
                </div>
            </div>
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
    <script src="dist/assets/libs/parsleyjs/parsley.min.js"></script>

    <!-- Validation init js-->
    <script src="dist/assets/js/pages/form-validation.init.js"></script>
    <script>

    </script>
</asp:Content>
