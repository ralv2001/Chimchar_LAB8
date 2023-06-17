<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="recursos/assets/favicon.ico" />
        <!-- Custom Google font-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="recursos/css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100" style="background-image: url(recursos/assets/fondo.jpg); background-repeat: no-repeat; background-size: cover;">
        <main class="flex-shrink-0">

            <div id="layoutAuthentication_content">
                <!-- Main page content-->
                <main>
                    <!-- Main content container-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-4 col-xl-5 col-lg-6 col-md-8">
                                <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4" style="background-color: rgb(11,13,16);">
                                    <div class="card-body p-5" style="background-color: rgb(11,13,16);">
                                        <!-- Auth header with logo image-->
                                        <div class="text-center">
                                            <img class="mb-3" src="recursos/assets/logo2.webp" alt="..." style="height: 200px">
                                            <h6 class="display-6 fw-bolder"><span class="text-gradient d-inline">Bienvenido TeleViajero</span></h6>
                                            <br>
                                        </div>
                                        <!-- Login submission form-->
                                        <form method="POST" action="<%=request.getContextPath()%>/LoginServlet">
                                            <div class="form-floating mb-3">
                                                <input type="text" id="inputEmail" class="form-control" name = "inputEmail" placeholder="Ingrese su correo..."  />
                                                <label for="inputEmail">Usuario</label>
                                            </div>
                                            <!-- Email address input-->
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" id="inputPassword" name ="inputPassword" placeholder="Contraseña" />
                                                <label for="inputPassword">Contraseña</label>
                                            </div>

                                            <% if (request.getParameter("error") != null) { %>
                                            <div class = "text-danger mb-2">Error en usuario o contraseña</div>
                                            <% } %>

                                            <div class="form-group">
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                                                <button class ="btn btn-primary mdc-ripple-upgraded rounded-pill" type="submit">Iniciar Sesión</button>
                                            </div>
                                        </form>
                                        <br>
                                        <div class="card-text text-center">
                                            <div class="small"><a href="<%=request.getContextPath()%>/UsuariosServlet" class="text-warning" >Soy nuevo y quiero registrarme</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </main>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="recursos/js/scripts.js"></script>
    </body>
</html>
