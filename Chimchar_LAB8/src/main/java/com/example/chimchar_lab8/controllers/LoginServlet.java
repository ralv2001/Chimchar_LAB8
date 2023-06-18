package com.example.chimchar_lab8.controllers;

import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.daos.LoginDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = {"/LoginServlet",""})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ?
                "loginform" : request.getParameter("action");

        LoginDao loginDao = new LoginDao();
        HttpSession session = request.getSession();

        RequestDispatcher view;
        switch(action){
            case "loginform":
                view = request.getRequestDispatcher("Login.jsp");
                view.forward(request,response);
                break;
            case "logout":
                session.invalidate();
                response.sendRedirect(request.getContextPath()+"/Login.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LoginDao loginUsuario = new LoginDao();

        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");

        Usuarios usuario = loginUsuario.validarUsuarioPassword(email,password);

        if(usuario != null){
            HttpSession session = request.getSession();
            session.setAttribute("personaSession",usuario);
            session.setMaxInactiveInterval(10*60);

            int rol = usuario.getStatus().getId_status();
            String especialidad = usuario.getEspecialidad();

            if (rol == 1 && especialidad.equals("Telecomunicaciones") ){ //Normal
                response.sendRedirect(request.getContextPath()+"/ViajesServlet?a=normal");
            }
            if (rol == 2 && especialidad.equals("Telecomunicaciones")){ //Silver
                response.sendRedirect(request.getContextPath()+"/ViajesServlet?a=silver");
            }
            if (rol == 3 && especialidad.equals("Telecomunicaciones")){ //Gold
                response.sendRedirect(request.getContextPath()+"/ViajesServlet?a=gold");
            }
            if (rol == 4 && especialidad.equals("Telecomunicaciones")){ //Gold
                response.sendRedirect(request.getContextPath()+"/ViajesServlet?a=platinum");
            }
        }else{
            response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
        }
    }
}

