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
                viajes.setFecha_reserva(resultSet.getDate(2));
                viajes.setFecha_viaje(resultSet.getDate(3));
                viajes.setCiudad_origen(resultSet.getString(4));
                viajes.setCiudad_destino(resultSet.getString(5));

                EmpresaSeguro empresaSeguro =new EmpresaSeguro();
                empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                empresaSeguro.setNombre(resultSet.getString("EmpresaSeguro"));
                viajes.setEmpresaSeguro(empresaSeguro);

                viajes.setCosto_unitario(resultSet.getInt(7));
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


    public ArrayList<MisViajes> listarViajesUsuarioNormal(int id_usuario){
        ArrayList<MisViajes> viajesUsuarioNormal = new ArrayList<>();
        String sql="SELECT v.* , aseguradora.* FROM usuarios u, mis_viajes v, empresa_seguro aseguradora\n" +
                "WHERE u.id_usuarios = v.usuarios_id_usuarios and v.empresa_seguro_id_empresa_seguro = aseguradora.id_empresa_seguro \n" +
                "and u.status_idstatus = 1 and u.id_usuarios = ?;";

        try(Connection connection=this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_usuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    MisViajes viajes = new MisViajes();
                    viajes.setId_mis_viajes(resultSet.getInt(1));
                    viajes.setFecha_reserva(resultSet.getDate(2));
                    viajes.setFecha_viaje(resultSet.getDate(3));
                    viajes.setCiudad_origen(resultSet.getString(4));
                    viajes.setCiudad_destino(resultSet.getString(5));

                    EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                    empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                    empresaSeguro.setNombre(resultSet.getString(11));

                    viajes.setCosto_unitario(resultSet.getDouble(8));
                    viajes.setNumero_de_boletos(resultSet.getInt(9));
                    viajes.setEmpresaSeguro(empresaSeguro);

                    viajesUsuarioNormal.add(viajes);
                }
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return viajesUsuarioNormal;
    }

    public ArrayList<MisViajes> listarViajesUsuarioSilver(int id_usuario){
        ArrayList<MisViajes> viajesUsuarioSilver = new ArrayList<>();
        String sql="SELECT v.* , aseguradora.* FROM usuarios u, mis_viajes v, empresa_seguro aseguradora\n" +
                "WHERE u.id_usuarios = v.usuarios_id_usuarios and v.empresa_seguro_id_empresa_seguro = aseguradora.id_empresa_seguro \n" +
                "and u.status_idstatus = 2 and u.id_usuarios = ?;";

        try(Connection connection=this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_usuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    MisViajes viajes = new MisViajes();
                    viajes.setId_mis_viajes(resultSet.getInt(1));
                    viajes.setFecha_reserva(resultSet.getDate(2));
                    viajes.setFecha_viaje(resultSet.getDate(3));
                    viajes.setCiudad_origen(resultSet.getString(4));
                    viajes.setCiudad_destino(resultSet.getString(5));

                    EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                    empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                    empresaSeguro.setNombre(resultSet.getString(11));

                    viajes.setCosto_unitario(resultSet.getDouble(8));
                    viajes.setNumero_de_boletos(resultSet.getInt(9));
                    viajes.setEmpresaSeguro(empresaSeguro);

                    viajesUsuarioSilver.add(viajes);
                }
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return viajesUsuarioSilver;
    }

    public ArrayList<MisViajes> listarViajesUsuarioGold(int id_usuario){
        ArrayList<MisViajes> viajesUsuarioGold = new ArrayList<>();
        String sql="SELECT v.* , aseguradora.* FROM usuarios u, mis_viajes v, empresa_seguro aseguradora\n" +
                "WHERE u.id_usuarios = v.usuarios_id_usuarios and v.empresa_seguro_id_empresa_seguro = aseguradora.id_empresa_seguro \n" +
                "and u.status_idstatus = 3 and u.id_usuarios = ?;";

        try(Connection connection=this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_usuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    MisViajes viajes = new MisViajes();
                    viajes.setId_mis_viajes(resultSet.getInt(1));
                    viajes.setFecha_reserva(resultSet.getDate(2));
                    viajes.setFecha_viaje(resultSet.getDate(3));
                    viajes.setCiudad_origen(resultSet.getString(4));
                    viajes.setCiudad_destino(resultSet.getString(5));

                    EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                    empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                    empresaSeguro.setNombre(resultSet.getString(11));

                    viajes.setCosto_unitario(resultSet.getDouble(8));
                    viajes.setNumero_de_boletos(resultSet.getInt(9));
                    viajes.setEmpresaSeguro(empresaSeguro);

                    viajesUsuarioGold.add(viajes);
                }
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return viajesUsuarioGold;
    }

    public ArrayList<MisViajes> listarViajesUsuarioPlatinum(int id_usuario){
        ArrayList<MisViajes> viajesUsuarioPlatinum = new ArrayList<>();
        String sql="SELECT v.* , aseguradora.* FROM usuarios u, mis_viajes v, empresa_seguro aseguradora\n" +
                "WHERE u.id_usuarios = v.usuarios_id_usuarios and v.empresa_seguro_id_empresa_seguro = aseguradora.id_empresa_seguro \n" +
                "and u.status_idstatus = 4 and u.id_usuarios = ?;";

        try(Connection connection=this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_usuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    MisViajes viajes = new MisViajes();
                    viajes.setId_mis_viajes(resultSet.getInt(1));
                    viajes.setFecha_reserva(resultSet.getDate(2));
                    viajes.setFecha_viaje(resultSet.getDate(3));
                    viajes.setCiudad_origen(resultSet.getString(4));
                    viajes.setCiudad_destino(resultSet.getString(5));

                    EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                    empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                    empresaSeguro.setNombre(resultSet.getString(11));

                    viajes.setCosto_unitario(resultSet.getDouble(8));
                    viajes.setNumero_de_boletos(resultSet.getInt(9));
                    viajes.setEmpresaSeguro(empresaSeguro);

                    viajesUsuarioPlatinum.add(viajes);
                }
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return viajesUsuarioPlatinum;
    }

    public MisViajes listarViaje(int id_viaje) {
        MisViajes misViajes = null;

        String sql = "SELECT * FROM mis_viajes v, empresa_seguro es WHERE v.empresa_seguro_id_empresa_seguro = es.id_empresa_seguro\n" +
                "and id_mis_viajes = ?;";
        try(Connection connection=this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id_viaje);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    misViajes = new MisViajes();
                    misViajes.setId_mis_viajes(resultSet.getInt(1));
                    misViajes.setFecha_reserva(resultSet.getDate(2));
                    misViajes.setFecha_viaje(resultSet.getDate(3));
                    misViajes.setCiudad_origen(resultSet.getString(4));
                    misViajes.setCiudad_destino(resultSet.getString(5));

                    EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                    empresaSeguro.setId_empresa_seguro(resultSet.getInt(6));
                    empresaSeguro.setNombre(resultSet.getString(11));

                    misViajes.setCosto_unitario(resultSet.getDouble(8));
                    misViajes.setNumero_de_boletos(resultSet.getInt(9));
                    misViajes.setEmpresaSeguro(empresaSeguro);
                }
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return misViajes;
    }
}
