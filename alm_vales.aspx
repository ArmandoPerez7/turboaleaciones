<%@ Page Title="Vales de Adeudo" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="alm_vales.aspx.vb" Inherits="Mersol.alm_vales" %>
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
        .table > :not(caption) > * > * {
            padding: 0.5rem 0.85rem !important;
        }
        .btn-detalle{
            font-size: 10px !important;
        }
        .priority-1{
            display:none;
        }
        .gvVales{
            font-size: 12px;
        }
        .gvDetalleInvetatio{
            border: 3px solid;
            color: #6c757d !important;
        }
        #ContentPlaceHolder1_txtCadena{
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="container-fluid">
        <h4 class="mt-0 header-title">VALES DE ADEUDO</h4>
        <div class="row" id="ocultar" runat="server" visible="true"> 
            <div class="col-12">
                <div class="card">
                    <div class="card-body" style="padding: 0.5rem 1.5rem;">
                        <div class="row justify-content-center">
                            <div class="col-auto m-1 d-flex">
                                <div class="col-auto m-1">
                                    <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">&nbsp;</p>
                                </div>
                                <div class="col-auto m-1">
                                    <h4 class="text-muted header-title text-center" style="margin: 0px 0px 2px 0px;">Factura referencia: </h4>
                                    <asp:TextBox ID="txtFactura" CssClass="form-control" runat="server" onkeypress="return detectarEnterFactura(event)" AutoPostBack="True" autocomplete="off"></asp:TextBox>
                                </div>
                                <div class="col-auto m-1" id="ocultarSucursal">
                                    <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">&nbsp;</p>
                                    <asp:DropDownList ID="DropSucursal" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-auto m-1">
                                    <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">&nbsp;</p>
                                    <asp:Button runat="server" CssClass="btn btn-link waves-effect waves-success font-14" ID="BtnBuscarFact" OnClick="BtnBuscarFact_Click" Text="Buscar Factura" AutoPostBack="False" autocomplete="off"/>
                                </div>
                            </div>
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body" style="padding: 3.5rem 1.5rem;">
                        <div class="row justify-content-center d-grid">
                            <div class="col-md-12">
                                <div class="mt-md-0 d-flex">
                                    <div class="col-12 m-1 text-center">
                                        <asp:Label ID="lblCadena" CssClass="text-muted mt-0 header-title text-center" Text="Escanea el Código de Barras o Ingréselo:" runat="server" AssociatedControlID="txtCadena"/>
                                        <asp:TextBox ID="txtCadena" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <!--div class="col-auto m-1">
                                        <p class="text-muted font-12" style="margin: 0px 0px 2px 0px;">&nbsp;</p>
                                        <asp:Button runat="server" CssClass="btn btn-link waves-effect waves-success font-14" ID="BtnBuscarVale" Text="Buscar" AutoPostBack="False"/>
                                    </div-->
                                </div>
                            </div><!-- end col-->
                        </div> <!-- end row -->
                        <div class="justify-content-center d-flex">
                            <!--img src="dist/assets/images/codigo_escanear.png" alt="Codigo de Barras" width="25%"/-->
                        </div>
                    </div>
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>

        <div id="DetalleFacturacion" class="modal fade show" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detalle de Facturacion</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <table class="table-sm" style="border: 3px solid #dee2e6;">
                                  <tbody>
                                    <tr>
                                      <th scope="row" style="width:11%">Factura Ref.:</th>
                                      <td><asp:Label ID="txtFact" runat="server" CssClass="" Text=""></asp:Label></td>
                                      <td colspan="3">
                                          <div class="d-flex justify-content-center"><img src="dist\assets\images\logo_vale.png" alt="Logo Mersol" width="100%"/></div>
                                      </td>
                                      <th scope="row" style="width:11%">Suc. Origen:</th>
                                      <td><asp:Label ID="txtIdSucursal" runat="server" CssClass="" Text="" Visible="false"><asp:Label ID="txtAlmacen" runat="server" CssClass="" Text="" Visible="false"></asp:Label></asp:Label><asp:Label ID="txtSucursal" runat="server" CssClass="" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">NOMBRE DEL CLIENTE:</th>
                                      <td colspan="5"><asp:Label ID="txtIdCliente" runat="server" CssClass="" Text="" Visible="false"></asp:Label><asp:Label ID="txtCliente" runat="server" CssClass="" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">DIRECCIÓN:</th>
                                      <td colspan="3"><asp:Label ID="txtDireccion" runat="server" CssClass="" Text=""></asp:Label></td>
                                      <th scope="row" style="text-align: right;">AGENTE:</th>
                                      <td colspan="2"><asp:Label ID="txtAgente" runat="server" CssClass="" Text=""></asp:Label><asp:Label ID="txtIdAgente" runat="server" CssClass="" Text="" Visible="false"></asp:Label></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">TELÉFONOS:</th>
                                      <td colspan="2" style="width:40%"><input type="text" class="form-control" id="txtTelefono" runat="server" placeholder="" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"/></td>
                                      <th scope="row" colspan="2" style="text-align: right;">RECIBE MERCANCÍA:</th>
                                      <td colspan="2" style="width:32%"><input type="text" class="form-control" id="txtClienteRecibe" runat="server" placeholder="Ingrese el Nombre" /></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">OBSERVACIONES:</th>
                                      <td colspan="6"><input type="text" class="form-control" id="inpObservaciones" runat="server" placeholder="Campo Observación"/></td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>
                         </div>
                        <div class="col-11">
                            <p class="text-muted font-8" style="margin: 0px 0px 2px 0px;">*Llenar los campos editables con datos del Cliente.</p>
                        </div>
                         <div class="row">
                            <div class="card-body">
                                <asp:GridView runat="server" ID="gvFacturaB" autogeneratecolumns="False" CssClass="table dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="ClaveFabricante" HeaderText="Clave Fabricante" ReadOnly="true"/>
                                        <asp:BoundField DataField="Articulo" HeaderText="SKU" ReadOnly="true"/>
                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="true"/>
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="true"/>
                                        <asp:BoundField DataField="Unidad" HeaderText="Unidad" ReadOnly="true"/>
                                        <asp:TemplateField HeaderText="Checks*">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbItem" runat="server" AutoPostBack="False"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pendiente*">
                                            <ItemTemplate>
                                                <input type="text" id="txtPendiente" class="form-control" name="txtPendiente" runat="server" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="width: 60px;">
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Causa*">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropCausa" class="form-select mySelectReport" runat="server" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="Seleccione una opción" Value="" />
                                                    <asp:ListItem Text="Faltante de Inventario" Value="FALTANTE DE INVENTARIO" />
                                                    <asp:ListItem Text="Traspaso de Sucursal" Value="TRASPASO DE SUCURSAL" />
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView> 
                                <div id="divAlerta" class="alert alert-danger" role="alert" style="display:none;" runat="server">
                                    <asp:Label ID="lblAlerta" Text="" runat="server" />
                                </div>
                            </div> <!-- end card-body-->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-secondary waves-effect limpiarRegistros" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnConfirmarFactura" CssClass="btn form-control-sm btn-primary"  Text="Confimar" OnClick="BtnConfirmarFactura_Click" AutoPostBack="False"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="ConfirmarVale" class="modal fade show" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detalle de Vale</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <i class="dripicons-information h1 text-info"></i>
                                            <h4 class="mt-2">Verifique que los artículos y cantidades seleccionados sean correctos.</h4>
                                        </div>
                                        <hr>
                                        <table class="table-sm" style="border: 3px solid #dee2e6;">
                                          <tbody>
                                            <tr>
                                              <th scope="row" style="width:11%">Factura Ref.:</th>
                                              <td><asp:Label ID="txtFactC" runat="server" CssClass="" Text=""></asp:Label></td>
                                              <td colspan="3">
                                                  <div class="d-flex justify-content-center"><img src="dist\assets\images\logo_vale.png" alt="Logo Mersol" width="100%"/></div>
                                              </td>
                                              <th scope="row" style="width:11%">Suc. Origen:</th>
                                              <td><asp:Label ID="txtIdSucursalC" runat="server" CssClass="" Text="" Visible="false"><asp:Label ID="txtAlmacenC" runat="server" CssClass="" Text="" Visible="false"></asp:Label></asp:Label><asp:Label ID="txtSucursalC" runat="server" CssClass="" Text=""></asp:Label></td>
                                            </tr>
                                            <tr>
                                              <th scope="row">NOMBRE DEL CLIENTE:</th>
                                              <td colspan="5"><asp:Label ID="txtIdClienteC" runat="server" CssClass="" Text="" Visible="false"></asp:Label><asp:Label ID="txtClienteC" runat="server" CssClass="" Text=""></asp:Label></td>
                                            </tr>
                                            <tr>
                                              <th scope="row">DIRECCIÓN:</th>
                                              <td colspan="3"><asp:Label ID="txtDireccionC" runat="server" CssClass="" Text=""></asp:Label></td>
                                              <th scope="row" style="text-align: right;">AGENTE:</th>
                                              <td colspan="2"><asp:Label ID="txtAgenteC" runat="server" CssClass="" Text=""></asp:Label><asp:Label ID="txtIdAgenteC" runat="server" CssClass="" Text="" Visible="true"></asp:Label></td>
                                            </tr>
                                            <tr>
                                              <th scope="row">TELÉFONOS:</th>
                                              <td colspan="2" style="width:40%"><asp:Label ID="txtTelefonoC" runat="server" CssClass="" Text=""></asp:Label></td>
                                              <th scope="row" colspan="2" style="text-align: right;">RECIBE MERCANCÍA:</th>
                                              <td colspan="2" style="width:32%"><asp:Label ID="txtClienteRecibeC" runat="server" CssClass="" Text=""></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">OBSERVACIONES:</th>
                                                <td colspan="6"><asp:Label ID="txtObservaciones" runat="server" CssClass="" Text=""></asp:Label></td>
                                            </tr>
                                          </tbody>
                                        </table>
                                        <hr>
                                        <asp:GridView runat="server" ID="gvConfirmarFactura" autogeneratecolumns="False" CssClass="table dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="#" HeaderText="#" ReadOnly="true"/>
                                                <asp:BoundField DataField="ClaveFabricante" HeaderText="Clave Fabricante" ReadOnly="true"/>
                                                <asp:BoundField DataField="Articulo" HeaderText="SKU" ReadOnly="true"/>
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="true"/>
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad Pendiente" ReadOnly="true"/>
                                                <asp:BoundField DataField="Unidad" HeaderText="Unidad" ReadOnly="true"/>
                                                <asp:BoundField DataField="Causa" HeaderText="Causa" ReadOnly="true"/>
                                            </Columns>
                                        </asp:GridView>
                                        <div class="col-11">
                                            <p class="text-muted font-8" style="margin: 0px 0px 2px 0px;">*Si un artículo no se muestra es porque no selecciono el CHECK o No ingreso una cantidad</p>
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-secondary waves-effect" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnAtrasFact" CssClass="btn btn-light waves-effect" Text="Volver Atrás" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnGuardarFact" CssClass="btn form-control-sm btn-success"  Text="Guardar" data-bs-dismiss="modal" OnClientClick="mostrarModal();"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="DetalleVale" class="modal fade show" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detalle de Facturacion</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                         <div class="row">
                             <div class="col-12">
                                 <div class="card-body">
                                      <table class="table-sm" style="border: 3px solid #dee2e6;">
                                        <tbody>
                                        <tr>
                                            <th scope="row" style="width:11%">Factura Ref.:</th>
                                            <td><asp:Label ID="txtFacturav" runat="server" CssClass="" Text=""></asp:Label></td>
                                            <td colspan="3">
                                                <div class="d-flex justify-content-center"><img src="dist\assets\images\logo_vale.png" alt="Logo Mersol" width="100%"/></div>
                                            </td>
                                            <th scope="row" style="width:11%">Suc. Origen:</th>
                                            <td><asp:Label ID="Label2" runat="server" CssClass="" Text="" Visible="false"><asp:Label ID="Label3" runat="server" CssClass="" Text="" Visible="false"></asp:Label></asp:Label><asp:Label ID="txtSucursalv" runat="server" CssClass="" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">NOMBRE DEL CLIENTE:</th>
                                            <td colspan="5"><asp:Label ID="txtIdClientev" runat="server" CssClass="" Text=""></asp:Label> <asp:Label ID="txtClientev" runat="server" CssClass="" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">DIRECCIÓN:</th>
                                            <td colspan="3"><asp:Label ID="txtDireccionv" runat="server" CssClass="" Text=""></asp:Label></td>
                                            <th scope="row" style="text-align: right;">AGENTE:</th>
                                            <td colspan="2"><asp:Label ID="Label8" runat="server" CssClass="" Text=""></asp:Label><asp:Label ID="Label9" runat="server" CssClass="" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">TELÉFONOS:</th>
                                            <td colspan="2" style="width:40%"><asp:Label ID="txtTelefonov" runat="server" CssClass="" Text=""></asp:Label></td>
                                            <th scope="row" colspan="2" style="text-align: right;">RECIBE MERCANCÍA:</th>
                                            <td colspan="2" style="width:32%"><input type="text" class="form-control" id="inputRecibeCliente" runat="server" placeholder="Ingrese el Nombre" /></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                 </div>
                             </div>
                        </div>

                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <asp:GridView runat="server" ID="gvDetalleVale" autogeneratecolumns="False" CssClass="table dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Codigo_Alterno" HeaderText="Clave Fabricante" ReadOnly="true"/>
                                                <asp:BoundField DataField="Codigo_Interno" HeaderText="SKU" ReadOnly="true"/>
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" ReadOnly="true"/>
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad Pendiente" ReadOnly="true"/>
                                                <asp:BoundField DataField="Unidad" HeaderText="Unidad" ReadOnly="true"/>
                                                <asp:TemplateField HeaderText="Checks">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chbItem" runat="server" AutoPostBack="False"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cantidad a Entregar">
                                                    <ItemTemplate>
                                                        <input type="text" id="txtPendiente" name="txtPendiente" runat="server" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Id_Vales" HeaderText="Id_Vales" ReadOnly="true" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                                <asp:BoundField DataField="Id_DetalleVale" HeaderText="Id_DetalleVale" ReadOnly="true" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            </Columns>
                                        </asp:GridView>
                                        <div id="divAlertaVale" class="alert alert-danger" role="alert" style="display:none;" runat="server">
                                            <asp:Label ID="lblAlertaVale" Text="" runat="server" />
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-secondary waves-effect" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnConfirmarDetalleVale" OnClick="BtnConfirmarDetalleVale_Click" CssClass="btn form-control-sm btn-primary"  Text="Confirmar" AutoPostBack="False"/>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="ConfirmarDetalleVale" class="modal fade show" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detalle de Vale</h4>
                        <button type="button" class="btn-close limpiarRegistros" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <i class="dripicons-information h1 text-info"></i>
                                            <h4 class="mt-2">Verifique que los artículos y cantidades seleccionados sean correctos.</h4>
                                        </div>
                                        <hr>
                                        <asp:Label ID="txtClienteRecibeVale" runat="server" CssClass="" Text="" Visible="true"></asp:Label>
                                        <asp:GridView runat="server" ID="gvConfirmarDetalleVale" autogeneratecolumns="False" CssClass="table dt-responsive nowrap gvDetalleInvetatio" width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="#" HeaderText="#" ReadOnly="true"/>
                                                <asp:BoundField DataField="ClaveFabricante" HeaderText="Clave Fabricante" ReadOnly="true"/>
                                                <asp:BoundField DataField="Articulo" HeaderText="SKU" ReadOnly="true"/>
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="true"/>
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad a Entregar" ReadOnly="true"/>
                                                <asp:BoundField DataField="Unidad" HeaderText="Unidad" ReadOnly="true"/>
                                                <asp:BoundField DataField="Id_Vales" HeaderText="Id_Vales" ReadOnly="true" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                                <asp:BoundField DataField="Id_DetalleVale" HeaderText="Id_DetalleVale" ReadOnly="true" ItemStyle-Width="0px" ItemStyle-CssClass="priority-1" HeaderStyle-CssClass="priority-1"/>
                                            </Columns>
                                        </asp:GridView>
                                        <div class="col-11">
                                            <p class="text-muted font-8" style="margin: 0px 0px 2px 0px;">*Si un artículo no se muestra es porque no selecciono el CHECK o No ingreso una cantidad</p>
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->  
 
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="btn btn-secondary waves-effect" runat="server" data-bs-dismiss="modal" Text="Cerrar" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnAtrasVale" CssClass="btn btn-light waves-effect" Text="Volver Atrás" AutoPostBack="False"/>
                        <asp:Button runat="server" ID="BtnGuardarDetalleVale" CssClass="btn form-control-sm btn-primary"  Text="Guardar" data-bs-dismiss="modal"/>
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

        <div id="success-alert-modal"  class="modal fade" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
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

        <div id="vale" class="modal fade" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content modal-filled bg-success">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="dripicons-checkmark h1 text-white"></i>
                            <h4 class="mt-2 text-white">¡Bien hecho!</h4>
                            <p class="mt-3 text-white">Vale guardado.</p>
                            <asp:Button CssClass="btn btn-light my-2" runat="server" data-bs-dismiss="modal" Text="Continuar" AutoPostBack="False"/>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

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
        $(document).ready(function () {
            $('#gvVales').DataTable({
                "scrollX": true,
                "scrollY": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        $('.mes').datepicker({
            format: "mm",
            viewMode: "months",
            minViewMode: "months"
        });

        $('.ano').datepicker({
            format: "yyyy",
            viewMode: "years",
            minViewMode: "years"
        });

        $(document).ready(function () {
            // Simular clic con un retraso de 2000 milisegundos (2 segundos)
            setTimeout(function () {
                $('#<%= lblCadena.ClientID %>').click();
            }, 1900);
        });

        mostrarModal()
        function mostrarModal() {
            document.getElementById('<%= titleSuccess.ClientID %>').innerHTML = "¡Bien hecho!"
            document.getElementById('<%= cuerpoSuccess.ClientID %>').innerHTML = "Descarga Completa. El archivo se ha descargado correctamente."
            $('#success-alert-modal').modal('show');
        }


        function detectarEnterFactura(e) {
            if (e.key === "Enter") {
                // Forzar el evento TextChanged del TextBox
                __doPostBack('<%= txtFactura.ClientID %>', '');
                return false; // Evitar que el formulario se envíe
            }
        }

        function detectarEnterVale(e) {
            if (e.key === "Enter") {
                // Forzar el evento TextChanged del TextBox
                __doPostBack('<%= txtCadena.ClientID %>', '');
                return false; // Evitar que el formulario se envíe
            }
        }


    </script>
    
    
</asp:Content>