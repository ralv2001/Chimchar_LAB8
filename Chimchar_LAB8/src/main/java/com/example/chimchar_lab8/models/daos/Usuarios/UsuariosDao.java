package com.example.chimchar_lab8.models.daos.Usuarios;

import com.example.chimchar_lab8.models.beans.Usuarios.Status;
import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.daos.BaseDao;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDao extends BaseDao {

    public Usuarios obtenerUsuario(int id_usuarios) {

        Usuarios usuarios = null;

        String sql = "select * from usuarios where id_usuarios = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id_usuarios);
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



    public void crearUsuario(Usuarios usuarios, Status status){

        String sql = "INSERT INTO usuario (correo,nombre,apellido,contrasenha, contrasenha_hashed, status, edad, codigo, especialidad) \n" +
                "VALUES (?,?,?,?,?,?,?,?,?)";

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,usuarios.getCorreo());
            pstmt.setString(2,usuarios.getNombre());
            pstmt.setString(3,usuarios.getApellido());
            pstmt.setString(4,usuarios.getContrasenia());


            pstmt.setString(5,hashearContrasenia(usuarios.getContrasenia()));

            //CASO ESPECIAL PARA STATUS
            pstmt.setInt(6,status.getId_status());

            pstmt.setInt(7,usuarios.getEdad());
            pstmt.setInt(8,usuarios.getCodigo());
            pstmt.setString(9,usuarios.getEspecialidad());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static String hashearContrasenia(String contrasenia) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(contrasenia.getBytes(StandardCharsets.UTF_8));

            // Convertir el hash a una representación en formato hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }


    private void fetchUsuarioData(Usuarios usuarios, ResultSet rs) throws SQLException {
        usuarios.setId_usuarios(rs.getInt("idUsuario"));
        usuarios.setCorreo(rs.getString("correo"));
        usuarios.setNombre(rs.getString("nombre"));
        usuarios.setApellido(rs.getString("apellido"));
        usuarios.setContrasenia(rs.getString("contrasenia_hasheada"));

        //CASO ESPECIAL:
        Status status = new Status();
        status.setId_status(rs.getInt("status"));

        usuarios.setEdad(rs.getInt("edad"));
        usuarios.setCodigo(rs.getInt("codigo"));
        usuarios.setEspecialidad(rs.getString("especialidad"));

    }


    public Usuarios validarUsuarioyContrasenia(String username, String password) {

        Usuarios usuario = null;

        String sql = "select * from usuario\n" +
                "where correo = ? and contrasenha_hashed = SHA2(?,256) and  especialidad = 'Ingenieria de las Telecomunicaciones';";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = obtenerUsuario(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }
}
