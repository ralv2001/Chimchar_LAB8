<%--
  Created by IntelliJ IDEA.
  User: milene
  Date: 17/06/2023
  Time: 12:22
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
    <title>Editar Viajes</title>
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


          <div class="container">
            <div class="card o-hidden border-0 shadow-lg my-5">
              <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                  <div class="col-lg-5 d-none d-lg-block">
                    <img src="recursos/assets/editarViaje.jpg" alt="Imagen de registro" class="w-100">
                  </div>
                  <div class="col-lg-7">
                    <div class="p-5">
                      <div class="text-center">
                        <br>
                        <hr>
                        <h6 class="display-6 fw-bolder"><span class="text-gradient d-inline">EDITAR VIAJE</span></h6>
                        <hr>
                        <br>

                      </div>
                      <div class="text">
                        <h7 class="section-subheading text-success" style="text-align: left;">* Formato: AA-MM-DD</h7>
                      </div>
                      <form>
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-floating mb-3">
                              <input class="form-control" id="fechaReserva" type="text" placeholder="Fecha de reserva ..." data-sb-validations="required" />
                              <label for="fechaReserva">Fecha de reserva</label>
                              <div class="invalid-feedback" data-sb-feedback="fechaReserva:required">Se requiere una fecha de reserva</div>
                            </div>
                          </div>
                          <div class="col-md-8">
                            <div class="form-floating mb-3">
                              <input class="form-control" id="origen" type="text" placeholder="Ciudad de origen..." data-sb-validations="required,email" />
                              <label for="origen">Ciudad de origen </label>
                              <div class="invalid-feedback" data-sb-feedback="origen:required">Se necesita una ciudad de origen.</div>
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-md-4"> <!-- Agregada la clase col-md-4 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="fechaViaje" type="text" placeholder="Fecha de viaje ..." data-sb-validations="required" />
                              <label for="fechaViaje">Fecha de viaje</label>
                              <div class="invalid-feedback" data-sb-feedback="fechaViaje:required">Se requiere una fecha de viaje</div>
                            </div>
                          </div>
                          <div class="col-md-8"> <!-- Agregada la clase col-md-8 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="destino" type="text" placeholder="Ciudad de origen..." data-sb-validations="required" />
                              <label for="destino">Ciudad de destino</label>
                              <div class="invalid-feedback" data-sb-feedback="destino:required">Se necesita una ciudad de destino.</div>
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-md-4"> <!-- Agregada la clase col-md-4 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="boletos" type="text" placeholder="Cant. boletos..." data-sb-validations="required" />
                              <label for="boletos">N° Boletos</label>
                              <div class="invalid-feedback" data-sb-feedback="boletos:required">Ingrese una cantidad de boletos</div>
                            </div>
                          </div>
                          <div class="col-md-8"> <!-- Agregada la clase col-md-8 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="aseguradora" type="text" placeholder="Aseguradora" data-sb-validations="required" />
                              <label for="aseguradora">Aseguradora</label>
                              <div class="invalid-feedback" data-sb-feedback="aseguradora:required">Se necesita una aseguradora.</div>
                            </div>
                          </div>
                        </div>
                        <div class="row justify-content-end">
                          <div class="col-md-4 ml-auto"> <!-- Agregada la clase ml-auto -->
                            <h7 class="section-subheading text-danger">Su viaje costaría:</h7>
                            <div class="form-floating mb-3" style="text-align: right;">
                              <input class="form-control" id="precio" type="text" placeholder="Ingrese el precio..." data-sb-validations="required" />
                              <label for="precio">Costo Total</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                          <a button class="btn btn-success text-white" type="button" href="index.html"><b>Guardar viaje</b></a>
                        </div>
                      </form>
                      <br>
                      <hr>
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
