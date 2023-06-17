package com.example.chimchar_lab8.models.daos;

import com.example.chimchar_lab8.models.beans.Usuarios.Status;
import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao extends BaseDao{

    public Usuarios obtenerUsuario(int usuarioId) {

        Usuarios usuarios = null;

        String sql = "SELECT * FROM usuarios u, status s\n" +
                "WHERE u.status_idstatus = s.id_status and u.id_usuarios = ?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuarios = new Usuarios();
                    fetchUsuarioData(usuarios, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuarios;
    }


    private void fetchUsuarioData(Usuarios usuario, ResultSet rs) throws SQLException {

        usuario.setId_usuarios(rs.getInt(1));
        usuario.setNombre(rs.getString(2));
        usuario.setApellido(rs.getString(3));
        usuario.setEdad(rs.getInt(4));

        usuario.setCorreo(rs.getString(6));
        usuario.setEspecialidad(rs.getString(7));
        usuario.setContrasenia(rs.getString(8));

        Status status = new Status();
        status.setId_status(rs.getInt(10));
        status.setNombre(rs.getString(11));
        usuario.setStatus(status);

        usuario.setHashcontrasenia(rs.getString(12));
    }

    public Usuarios validarUsuarioPassword(String username, String password){

        Usuarios usuario = null;

        String sql = "Select * from usuarios where correo = ? and hashcontrasenia = SHA2(?,256)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,username);
            pstmt.setString(2,password);

            try (ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    int usuarioId = rs.getInt(1);
                    usuario = this.obtenerUsuario(usuarioId);
                }
            }

        }catch (SQLException ex){
            ex.printStackTrace();
        }


        return usuario;
    }

}
