package servlets;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.*;
/**
 *
 * @author jaime
 */
public class Conexion {

    public static Connection getConexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/banco_mexico";
            String usuario="root";
            String clave="n0m3l0";
            System.out.print("SE CONECTO A LA BASE DE DATOS CORRECTAMENTE DESDE EL SERVLET DE CONEXION");
            return DriverManager.getConnection(url,usuario,clave);
        }catch(SQLException ex){
            System.out.print("NO SE CONECTO A LA BASE DE DATOS CORRECTAMENTE DESDE EL SERVLET DE CONEXION" + ex);
            ex.printStackTrace();
        }catch(Exception ex){
            System.out.print("NO SE CONECTO A LA BASE DE DATOS CORRECTAMENTE DESDE EL SERVLET DE CONEXION"+ ex);
            ex.printStackTrace();
        }
        return null;
    }

}
