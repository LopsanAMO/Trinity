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
                
                public static LinkedList<Usuario> getconsulta5()
   {
      LinkedList<Usuario> listaconsulta=new LinkedList<Usuario>();
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
        Statement st = null;
        Connection conexion=null;
         try{
             conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/banco_mexico", "root", "n0m3l0");
         st = conexion.createStatement();
            System.out.println("Se conecto con exito a la base de datos en el servlet busca");
         }
         catch(SQLException e){
             System.out.println("no se pudo conectar a la base de datos en el servlet busca");
         }
         ResultSet rs = st.executeQuery("select * from Servicio_baja");
         System.out.println("Aqui deberia de haber un consulta "+rs);
         while (rs.next())
         {
            Usuario consultita = new Usuario();
            consultita.setBaja_id(rs.getInt("id_baja"));
            consultita.setUsuario_user(rs.getString("Usuario"));
            consultita.setUsuario_email(rs.getString("correo"));
            consultita.setBaja_razon(rs.getString("razon"));
            consultita.setUsuario_temporal(rs.getString("temporal"));
            listaconsulta.add(consultita);
            System.out.println("se pudo seleccionar todo de servicio_paga ene el servlet de busca en la getconsulta5");
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("no se pudo hacer la seleccion en el servlet de busca en el metodo getconsulta5");
      }
      return listaconsulta;
   
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
         ResultSet rs = st.executeQuery("select * from registro where Usuario='"+usuario+"'");
         System.out.println("Aqui deberia de haber un consulta "+st);
         while (rs.next())
         {
             System.out.println("ESTOY FELIZ"+st);
            Usuario consultita = new Usuario();

            consultita.setUsuario_email(rs.getString("Email"));
            consultita.setUsuario_card(rs.getString("Num_tar"));
            listaconsulta.add(consultita);
            System.out.println("Se pudo seleccional de registro en el servlet busca en el metodo getconsulta4");
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("No se conecto a consulta4");
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
          System.out.println("RSTOY AQUI");
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
            System.out.println("TODO OC CON LA WEA DE BUSCAR en el servlet de busca en el metodo getconsulta3");
         }
         rs.close();
         st.close();
         conexion.close();
         
      }
      catch (Exception e)
      {
        System.out.println("no se ha conectado a la wea del servlet de busca en el metodo getconsulta3");
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
            System.out.println("Se pudo selecctionar de registro del servlet busca en el metodo get colsulta3");
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("no se seleccion de registro del servlet busca en el metodo getconsulta3");
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
            System.out.println("se pudo seleccionar de historial en el serblet busca en el metodo getconsulta2");
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
        System.out.println("no se pudo acceder a la tabla de historial en el servlet de busca en el metodo getconsulta2");
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
            System.out.println("se pudo hacer la consulta en el servlet de busca en el metodo de getconsulta");
            break;
         }
      }
      catch (SQLException ex){
            ex.printStackTrace();
            consultita=null;
        System.out.println("NO SE PUDO CONECTAR EXITOSAMENTE A LA TABLA DE HISTORIAL del servlet de busca en el metodo getconsulta");
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

