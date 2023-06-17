<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
                            <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
                                <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
                                    <div class="card-body p-5">
                                        <!-- Auth header with logo image-->
                                        <div class="text-center">
                                            <img class="mb-3" src="recursos/assets/logo2.webp" alt="..." style="height: 200px">
                                            <h6 class="display-6 fw-bolder"><span class="text-gradient d-inline">Bienvenido TeleViajero</span></h6>
                                            <br>
                                        </div>
                                        <!-- Login submission form-->
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                                <label for="name">Usuario</label>
                                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                            </div>
                                            <!-- Email address input-->
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="password" type="password" placeholder="name@example.com" data-sb-validations="required,email" />
                                                <label for="password">Contraseña</label>
                                                <div class="invalid-feedback" data-sb-feedback="password:required">Se necesita una contraseña.</div>
                                                <div class="invalid-feedback" data-sb-feedback="password:password">Email is not valid.</div>
                                            </div>

                                            <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                                                <a class="btn btn-primary mdc-ripple-upgraded" href="index.html">Ingresar</a>
                                            </div>
                                        </form>
                                        <br>
                                        <div class="card-text text-center">
                                            <div class="small"><a href="auth-register-basic.html">Soy nuevo y quiero registrarme</a></div>
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
