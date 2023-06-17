package com.example.chimchar_lab8.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UsuariosServlet", urlPatterns = {"/UsuariosServlet"})
public class UsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*JugadorDao jugadorDao=new JugadorDao();
        SeleccionDao seleccionDao=new SeleccionDao();
        String action=request.getParameter("a")==null ? "listarJugadores":request.getParameter("a");

        switch(action){
            case "listarJugadores":
                request.setAttribute("listaJugador",jugadorDao.listarJugadores());
                request.getRequestDispatcher("listaJugadores.jsp").forward(request,response);
                break;
            case "crearJugador":
                request.setAttribute("listaSelecciones",seleccionDao.listarSelecciones());
                request.getRequestDispatcher("nuevoJugador.jsp").forward(request,response);
                break;
        }
         */

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}