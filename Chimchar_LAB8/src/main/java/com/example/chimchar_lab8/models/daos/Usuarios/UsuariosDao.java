package com.example.chimchar_lab8.models.daos.Usuarios;

import com.example.chimchar_lab8.models.daos.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuariosDao extends BaseDao {

    public void crearUsuarios(int id_usuarios, String nombre, String apellido, int edad, String correo, String especialidad, String contrasenia, int id_status){

        try(Connection conn = this.getConnection()){
            String sql = "INSERT INTO `mis_viajes` (id_usuarios,nombre,apellido,edad,correo,especialidad,contrasenia,status_idstatus) VALUES\n" +
                    "(?,?,?,?,?,?,?,?)";
            try(PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setInt(1, id_usuarios);
                pstmt.setString(2, nombre);
                pstmt.setString(3, apellido);
                pstmt.setInt(4, edad);
                pstmt.setString(5, correo);
                pstmt.setString(6, especialidad);
                pstmt.setString(7, contrasenia);
                pstmt.setInt(8, id_status);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



    }
}
