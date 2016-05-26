/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.Usuario;


/**
 *
 * @author Lopsan
 */
public class busca extends HttpServlet {

	        public static String usuarioo;

	/** Crea un nueva instancia de la clase producto */
		public busca(){

	}
                
                
                
                  public static LinkedList<Usuario> getconsulta4(String usuario)
   {
      LinkedList<Usuario> listaconsulta=new LinkedList<Usuario>();
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/banco_mexico", "root", "n0m3l0");
         Statement st = conexion.createStatement();
         System.out.println("Aqui deberia de ir un usuario" + usuario);
         ResultSet rs = st.executeQuery("select * from registro where Usuario='6ea82ae0704946d9879ce7588636ba45'");
         System.out.println("Aqui deberia de haber un consulta "+st);
         while (rs.next())
         {
            Usuario consultita = new Usuario();

            consultita.setUsuario_email(rs.getString("Email"));
            consultita.setUsuario_pass(rs.getString("Tarjeta"));
        
            listaconsulta.add(consultita);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("Se ha conectado a la base de detalleventa");
      }
      return listaconsulta;
   
} 
                
                
                public static LinkedList<Usuario> getconsulta3(String usuario)
   {
      LinkedList<Usuario> listaconsulta=new LinkedList<Usuario>();
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/banco_mexico", "root", "n0m3l0");
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("select * from historial where Usuario='"+usuario+"'");
         while (rs.next())
         {
            Usuario consultita = new Usuario();
            consultita.setUsuario_user(rs.getString("Usuario"));
            consultita.setUsuario_email(rs.getString("Email"));
            consultita.setUsuario_card(rs.getString("Tarjeta"));
            consultita.setUsuario_pago(rs.getString("Pago"));
            consultita.setUsuario_cargo(rs.getInt("Cargo"));
            consultita.setUsuario_fecha(rs.getString("Fecha"));
            listaconsulta.add(consultita);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("Se ha conectado a la base de detalleventa");
      }
      
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/banco_mexico", "root", "n0m3l0");
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("select * from registro where Usuario='"+usuario+"'");
         while (rs.next())
         {
            Usuario consultit = new Usuario();
            consultit.setUsuario_pass(rs.getString("Contra"));
            listaconsulta.add(consultit);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("Se ha conectado a la base de detalleventa");
      }
      
      
      
      return listaconsulta;
   
} 
        public static LinkedList<Usuario> getconsulta2()
   {
      LinkedList<Usuario> listaconsulta=new LinkedList<Usuario>();
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/banco_mexico", "root", "n0m3l0");
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("select * from historial ");
         while (rs.next())
         {
            Usuario consultita = new Usuario();
            consultita.setUsuario_user(rs.getString("Usuario"));
            consultita.setUsuario_email(rs.getString("Email"));
            consultita.setUsuario_card(rs.getString("Tarjeta"));
            consultita.setUsuario_pago(rs.getString("Pago"));
            consultita.setUsuario_cargo(rs.getInt("Cargo"));
            consultita.setUsuario_fecha(rs.getString("Fecha"));
            listaconsulta.add(consultita);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("Se ha conectado a la base de detalleventa");
      }
      return listaconsulta;
   
}   
                
   public static LinkedList<Usuario> getconsulta()
   {
      LinkedList<Usuario> listaconsulta=new LinkedList<Usuario>();
      Usuario consultita = null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
      try
      {
          cn=Conexion.getConexion();
            String sql="SELECT * FROM historial";
            pr=cn.prepareStatement(sql);
            System.out.println(pr);
            rs=pr.executeQuery();
         while (rs.next())
         {
            consultita = new Usuario();
            consultita.setUsuario_user(rs.getString("Usuario"));
            consultita.setUsuario_email(rs.getString("Email"));
            consultita.setUsuario_card(rs.getString("Tarjeta"));
            consultita.setUsuario_pago(rs.getString("Pago"));
            consultita.setUsuario_cargo(rs.getInt("Cargo"));
            consultita.setUsuario_fecha(rs.getString("Fecha"));
            listaconsulta.add(consultita);
            break;
         }
      }
      catch (SQLException ex){
            ex.printStackTrace();
            consultita=null;
        System.out.println("NO SE PUDO CONECTAR EXITOSAMENTE A LA TABLA DE HISTORIAL");
      }
      finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){
                consultita=null;
            }
        }
      for(int i=0;i<5;i++){
          System.out.println("HIOOSDOSDA"+listaconsulta.get(i).getUsuario_user());
      }
      return listaconsulta;
   
}
}

