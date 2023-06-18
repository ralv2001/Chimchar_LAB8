<%--
  Created by IntelliJ IDEA.
  User: milene
  Date: 17/06/2023
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="misViajes" scope="request" type="com.example.chimchar_lab8.models.beans.Viajes.MisViajes"/>
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
                      <form method="POST" action="<%=request.getContextPath()%>/ViajesServlet?p=aNormal">
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-floating mb-3">
                              <input class="form-control" id="fechaReserva" type="text" value="<%=misViajes.getFecha_reserva()%>">
                              <label for="fechaReserva">Fecha de reserva</label>

                            </div>
                          </div>
                          <div class="col-md-8">
                            <div class="form-floating mb-3">
                              <input class="form-control" id="origen" type="text" value="<%=misViajes.getCiudad_origen()%>">
                              <label for="origen">Ciudad de origen </label>
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-md-4"> <!-- Agregada la clase col-md-4 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="fechaViaje" type="text" value="<%=misViajes.getFecha_viaje()%>">
                              <label for="fechaViaje">Fecha de viaje</label>
                            </div>
                          </div>
                          <div class="col-md-8"> <!-- Agregada la clase col-md-8 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="destino" type="text" value="<%=misViajes.getCiudad_destino()%>">
                              <label for="destino">Ciudad de destino</label>
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-md-4"> <!-- Agregada la clase col-md-4 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="boletos" type="text" value="<%=misViajes.getNumero_de_boletos()%>">
                              <label for="boletos">N° Boletos</label>
                            </div>
                          </div>
                          <div class="col-md-8"> <!-- Agregada la clase col-md-8 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="aseguradora" type="text"  value="<%=misViajes.getEmpresaSeguro().getNombre()%>">
                              <label for="aseguradora">Aseguradora</label>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-4"> <!-- Agregada la clase col-md-4 -->
                            <div class="form-floating mb-3">
                              <input class="form-control" id="preciounitario" type="text" value="<%=misViajes.getCosto_unitario()%>">
                              <label for="preciounitario">Precio</label>
                            </div>
                          </div>
                          <div class="col-md-8"> <!-- Agregada la clase col-md-8 -->
                            <h7 class="section-subheading text-danger">Su viaje costaría:</h7>
                            <div class="form-floating mb-3" style="text-align: right;">
                              <input class="form-control" id="precio" type="text" value="<%=misViajes.getCosto_unitario() * misViajes.getNumero_de_boletos()%>">
                              <label for="precio">Costo Total</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                          <a button class="btn btn-success text-white" type="submit"><b>Guardar cambios</b></a>
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
