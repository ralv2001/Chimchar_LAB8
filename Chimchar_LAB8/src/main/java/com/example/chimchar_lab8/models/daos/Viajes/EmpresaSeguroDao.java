package com.example.chimchar_lab8.models.daos.Viajes;

import com.example.chimchar_lab8.models.beans.Viajes.EmpresaSeguro;
import com.example.chimchar_lab8.models.daos.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EmpresaSeguroDao extends BaseDao {
    public ArrayList<EmpresaSeguro> listarSeguros() {

        ArrayList<EmpresaSeguro> listaSeguros = new ArrayList<>();

        String sql = "SELECT * FROM lab8.empresa_seguro;";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                EmpresaSeguro empresaSeguro = new EmpresaSeguro();
                empresaSeguro.setId_empresa_seguro(resultSet.getInt("idSeguro"));
                empresaSeguro.setNombre(resultSet.getString("nombre"));
                listaSeguros.add(empresaSeguro);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaSeguros;
    }

}
