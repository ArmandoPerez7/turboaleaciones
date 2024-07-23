<%@ Page Title="Calendario - Sistema Mesol" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mersol.Master" CodeBehind="Calendario.aspx.vb" Inherits="Mersol.Calendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Plugin css -->
    <link href="dist/assets/libs/fullcalendar/main.min.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div id="external-events"></div>

                </div> <!-- end col-->

                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div id="calendar"></div>

                        </div> <!-- end card body-->
                    </div> <!-- end card -->
                </div> <!-- end col -->

            </div> <!-- end row -->


            <!-- Add New Event MODAL -->
            <div class="modal fade" id="event-modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header py-3 px-4 border-bottom-0 d-block">
                            <button type="button" class="btn-close float-end" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            <h5 class="modal-title" id="modal-title">Event</h5>
                        </div>
                        <div class="modal-body px-4 pb-4 pt-0">
                            <form class="needs-validation" name="event-form" id="form-event" novalidate>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Event Name</label>
                                            <input class="form-control" placeholder="Insert Event Name"
                                                type="text" name="title" id="event-title" required />
                                            <div class="invalid-feedback">Please provide a valid event name
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12 col-12 text-end">
                                        <button type="button" class="btn btn-danger me-1"
                                            data-bs-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-success"
                                            id="">Descargar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div> <!-- end modal-content-->
                </div> <!-- end modal dialog-->
            </div>
            <!-- end modal-->
        </div>
        <!-- end col-12 -->
    </div> <!-- end row -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <!-- plugin js -->
    <script src="dist/assets/libs/moment/min/moment.min.js"></script>
    <script src="dist/assets/libs/fullcalendar/main.min.js"></script>

    <!-- Calendar init -->
    <script src="dist/assets/js/pages/calendar.init.js"></script>
</asp:Content>