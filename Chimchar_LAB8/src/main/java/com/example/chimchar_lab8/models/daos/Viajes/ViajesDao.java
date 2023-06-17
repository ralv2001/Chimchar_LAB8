package com.example.chimchar_lab8.models.daos.Viajes;

import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;
import com.example.chimchar_lab8.models.beans.Viajes.EmpresaSeguro;
import com.example.chimchar_lab8.models.beans.Viajes.MisViajes;
import com.example.chimchar_lab8.models.daos.BaseDao;
import com.sun.jdi.VMMismatchException;

import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends BaseDao {

    public ArrayList<MisViajes> listarViajes(){
        ArrayList<MisViajes> lista = new ArrayList<>();
        String sql="SELECT\n" +
                "  mv.id_mis_viajes AS `Identificador del viaje`,\n" +
                "  mv.fecha_reserva AS `Fecha de reserva`,\n" +
                "  mv.fecha_viaje AS `Fecha del viaje`,\n" +
                "  mv.ciudad_origen AS `Ciudad origen`,\n" +
                "  mv.ciudad_destino AS `Ciudad destino`,\n" +
                "  es.nombre AS `Empresa de seguro`,\n" +
                "  mv.numero_de_boletos AS `Numero de boletos`,\n" +
                "  mv.costo_total AS `Costo total`\n" +
                "FROM\n" +
                "  mis_viajes mv\n" +
                "INNER JOIN\n" +
                "  empresa_seguro es ON mv.empresa_seguro_id_empresa_seguro = es.id_empresa_seguro;";

        try(Connection connection=this.getConnection();
            Statement stmt= connection.createStatement();
            ResultSet resultSet=stmt.executeQuery(sql)){

            while(resultSet.next()){
                MisViajes viajes=new MisViajes();
                viajes.setId_mis_viajes(resultSet.getInt(1));
                viajes.setFecha_reserva(resultSet.getString(2));
                viajes.setFecha_viaje(resultSet.getString(3));
                viajes.setCiudad_origen(resultSet.getString(4));
                viajes.setCiudad_destino(resultSet.getString(5));

                EmpresaSeguro empresaSeguro =new EmpresaSeguro();
                empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                empresaSeguro.setNombre(resultSet.getString("EmpresaSeguro"));
                viajes.setEmpresaSeguro(empresaSeguro);

                viajes.setCosto_total(resultSet.getInt(7));
                viajes.setCiudad_destino(resultSet.getString(8));

                lista.add(viajes);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return lista;
    }


    public void editarViajes(String fecha_reserva, String fecha_viaje, String ciudad_origen, String ciudad_destino, int id_empresa_seguro, int costo_total, int numero_de_boletos) {

        try (Connection conn = this.getConnection()) {
            String sql = "UPDATE mis_viajes SET fecha_reserva = ?, fecha_viaje = ?, ciudad_origen = ?, ciudad_destino = ?, empresa_seguro_id_empresa_seguro = ?, costo_total = ?, numero_de_boletos = ?\n" +
                    "WHERE id_mis_viajes = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, fecha_reserva);
                pstmt.setString(2, fecha_viaje);
                pstmt.setString(3, ciudad_origen);
                pstmt.setString(4, ciudad_destino);
                pstmt.setInt(5, id_empresa_seguro);
                pstmt.setInt(6, costo_total);
                pstmt.setInt(7, numero_de_boletos);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void crearViajes(int id_mis_viajes, String fecha_reserva, String fecha_viaje, String ciudad_origen, String ciudad_destino, int id_empresa_seguro, int id_usuarios, double costo_total, int numero_de_boletos){

        try(Connection conn = this.getConnection()){
            String sql = "INSERT INTO `mis_viajes` (id_mis_viajes,fecha_reserva,fecha_viaje,ciudad_origen,ciudad_destino,empresa_seguro_id_empresa_seguro,usuarios_id_usuarios,costo_total,numero_de_boletos) VALUES\n" +
                    "(?,?,?,?,?,?,?,?,?)";
            try(PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setInt(1, id_mis_viajes);
                pstmt.setString(2, fecha_reserva);
                pstmt.setString(3, fecha_viaje);
                pstmt.setString(4, ciudad_origen);
                pstmt.setString(5, ciudad_destino);
                pstmt.setInt(6, id_empresa_seguro);
                pstmt.setInt(7, id_usuarios);
                pstmt.setDouble(8, costo_total);
                pstmt.setInt(9, numero_de_boletos);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



    }

}
