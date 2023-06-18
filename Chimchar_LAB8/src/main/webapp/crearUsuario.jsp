<%--
  Created by IntelliJ IDEA.
  User: milene
  Date: 17/06/2023
  Time: 05:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Personal - Start Bootstrap Theme</title>
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
  <body class="d-flex flex-column h-100" style="background-image: url(recursos/assets/map-image.png); background-repeat: no-repeat; background-size: cover; background-color: #22262d;">
    <main class="flex-shrink-0">

      <div id="layoutAuthentication_content">
        <!-- Main page content-->
        <main>
          <!-- Main content container-->
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-xl-4 col-xl-5 col-lg-6 col-md-8">
                <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
                  <div class="card-body p-5">
                    <!-- Auth header with logo image-->
                    <div class="text-center">
                      <img class="mb-3" src="recursos/assets/logo2.webp" alt="..." style="height: 200px">
                      <h6 class="display-6 fw-bolder"><span class="text-gradient d-inline">Crear usuario TeleViajero</span></h6>
                      <br>
                    </div>
                    <!-- Login submission form-->
                    <form class="form-signin" method="POST" action="<%=request.getContextPath()%>/CrearUsuarioServlet">
                      <div class="form-floating mb-3">
                        <input class="form-control" id="nombre" name="nombre" type="text" placeholder="Ingrese su nombre..." required />
                        <label for="nombre">Nombre</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese su apellido..." required />
                        <label for="apellido">Apellido</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="edad" name="edad" type="text" placeholder="Ingrese su edad..." required />
                        <label for="edad">Edad</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="codigo" name="codigo" type="text" placeholder="Ingrese su codigo PUCP..." required />
                        <label for="codigo">Código PUCP</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="correo" name="correo" type="email" placeholder="axxxxxx@pucp.edu.pe" required />
                        <label for="correo">Correo PUCP</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="especialidad" name="especialidad" type="text" placeholder="Ingrese su especialidad..." required />
                        <label for="especialidad">Especialidad</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="contrasenia" name="contrasenia" type="password" placeholder="Contraseña" required />
                        <label for="contrasenia">Contraseña</label>
                      </div>

                      <div class="form-floating mb-3">
                        <input class="form-control" id="password2" name="password2" type="password" placeholder="Vuelva a escribir su contraseña" required />
                        <label for="password2">Confirmar contraseña</label>
                      </div>

                      <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                        <a href="<%= request.getContextPath()%>/UsuariosServlet" class="btn btn-danger">Cancelar</a>
                        <input type="submit" value="Guardar" class="btn btn-primary"/>
                      </div>
                    </form>
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

