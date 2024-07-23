<%@ Page Title="Activos - Sistema Mesol" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="Activos.aspx.vb" Inherits="Mersol.Activos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- third party css -->
    <link href="dist/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/assets/libs/datatables.net-select-bs5/css//select.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <asp:GridView ID="gvdActivos" runat="server" CellPadding="4" autogeneratecolumns="False" ForeColor="#333333" GridLines="None" CssClass="table table-striped table-bordered dt-responsive nowrap">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" 
                                    SortExpression="Descripcion" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre de Usuario" 
                                    SortExpression="Nombre" />
                                <asp:BoundField DataField="Fecha_Mtto" HeaderText="Fecha de Mantenmiento" 
                                    SortExpression="Fecha_Mtto" />
                                <asp:BoundField DataField="Proximo Mantenimiento" HeaderText="Próximo Mantenimiento" 
                                    SortExpression="Proximo Mantenimiento" />
                            </Columns>
                        </asp:GridView>
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
    <script src="dist/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="dist/assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="dist/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="dist/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="dist/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
    <script src="dist/assets/libs/pdfmake/build/pdfmake.min.js"></script>
    <script src="dist/assets/libs/pdfmake/build/vfs_fonts.js"></script>
    <!-- third party js ends -->

    <!-- Datatables init -->
    <script src="dist/assets/js/pages/datatables.init.js"></script>
    
</asp:Content>
