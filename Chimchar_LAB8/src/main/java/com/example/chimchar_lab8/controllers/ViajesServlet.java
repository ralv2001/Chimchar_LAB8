package com.example.chimchar_lab8.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ViajesServlet", urlPatterns = {"/ViajesServlet"})
public class ViajesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "normal" : request.getParameter("a");

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
                request.getRequestDispatcher("editarViaje.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}