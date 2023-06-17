package com.example.chimchar_lab8.models.daos;

import com.example.chimchar_lab8.models.beans.Usuarios.Status;
import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao extends BaseDao{

    public Usuarios obtenerUsuario(int usuarioId) {

        Usuarios usuarios = null;

        String sql = "SELECT u.*, s.nombre FROM usuarios u inner join status s on (u.status_idstatus = s.id_status)\n" +
                "WHERE u.id_usuarios = ?;";

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
        usuario.setCodigo(rs.getInt(5));
        usuario.setCorreo(rs.getString(6));
        usuario.setEspecialidad(rs.getString(7));
        usuario.setContrasenia(rs.getString(8));

        Status status = new Status();
        status.setId_status(rs.getInt(9));
        status.setNombre(rs.getString(10));
        usuario.setStatus(status);
    }

    public Usuarios validarUsuarioPassword(String username, String password){

        Usuarios usuario = null;
        String hashedPassword = hashPassword(password);

        String sql = "Select * from usuarios where correo = ? and hashcontrasenia = SHA2(?,256);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,username);
            pstmt.setString(2,hashedPassword);

            try (ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    usuario = obtenerUsuario(rs.getInt(1));
                }
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return usuario;
    }

    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));

            // Convertir los bytes del hash a una representación hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : hashBytes) {
                String hex = Integer.toHexString(0xff & hashByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
