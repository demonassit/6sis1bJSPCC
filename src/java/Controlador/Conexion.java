/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author demon
 */

import java.sql.*;

public class Conexion {
    
    public static Connection getConnection(){
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            String url= "jdbc:mysql://localhost:3306/ventas";
            String user = "root";
            String pass = "n0m3l0";
            return DriverManager.getConnection(url, user, pass);
        
        }catch(SQLException e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        
        }catch(Exception e){
            System.out.println(e.getStackTrace());
        }
        return null;
    }
    
}
