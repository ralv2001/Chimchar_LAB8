package com.example.chimchar_lab8.models.daos.Viajes;

import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.beans.Viajes.EmpresaSeguro;
import com.example.chimchar_lab8.models.daos.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ViajesDao extends BaseDao {

    public void editarViajes(String jobId, String jobTitle, int minSalary, int maxSalary) {

        try (Connection conn = this.getConnection()) {
            String sql = "UPDATE jobs SET job_title = ?, min_salary = ?, max_salary = ? "
                    + "WHERE job_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, jobTitle);
                pstmt.setInt(2, minSalary);
                pstmt.setInt(3, maxSalary);
                pstmt.setString(4, jobId);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    public void crearViajes(int id_mis_viajes, String fecha_reserva, String fecha_viaje, String ciudad_origen, String ciudad_destino, int id_empresa_seguro, int id_usuarios, double costo_total){

        try(Connection conn = this.getConnection()){
            String sql = "INSERT INTO `lab8`.`mis_viajes` (id_mis_viajes,fecha_reserva,fecha_viaje,ciudad_origen,ciudad_destino,empresa_seguro_id_empresa_seguro,usuarios_id_usuarios,costo_total) VALUES\n" +
                    "(?,?,?,?,?,?,?,?)";
            try(PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setInt(1, id_mis_viajes);
                pstmt.setString(2, fecha_reserva);
                pstmt.setString(3, fecha_viaje);
                pstmt.setString(4, ciudad_origen);
                pstmt.setString(5, ciudad_destino);
                pstmt.setInt(6, id_empresa_seguro);
                pstmt.setInt(7, id_usuarios);
                pstmt.setDouble(7, costo_total);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }




    }

}
