package com.example.chimchar_lab8.controllers;

import com.example.chimchar_lab8.models.beans.Viajes.MisViajes;
import com.example.chimchar_lab8.models.daos.Viajes.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ViajesServlet", urlPatterns = {"/ViajesServlet"})
public class ViajesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "normal" : request.getParameter("a");
        ViajesDao viajesDao = new ViajesDao();

        switch (action){
            case "normal":
                request.getRequestDispatcher("usuarioNormal.jsp").forward(request,response);
                break;
            case "silver":
                request.getRequestDispatcher("usuarioSilver.jsp").forward(request,response);
                break;
            case "gold":
                request.getRequestDispatcher("usuarioGold.jsp").forward(request,response);
                break;
            case "platinum":
                request.getRequestDispatcher("usuarioPlatinum.jsp").forward(request,response);
                break;

            case "crear":
                request.getRequestDispatcher("crearViaje.jsp").forward(request,response);
                break;

            case "editar":
                String id_viajeStr = request.getParameter("id_viaje");
                int id_viaje = Integer.parseInt(id_viajeStr);
                request.setAttribute("misViajes", viajesDao.listarViaje(id_viaje));
                request.getRequestDispatcher("editarViaje.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ViajesDao viajesDao = new ViajesDao();

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");
        switch (action) {

            case "aNormal": //actualizar

                response.sendRedirect(request.getContextPath() + "/ViajesServlet?a=normal");
                break;
            case "aSilver": //actualizar


                response.sendRedirect(request.getContextPath() + "/ViajesServlet?a=silver");
                break;
            case "aGold": //actualizar


                response.sendRedirect(request.getContextPath() + "/ViajesServlet?a=gold");
                break;
            case "aPlatinum": //actualizar


                response.sendRedirect(request.getContextPath() + "/ViajesServlet?a=platinum");
                break;
        }

    }


}