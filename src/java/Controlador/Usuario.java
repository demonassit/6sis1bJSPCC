/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author demon
 * 
 * va a representar la tabla de usuario en la bd
 */

import java.sql.*;

public class Usuario {
    
    private int usuario_Codigo, usuario_Privilegio;
    private String usuario_Nombre, usuario_Apellido, usuario_User, usuario_Clave;
    
    //creamos el constructor
    
    public Usuario(){}
    
    //crud de usuarios
    
    
    //metodo de verificacion de usuario para el ingreso al sistema
    
    public Usuario verificarUsuario(String user, String clave){
    
        //inicializar variables y objetos
        Usuario u = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            
            con = Conexion.getConnection();
            String q = "Select * from Usuario where usuario_User = ? AND usuario_Clave = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, user);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            //busco al usuario en la tabla
            while(rs.next()){
                //instancia del objeto usuario
                u = new Usuario();
                u.setUsuario_Codigo(rs.getInt("usuario_Codigo"));
                u.setUsuario_Nombre(rs.getString("usuario_Nombre"));
                u.setUsuario_Apellido(rs.getString("usuario_Apellido"));
                u.setUsuario_User(rs.getString("usuario_User"));
                u.setUsuario_Clave(rs.getString("usuario_Clave"));
                u.setUsuario_Privilegio(rs.getInt("usuario_Privilegio"));
                break;
            }
        
        }catch(SQLException e){
            System.out.println("Error al verificar usuario");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            u = null;
        
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            }catch (SQLException e){
            
            }
        }
        return u;
        
        
    }

    public int getUsuario_Codigo() {
        return usuario_Codigo;
    }

    public void setUsuario_Codigo(int usuario_Codigo) {
        this.usuario_Codigo = usuario_Codigo;
    }

    public int getUsuario_Privilegio() {
        return usuario_Privilegio;
    }

    public void setUsuario_Privilegio(int usuario_Privilegio) {
        this.usuario_Privilegio = usuario_Privilegio;
    }

    public String getUsuario_Nombre() {
        return usuario_Nombre;
    }

    public void setUsuario_Nombre(String usuario_Nombre) {
        this.usuario_Nombre = usuario_Nombre;
    }

    public String getUsuario_Apellido() {
        return usuario_Apellido;
    }

    public void setUsuario_Apellido(String usuario_Apellido) {
        this.usuario_Apellido = usuario_Apellido;
    }

    public String getUsuario_User() {
        return usuario_User;
    }

    public void setUsuario_User(String usuario_User) {
        this.usuario_User = usuario_User;
    }

    public String getUsuario_Clave() {
        return usuario_Clave;
    }

    public void setUsuario_Clave(String usuario_Clave) {
        this.usuario_Clave = usuario_Clave;
    }
    
    
    
}
