<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="false" MasterPageFile="~/Mersol.Master" CodeBehind="evaluacion.aspx.vb" Inherits="Mersol.evaluacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            /**** Test*/
    .info_box .info-list{
        padding: 15px 30px;
    }

    .info_box .info-list .info{
        margin: 5px 0;
        font-size: 17px;
    }

    .info_box .info-list .info span{
        font-weight: 600;
        color: #ddbc6b;
    }
    .info_box .buttons{
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        padding: 0 30px;
        border-top: 1px solid lightgrey;
    }

    .quiz_box{
        width: 100%;
        background: #fff;
        border-radius: 5px;
        /*pointer-events: none;*/
        transition: all 0.3s ease;
    }

    .quiz_box header{
        position: relative;
        z-index: 2;
        height: 70px;
        padding: 0 30px;
        background: #fff;
        border-radius: 5px 5px 0 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0px 3px 5px 1px rgba(0,0,0,0.1);
    }

    .quiz_box header .title{
        font-size: 20px;
        font-weight: 600;
    }

    .quiz_box header .timer{
        color: #ffffff;
        background: #ddbc6b;
        border: 1px solid #ddbc6b;
        height: 45px;
        padding: 0 8px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        width: 100px;
    }

    .quiz_box header .timer .time_left_txt{
        font-weight: 400;
        font-size: 12px;
        user-select: none;
        line-height: 1;
    }

    .quiz_box header .timer .timer_sec{
        font-size: 12px;
        font-weight: 400;
        height: 30px;
        width: 50px;
        color: #ddbc6b;
        border-radius: 5px;
        text-align: center;
        background: #fff;
        border: 1px solid #ddbc6b;
        user-select: none;
        margin-left: 4px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .quiz_box header .time_line{
        position: absolute;
        bottom: 0px;
        left: 0px;
        height: 3px;
        background: #ddbc6b;
    }

    section{
        padding: 25px 30px 20px 30px;
        background: #fff;
    }

    section .que_text{
        font-size: 25px;
        font-weight: 600;
    }

    section .option_list{
        padding: 20px 0px;
        display: block;   
    }

    section .option_list .option{
        background: #fff;
        border: 1px solid #ddbc6b;
        border-radius: 5px;
        padding: 8px 15px;
        font-size: 17px;
        margin-bottom: 15px;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    section .option_list .option:last-child{
        margin-bottom: 0px;
    }

    section .option_list .option:hover{
        color: #000;
        background: #ddbc6b;
        border: 1px solid #ddbc6b;
    }

    section .option_list .option.correct{
        color: #155724;
        background: #d4edda;
        border: 1px solid #c3e6cb;
    }

    section .option_list .option.incorrect{
        color: #721c24;
        background: #f8d7da;
        border: 1px solid #f5c6cb;
    }

    section .option_list .option.disabled{
        pointer-events: none;
    }

    section .option_list .option .icon{
        height: 26px;
        width: 26px;
        border: 2px solid transparent;
        border-radius: 50%;
        text-align: center;
        font-size: 13px;
        pointer-events: none;
        transition: all 0.3s ease;
        line-height: 24px;
    }
    .option_list .option .icon.tick{
        color: #23903c;
        border-color: #23903c;
        background: #d4edda;
    }

    .option_list .option .icon.cross{
        color: #a42834;
        background: #f8d7da;
        border-color: #a42834;
    }

    footer{
        height: 60px;
        padding: 0 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-top: 1px solid lightgrey;
    }

    footer .total_que span{
        display: flex;
        user-select: none;
    }

    footer .total_que span p{
        font-weight: 500;
        padding: 0 5px;
    }

    footer .total_que span p:first-child{
        padding-left: 0px;
    }

    .result_box{
        background: #fff;
        border-radius: 5px;
        padding: 25px 30px;
        width: 450px;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        transition: all 0.3s ease;
        display: none;
    }

    .result_box .icon{
        font-size: 125px;
        color: #ddbc6b;
        margin-bottom: 10px;
    }

    .result_box .complete_text{
        font-size: 20px;
        font-weight: 500;
    }

    .result_box .score_text span{
        display: flex;
        margin: 10px 0;
        font-size: 18px;
        font-weight: 500;
    }

    .result_box .score_text span p{
        padding: 0 4px;
        font-weight: 600;
    }

    .result_box .buttons{
        display: flex;
        margin: 20px 0;
    }

    .invalid{
        border: 1px solid red;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content-->
    <div class="container-fluid">

        <div class="row">
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body taskboard-box">
                        <h4 class="header-title mt-0 mb-3 text-warning">Evaluaciones</h4>

                        <ul class="sortable-list list-unstyled taskList" id="inprogress">
                            <li id="evSistemas" runat="server" visible="true">
                                <div class="float-start">
                                    
                                </div>
                                
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-warning float-end">Pendiente</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación Sistemas</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p>Departamento: Sitemas</p>
                                            </li>
                                            <li class="list-inline-item">
                                                <p>Preguntas: 10</p>
                                            </li>
                                            <li>
                                                <div class="start_btn">
                                                    <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="tipo('sistemas');">Empezar</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li id="evMarketing" runat="server" visible="true">
                                <div class="float-start">
                                    <img src="dist/assets/images/evaluacion/logo_mkt.png" alt="img" class="avatar-lg rounded-circle"/>
                                </div>
    
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-warning float-end">Pendiente</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación Marketing</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Departamento: Marketing & E-commerce</p>
                                            </li>
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Preguntas: 10</p>
                                            </li>
                                            <li>
                                                <div class="start_btn">
                                                    <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="tipo('marketing');">Empezar</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li id="evCrm" runat="server" visible="true">
                                <div class="float-start">
                                    <img src="dist/assets/images/evaluacion/logo_mkt.png" alt="img" class="avatar-lg rounded-circle"/>
                                </div>
    
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-warning float-end">Pendiente</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación CRM</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Departamento: Marketing & E-commerce</p>
                                            </li>
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Preguntas: 10</p>
                                            </li>
                                            <li>
                                                <div class="start_btn">
                                                    <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="tipo('crm');">Empezar</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
            </div><!-- end col -->


            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body taskboard-box">
                        <h4 class="header-title mt-0 mb-3 text-success">Completado</h4>
                        <ul class="sortable-list list-unstyled taskList" id="incomplete">
                            <li id="evCompeteSistemas" runat="server" visible="false">
                                <div class="float-start">
            
                                </div>
        
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-success float-end">Completado</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación Sitemas</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p>Departamento: Sitemas</p>
                                            </li>
                                            <li class="list-inline-item">
        
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li id="evCompeteMarketing" runat="server" visible="false">
                                <div class="float-start">
                                    <img src="dist/assets/images/evaluacion/logo_mkt.png" alt="img" class="avatar-lg rounded-circle"/>
                                </div>
    
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-success float-end">Completado</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación Marketing</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Departamento: Marketing & E-commerce</p>
                                            </li>
                                            <li class="list-inline-item">

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li id="evCompeteCrm" runat="server" visible="false">
                                <div class="float-start">
                                    <img src="dist/assets/images/evaluacion/logo_mkt.png" alt="img" class="avatar-lg rounded-circle"/>
                                </div>
    
                                <div class="kanban-box">
                                    <div class="kanban-detail">
                                        <span class="badge bg-success float-end">Completado</span>
                                        <h5 class="mt-0"><a href="task-details.html" class="text-dark">Evaluación CRM</a> </h5>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <p style="padding:0px">Departamento: Marketing & E-commerce</p>
                                            </li>
                                            <li class="list-inline-item"></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div><!-- end col -->

        </div><!-- end row -->

        <div class="modal fade" id="exampleModalToggle" aria-hidden="true"
                aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Las reglas básicas
                                de la evaluacón</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="info-list">
                                <div class="info">1. Tendrás <span>45 segundos</span> para responder a
                                    cada
                                    pregunta.</div>
                                <div class="info">2. Una vez que selecciones una respuesta, <span>no se
                                        puede
                                        deshacer</span>.</div>
                                <div class="info">3. No puede seleccionar ninguna opción una vez que se
                                    acaba el
                                    tiempo.</div>
                                <div class="info">4. <span>No se puede salir de cuestionario</span>
                                    mientras se está
                                    desarrollando por que perderás todos los puntos acumulados.</div>
                                <div class="info">5. Obtendrás <span>un punto por cada respuesta
                                        correcta</span>.
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="name" class="col-form-label">Nombre:</label>
                                    <asp:Label ID="txtUsuarioId" runat="server" CssClass="" Text="" Visible="True"></asp:Label> <asp:Label ID="txtUsuario" runat="server" CssClass="" Text="" Visible="True"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer buttons">
                            <button type="button" class="quit" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="restart btn btn-primary">Continuar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="exampleModalToggle2" data-bs-backdrop="static"
                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <!-- Caja de preguntas -->
                            <div class="quiz_box">
                                <header>
                                    <div class="title">Piénsalo antes de responder ...</div>
                                    <div class="timer">
                                        <div class="time_left_txt">Tiempo restante</div>
                                        <div class="timer_sec">30</div>
                                    </div>
                                    <div class="time_line"></div>
                                </header>
                                <section>
                                    <div class="que_text">
                                        <!-- Aquí he insertado una pregunta de JavaScript -->
                                    </div>
                                    <div class="option_list">
                                        <!-- Aquí he insertado opciones de JavaScript -->
                                    </div>
                                </section>

                                <!-- pie de página de Quiz Box -->
                                <footer>
                                    <div class="total_que">
                                        <!-- Aquí he insertado Número de conteo de preguntas de JavaScript -->
                                    </div>
                                    <button type="button" class="next_btn mt-2 btn btn-primary">Siguiente</button>
                                </footer>
                            </div>

                            <!-- Cuadro de resultados -->
                            <div class="result_box">
                                <div class="icon">
                                    <img src="dist/assets/images/users/user-1.png" alt="user-image" class="rounded-circle" />
                                </div>
                                <div class="complete_text">Has completado el cuestionario!</div>
                                <div class="score_text">
                                    <!-- Aquí he insertado Score Result de JavaScript -->
                                </div>
                                <div class="buttons">
                                    <button class="restart" style="display: none;">Repetir</button>
                                    <button class="quit" style="display: none;">Salir</button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal"
                                        aria-label="Close" onclick="enviarTest()">Finalizar</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

    </div> <!-- container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">

    <script>
        localStorage.setItem("userId", "");

        var txtUsuarioId = document.getElementById('<%= txtUsuarioId.ClientID %>').innerHTML;
        localStorage.setItem("userId", txtUsuarioId);


        function enviarTest() {
            var inputValue = localStorage.getItem("userId");
            var puntos = localStorage.getItem("userScore");
            var resul = localStorage.getItem("test");
            var departamento = localStorage.getItem("idDepartamento");
            // Enviar la solicitud AJAX al servidor
            $.ajax({
                type: "POST",
                url: "evaluacion.aspx/enviar",
                contentType: "application/json; charset=utf-8",
                data: '{ usuario: ' + inputValue + ', puntos: ' + puntos + ', resultado: "' + resul + '", departamento: "' + departamento + '" }',
                success: function (response) {
                    console.log("Datos enviados con éxito");
                    console.log(response.d);  // Esto imprimirá la respuesta del servidor
                },
                error: function (error) {
                    alert("Error en la solicitud AJAX: " + error.responseText);
                }
            });

        }
    </script>

    <!-- Dentro de este archivo JavaScript, solo he insertado preguntas y opciones. -->
    <script src="dist/assets/js/preguntas.js"></script>
    <!-- Dentro de este archivo JavaScript he codificado todos los códigos de prueba -->
    <script src="dist/assets/js/script.js"></script>

</asp:Content>
