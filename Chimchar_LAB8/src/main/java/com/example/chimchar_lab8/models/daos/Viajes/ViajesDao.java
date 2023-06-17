package com.example.chimchar_lab8.models.daos.Viajes;

import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.beans.Viajes.EmpresaSeguro;
import com.example.chimchar_lab8.models.daos.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ViajesDao extends BaseDao {
    public void crearViajes(int id_mis_viajes, String fecha_reserva, String fecha_viaje, String ciudad_origen, String ciudad_destino, EmpresaSeguro empresaSeguro, Usuarios usuarios, double costo_total){

        try(Connection conn = this.getConnection()){
            String sql = "INSERT INTO `lab8`.`mis_viajes` (id_mis_viajes,fecha_reserva,fecha_viaje,ciudad_origen,ciudad_destino,empresa_seguro_id_empresa_seguro,usuarios_id_usuarios,costo_total) VALUES\n" +
                    "(?,?,?,?,?,?,?,?)";
            try(PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setInt(1, id_mis_viajes);
                pstmt.setString(2, fecha_reserva);
                pstmt.setString(3, fecha_viaje);
                pstmt.setInt(4, ciudad_origen);
                pstmt.setInt(5, ciudad_destino);
                pstmt.setString(6, empresaSeguro);
                pstmt.setInt(7, usuarios);
                pstmt.setInt(7, costo_total);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

}
