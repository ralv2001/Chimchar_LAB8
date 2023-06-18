<%@ page import="com.example.chimchar_lab8.models.daos.Viajes.ViajesDao" %>
<%@ page import="com.example.chimchar_lab8.models.beans.Viajes.MisViajes" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: milene
  Date: 17/06/2023
  Time: 05:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="personaSession" type="com.example.chimchar_lab8.models.beans.Usuarios.Usuarios" scope="session" class="com.example.chimchar_lab8.models.beans.Usuarios.Usuarios"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Usuario Platinum</title>
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
    <body class="d-flex flex-column h-100" style="background-image: url(recursos/assets/map-image.png); background-repeat: no-repeat; background-size: cover; background-color: rgba(47,53,59,0.56);">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light py-3" style="background-color: rgba(4,7,12,0.85);">
                <div class="container px-5">
                    <div class="badge bg-gradient-primary-to-secondary text-white mb-4"><div class="text-uppercase">Platinum </div></div>
                    <span style="margin-right: 10px;"></span>
                    <span style="margin-right: 10px;"></span>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ViajesServlet?a=platinum"><span class="fw-bolder text-white">Bienvenido <%=personaSession.getNombre() + " " + personaSession.getApellido()%> </span></a>
                    <br>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                            <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/LoginServlet?action=logout"><b class="section-subheading text-light"><u>Cerrar Sesion ></u></b></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <br>
            <br>

            <section class="page-section" id="viajes" >
                <div class="container" >

                    <div class="text-center">
                        <h4 class="display-5 fw-bolder"><span class="text-gradient d-inline"> ✈️ MIS VIAJES</span></h4>
                    </div>
                    <div class="text-lg-end">

                        <h7 class="section-subheading text-dark">¿Planea viajar a un nuevo destino? <br>¡Registre su viaje!<br></h7>
                        <a class="btn btn-success" href="<%=request.getContextPath()%>/ViajesServlet?a=crear">Añadir viaje </a>
                        <br>
                        <br>
                        <div class="input-group input-group-joined input-group-solid">
                            <input class="form-control pe-0" type="search" placeholder="Buscar" aria-label="Buscar">
                            <div class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></div>
                        </div>
                    </div>

                    <br>

                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead style="background-color: rgb(206,192,234);">
                                        <tr>
                                            <th class="text-center" style="background-color: rgb(206,192,234);">ID VIAJE</th>
                                            <th class="text-center">Fecha de Reserva</th>
                                            <th class="text-center">Fecha de Viaje</th>
                                            <th class="text-center">Ciudad de origen</th>
                                            <th class="text-center">Ciudad de destino</th>
                                            <th class="text-center">Empresa de seguro</th>
                                            <th class="text-center">Numero de boletos</th>
                                            <th class="text-center">Precio unitario</th>
                                            <th class="text-center">Costo total</th>
                                            <th class="text-center"> </th>
                                        </tr>
                                    </thead>

                                    <% int idUsuario = personaSession.getId_usuarios();%>
                                    <% ViajesDao viajesDao = new ViajesDao();%>
                                    <% ArrayList<MisViajes> viajesPorUsuario = viajesDao.listarViajesUsuarioPlatinum(idUsuario) ;%>

                                    <tbody>
                                        <% for (MisViajes listaViajes : viajesPorUsuario) {%>
                                        <tr>
                                            <td class="text-center"><%=listaViajes.getId_mis_viajes()%></td>
                                            <td class="text-center"><%=listaViajes.getFecha_reserva()%></td>
                                            <td class="text-center"><%=listaViajes.getFecha_viaje()%></td>
                                            <td class="text-center"><%=listaViajes.getCiudad_origen()%></td>
                                            <td class="text-center"><%=listaViajes.getCiudad_destino()%></td>
                                            <td class="text-center"><%=listaViajes.getEmpresaSeguro().getNombre()%></td>
                                            <td class="text-center"><%=listaViajes.getNumero_de_boletos()%></td>
                                            <td class="text-center"><%=listaViajes.getCosto_unitario()%></td>
                                            <td class="text-center"><%=listaViajes.getCosto_unitario() * listaViajes.getNumero_de_boletos()%></td>
                                            <td class="text-center">
                                                <a href="<%=request.getContextPath()%>/ViajesServlet?a=editar" type="button" class="btn btn-light">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <br>
            <footer class="footer py-4">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2023</div>
                        <div class="col-lg-4 my-3 my-lg-0">

                        </div>
                        <div class="col-lg-4 text-lg-end">
                            <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                            <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                        </div>
                    </div>
                </div>
            </footer>
        </main>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="recursos/js/scripts.js"></script>
    </body>
</html>
