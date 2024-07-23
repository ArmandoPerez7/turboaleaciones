<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="false" MasterPageFile="~/Mersol.Master" CodeBehind="Usuarios.aspx.vb" Inherits="Mersol.Usuarios" %>
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

    .gvDetalleInvetatio{
        font-size: 13px;
    }
    .tableInv{
        border:none;
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

    .btn-detalle{
        font-size: 10px !important;
    }
    .priority-1{
    display:none;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
            <div class="row" id="ocultar" runat="server" visible="true"> 
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            
                            <div class="row justify-content-between">
                                <div class="col-md-9">
                                    <div class="mt-md-0 d-flex">
                                        <div class="col-auto m-2">
                                            <h4 class="mt-0 header-title">USUARIOS DE COMPUTO MERCADO DE LA SOLDADURA DEL SURESTE</h4>
                                            <p class="text-muted font-14"></p>
                                            <div class="col-auto m-2">
                                                <input type="text" id="txtBusqueda" class="form-control" placeholder="Ingrese término de búsqueda" oninput="buscar()" style="width: 200px;"/>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- end col-->
                                <div class="col-md-2 m-2 d-inline">
                                    
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
                            <div class="container row">
                                <div class="table small">
                                    <asp:GridView runat="server" ID="gvDetalleUsuario" autogeneratecolumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap dtHorizontalExampleWrapper" width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="BtnPermiso" CssClass="btn form-control-sm btn-secondary btn-detalle"  Text="PERMISOS" OnClick="BtnPermiso_Click" OnClientClick="ObtenerIdFila(this)" AutoPostBack="False"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Id_Usuario" HeaderText="ID USUARIO" />
                                            <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                                            <asp:BoundField DataField="Login" HeaderText="LOGIN" />
                                            <asp:BoundField DataField="Estatus" HeaderText="ESTATUS" />
                                            <asp:BoundField DataField="Puesto" HeaderText="PUESTO" />
                                            <asp:BoundField DataField="Rol" HeaderText="ROL" />
                                            <asp:BoundField DataField="Departamento" HeaderText="DEPARTAMENTO" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div>
            </div>
        <!-- end row -->


        <div id="UsuarioPermiso" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Permisos de Usuario</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                              <div class="col-md-6">
                                  <p class="sub-header">Usuario: <asp:Label ID="txtUsuario" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                              </div>
                              <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                                  <asp:Button runat="server" ID="BtnSucursalI" CssClass="btn form-control-sm btn-success m-2"  Text="Sucursales Intelisis" OnClick="BtnSucursalesI_Click" AutoPostBack="False"/>
                                  <asp:Button runat="server" ID="BtnSucursalInv" CssClass="btn form-control-sm btn-success m-2"  Text="Sucursales Inventario" OnClick="BtnSucursalesInv_Click" AutoPostBack="False"/>
                              </div>
                            </div>
                         </div>

                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">

                                        <section class="w-100  p-4 d-flex">
                                          <div data-mdb-treeview-init="" class="treeview treeview-primary" data-mdb-selectable="true" tabindex="0">
                                              <ul role="tree" style="list-style: none; padding: 0;" id="permisosTree">

                                              </ul>
                                          </div>
                                        </section>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
         
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-secondary waves-effect" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                        <button type="button" class="btn btn-success" id="GuardarChechk" value="" onclick="validarCheckboxes()">Guardar</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->


        <div id="UsuarioSucursalIntelisis" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Permisos de Usuario Sucursal Intelisis</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                              <div class="col-md-6">
                                  <p class="sub-header">Usuario: <asp:Label ID="txtUsuarioI" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                              </div>
                              <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                                  
                              </div>
                            </div>
                         </div>

                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body d-flex justify-content-center">
                                        <asp:GridView runat="server" ID="gvSucursalI" autogeneratecolumns="False" CssClass="table tableInv" width="50%">
                                            <Columns>
                                                <asp:BoundField DataField="Id_Sucursal" HeaderText="Id_Sucursal" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1" />
                                                <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" />
                                                <asp:TemplateField HeaderText="Checks" ControlStyle-CssClass="d-flex justify-content-center">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chbItem" runat="server" AutoPostBack="False"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#UsuarioPermiso">Regresa</button>
                        <asp:Button runat="server" ID="BtnGuardarSucursalI" CssClass="btn form-control-sm btn-success m-2"  Text="Guardar" OnClick="BtnGuardarSucursalI_Click" AutoPostBack="False"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="UsuarioSucursalInventario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Permisos de Usuario Sucursal Inventario</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                              <div class="col-md-6">
                                  <p class="sub-header">Usuario: <asp:Label ID="txtUsuarioInv" runat="server" CssClass="sub-header" Text=""></asp:Label></p>
                              </div>
                              <div class="col-md-6 ms-auto d-flex justify-content-end align-items-center">
                          
                              </div>
                            </div>
                         </div>

                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body d-flex justify-content-center">
                                        <asp:GridView runat="server" ID="gvSucursalInv" autogeneratecolumns="False" CssClass="table tableInv" width="50%">
                                            <Columns>
                                                <asp:BoundField DataField="Id_Sucursal" HeaderText="Id_Sucursal" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1" />
                                                <asp:BoundField DataField="Sucursal" HeaderText="Sucursal" />
                                                <asp:TemplateField HeaderText="Checks" ControlStyle-CssClass="d-flex justify-content-center">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chbItem" runat="server" AutoPostBack="False"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#UsuarioPermiso">Regresa</button>
                        <asp:Button runat="server" ID="BtnGuardarSucursalInv" CssClass="btn form-control-sm btn-success m-2"  Text="Guardar" OnClick="BtnGuardarSucursalInv_Click" AutoPostBack="False"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="warning-alert-modal" class="modal fade show" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="dripicons-warning h1 text-warning"></i>
                            <h4 class="mt-2" id="titleWarning" runat="server"></h4>
                            <p class="mt-3" id="cuerpoWarning" runat="server"></p>
                            <button type="button" class="btn btn-warning my-2" data-bs-dismiss="modal">Continue</button>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <div id="success-alert-modal"  class="modal fade show" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content modal-filled bg-success">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="dripicons-checkmark h1 text-white"></i>
                            <h4 class="mt-2 text-white" id="titleSuccess" runat="server"></h4>
                            <p class="mt-3 text-white" id="cuerpoSuccess" runat="server"></p>
                            <asp:Button CssClass="btn btn-light my-2" runat="server" data-bs-dismiss="modal" Text="Continuar" AutoPostBack="False"/>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

    </div>

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
        function validarCheckboxes() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');

            let chechkMenu = [];

            // Verificar cada checkbox
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    //alert(checkboxes[i].value)
                    chechkMenu.push(checkboxes[i].value);
                }
            }
            //alert(chechkMenu)
            //alert(JSON.stringify(chechkMenu));
            var datosJSON = JSON.stringify(chechkMenu)

            // Enviar la solicitud AJAX al servidor
            $.ajax({
                type: "POST",
                url: "Usuarios.aspx/actualizarPermisos",
                contentType: "application/json; charset=utf-8",
                data: '{ usuario: ' + localStorage.getItem("user") + ', datos:' + datosJSON + ' }',
                dataType: "json",
                success: function (response) {
                    //alert("Respuesta del servidor: " + response.d);
                    document.getElementById('<%= titleSuccess.ClientID %>').innerHTML = "¡Bien hecho!";
                    document.getElementById('<%= cuerpoSuccess.ClientID %>').innerHTML = response.d;
                    $('#UsuarioPermiso').modal('hide');
                    $('#success-alert-modal').modal('show');
                },
                error: function (error) {
                    //alert("Error en la solicitud AJAX: " + error.responseText);
                    document.getElementById('<%= titleWarning.ClientID %>').innerHTML = "¡Lo sentimos! Algo salio mal.";
                    document.getElementById('<%= cuerpoWarning.ClientID %>').innerHTML = response.d;
                    $('#UsuarioPermiso').modal('hide');
                    $('#Warning-alert-modal').modal('show');
                }
            });
        }

        document.getElementById("permisosTree").innerHTML = localStorage.getItem("html");

        function ObtenerIdFila(btn) {
            localStorage.setItem("user", "");
            // Obtener la fila de la tabla GridView que contiene el botón
            var fila = btn.closest('tr');

            // Obtener el valor de la celda que contiene el ID (asumimos que es la primera celda)
            var id = fila.cells[1].innerText; // Puedes cambiar el índice según la posición de la celda que contiene el ID
            localStorage.setItem("user", id); // Asignamos el id de usuario

            $.ajax({
                type: "POST",
                url: "Usuarios.aspx/GetJson",
                data: '{ usuario: ' + id +' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    datos = JSON.parse(response.d);
                    //Convertimos el valor a un objeto de tipo Json
                    var ob = Object.values(datos);
                    var menu = JSON.parse(ob[0]);
                    var detalleMenu = JSON.parse(ob[1]);
                    var PermisoMenu = JSON.parse(ob[2]);
                    var PermisoDetalleMenu = JSON.parse(ob[3]);

                    var conthtml = "";

                    localStorage.setItem("html", "");

                    for (var i = 0; i < menu.length; i++) {
                        if (menu[i]["Tipo"] === "URL") {

                            conthtml += '<li aria-level="1" role="tree-item" class="treeview-category active" tabindex="-1">';
                            conthtml += '<input type="checkbox" class="mx-1 form-check-input" id="menu_' + menu[i]["Id"] + i + '" ' + validarMenu(menu[i]["Id"]) + ' value="' + menu[i]["Id"] + '|MENU">';
                            conthtml += '<label for="menu_' + menu[i]["Id"] + i + '">' + menu[i]["Nombre"] + '</label>';
                            conthtml += '</li>';
                        }

                        if (menu[i]["Tipo"] === "MENU") {

                            conthtml += '<li aria-level="1" role="tree-item" class="treeview-category" tabindex="-1">';
                            conthtml += '<input type = "checkbox" class="mx-1 form-check-input" id="menu_' + menu[i]["Id"] + i + '" ' + validarMenu(menu[i]["Id"]) + ' value="' + menu[i]["Id"] + '|MENU">';
                            conthtml += '<label for="menu_' + menu[i]["Id"] + i + '">' + menu[i]["Nombre"] + '</label>';
                            conthtml += '<ul class="collapse show" id="level-351611" role="group" style="list-style: none;">';
                            crear_menu(menu[i]["Id"], menu[i]["Id"]);
                            conthtml += '</ul>';
                            conthtml += '</li>';
                        }
                    }

                    function crear_menu(IdPadre, IdMenu) {
                        for (var j = 0; j < detalleMenu.length; j++) {
                            if (detalleMenu[j]["Tipo"] === "URL" && detalleMenu[j]["Id_Padre"] === IdPadre && detalleMenu[j]["Id_Menu"] === IdMenu) {

                                conthtml += '<li aria-level="2" role="tree-item" class="treeview-category" tabindex="-1">';
                                conthtml += '<input type="checkbox" class="mx-1 form-check-input" id="detalleMenu_' + detalleMenu[j]["Id"] + j + '" ' + validarDetalleMenu(detalleMenu[j]["Id"]) + ' value="' + detalleMenu[j]["Id"] + '|DETALLEMENU">';
                                conthtml += '<label for="detalleMenu_' + detalleMenu[j]["Id"] + j + '">' + detalleMenu[j]["Nombre"] + '</label>';
                                conthtml += '</li>';
                            }

                            if (detalleMenu[j]["Tipo"] === "MENU" && detalleMenu[j]["Id_Padre"] === 0 && detalleMenu[j]["Id_Menu"] === IdMenu) {

                                conthtml += '<li aria-level="2" role="tree-item" tabindex="-1">';
                                conthtml += '<input type="checkbox" class="mx-1 form-check-input" id="detalleMenu_' + detalleMenu[j]["Id"] + j + '" ' + validarDetalleMenu(detalleMenu[j]["Id"]) + ' value="' + detalleMenu[j]["Id"] + '|DETALLEMENU">';
                                conthtml += '<label for="detalleMenu_' + detalleMenu[j]["Id"]+j + '">' + detalleMenu[j]["Nombre"] + '</label>';
                                conthtml += '<ul id="level-790482" role="group" style="list-style: none;">';
                                crear_submenu(detalleMenu[j]["Id"], detalleMenu[j]["Id_Menu"]);
                                conthtml += '</ul>';
                                conthtml += '</li>';
                            }
                        }
                    }

                    function crear_submenu(IdPadre, IdMenu) {
                        for (var j = 0; j < detalleMenu.length; j++) {
                            if (detalleMenu[j]["Tipo"] === "URL" && detalleMenu[j]["Id_Padre"] === IdPadre && detalleMenu[j]["Id_Menu"] === IdMenu) {

                                conthtml += '<li aria-level="3" role="tree-item" tabindex="-1">';
                                conthtml += '<input type="checkbox" class="mx-1 form-check-input" id="detalleMenu_' + detalleMenu[j]["Id"] + j + '" ' + validarDetalleMenu(detalleMenu[j]["Id"]) + ' value="' + detalleMenu[j]["Id"] + '|DETALLEMENU">';
                                conthtml += '<label for="detalleMenu_' + detalleMenu[j]["Id"] + j + '">' + detalleMenu[j]["Nombre"] + '</label>';
                                conthtml += '</li>';
                            }
                        }
                    }
                    localStorage.setItem("html", conthtml);
                    document.getElementById("permisosTree").innerHTML = localStorage.getItem("html");

                    function validarMenu(Id) {
                        var valor = ''
                        for (var j = 0; j < PermisoMenu.length; j++) {

                            if (PermisoMenu[j]["Id"] === Id) {
                                valor = 'checked'
                                return valor
                            }
                        }

                        return valor
                    }

                    function validarDetalleMenu(Id) {
                        var valor = ''
                        for (var j = 0; j < PermisoDetalleMenu.length; j++) {

                            if (PermisoDetalleMenu[j]["Id"] === Id) {
                                valor = 'checked'
                                return valor
                            }
                        }

                        return valor
                    }
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


        function buscar() {
            var searchTerm = document.getElementById('txtBusqueda').value.toUpperCase();
            var gridView = document.getElementById('<%= gvDetalleUsuario.ClientID %>');
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