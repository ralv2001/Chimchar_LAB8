package com.example.chimchar_lab8.controllers;

import com.example.chimchar_lab8.models.beans.Usuarios.Status;
import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.daos.Usuarios.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "CrearUsuarioServlet", urlPatterns = {"/CrearUsuarioServlet"})
public class CrearUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsuariosDao usuariosDao = new UsuariosDao();

        Usuarios usuarios = parseUsuario(request);
        Status status = new Status();

        if (usuarios!= null){

            boolean valida_usuario = validarCampos(usuarios.getNombre(),usuarios.getApellido(),usuarios.getEdad(),usuarios.getCodigo(),usuarios.getCorreo(),usuarios.getEspecialidad(),usuarios.getContrasenia());

            if (valida_usuario){
                usuariosDao.crearUsuario(usuarios,status);

            }else{
                System.out.println("NO");
            }



        }else{
            response.sendRedirect(request.getContextPath() + "/CrearUsuarioServlet");
            System.out.println("la contra seguro no coincidia");
        }




    }


    public Usuarios parseUsuario(HttpServletRequest request) {

        Usuarios usuario = new Usuarios();
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edadstr = request.getParameter("edad");
        String codigostr = request.getParameter("codigo");
        String correo = request.getParameter("correo");
        String especialidad = request.getParameter("especialidad");
        String contrasenha = request.getParameter("contrasenha");

        String contrasenia_repetida =request.getParameter("contrasenha_repetida");


        try {
            int edad = Integer.parseInt(edadstr);
            int codigo = Integer.parseInt(codigostr);

            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setEdad(edad);
            usuario.setCodigo(codigo);
            usuario.setCorreo(correo);
            usuario.setEspecialidad(especialidad);
            usuario.setContrasenia(contrasenha);

            //CASO ESPECIAL
            Status status = new Status();
            status.setId_status(1);


            if(!contrasenia_repetida.equals(contrasenha)){
                return null;
            }


            return usuario;

        } catch (NumberFormatException e) {
            return null;
        }
    }



    //VALIDACIONES

    private static final String NOMBRE_REGEX = "^[^\\d].*";
    private static final String APELLIDO_REGEX = "^[^\\d].*";
    private static final String EDAD_REGEX = "^1[8-9]|2[0-9]$";
    private static final String CODIGO_PUCP_REGEX = "^\\d{8}$";
    private static final String CONTRASENA_REGEX = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()\\[\\]{}\\-_+=]).*$";

    public static boolean validarCampos(String nombre, String apellido, int edad, int codigoPUCP, String correoPUCP, String especialidad, String contrasena) {
        boolean isValid = true;

        // Validando nombre
        isValid &= validarRegex(NOMBRE_REGEX, nombre);

        // Validando apellido
        isValid &= validarRegex(APELLIDO_REGEX, apellido);

        // Validando edad
        isValid &= validarRegex(EDAD_REGEX, String.valueOf(edad));

        // Validando código PUCP
        isValid &= validarRegex(CODIGO_PUCP_REGEX, String.valueOf(codigoPUCP));

        // Validando correo PUCP
        String correoPUCPRegex = "^a" + (codigoPUCP) + "@pucp.edu.pe$";
        isValid &= validarRegex(correoPUCPRegex, correoPUCP);

        // Validando contraseña
        isValid &= validarRegex(CONTRASENA_REGEX, contrasena);

        return isValid;
    }

    private static boolean validarRegex(String regex, String input) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }
}