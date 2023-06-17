package com.example.chimchar_lab8.models.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseDao {

    public Connection getConnection() throws SQLException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex){
            ex.printStackTrace();
        }
        String url = "jdbc:mysql://localhost:3306/lab8";
        String user = "root";
        String pass = "root";

        return DriverManager.getConnection(url,user,pass);
    }

}
