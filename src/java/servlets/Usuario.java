/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.net.UnknownHostException;
import java.sql.*;
import java.util.Date;
import java.util.Properties;
 
/**
 *
 * @author antonio
 */
public class Usuario{
        private String Email;
	private String Usuario;
	private String Contra;
	private String Num_tar;
        private int CVV;
        private int Id_usu;
        private int llama_loc;
        private int llama_int;
        private int ajua;
        private int luza;
        private int fondo;
        private String idi;
        private String temporal;
        private String Pago;
        private int cargo;
        private String Fecha;
	/** Crea un nueva instancia de la clase usuario con magia de sirenas*/
	public Usuario(){

	}

     /**
     * Metodo usado para verificar si un usuario esta registrado en la Base de Datos
     * con su User y Clave de forma correcta
     * @param correo
     * @return 
     */
        
        
        
    public Usuario dameId(String id){
        Usuario u = null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE id_lost=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, id);
            System.out.println(pr);
            rs=pr.executeQuery();
            if(!rs.next()){
                u=null;
                System.out.println("Pinshi error pitero");
            }
            while(rs.next()){
                u=new Usuario();
                u.setUsuario_idi(rs.getString("id_lost"));
                System.out.println("Se encontro usuario para cambio de contraseña");
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("Algo paso mal" + ex);
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){
                u=null;
            }
        }
        
        System.out.println("Estado del u "+u);
        return u;
    }      
        
    public Usuario lost(String correo){
        Usuario u = null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE Email=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, correo);
            rs=pr.executeQuery();
            while(rs.next()){
                u=new Usuario();
                u.setUsuario_idi(rs.getString("id_lost"));
                System.out.println("Se encontro usuario para cambio de contraseña");
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("Algo paso mal" + ex);
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        
        
        return u;
    }    
       
    public Usuario finde(String user){
        Usuario u = null;
         Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE Usuario=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            rs=pr.executeQuery();
            while(rs.next()){
                u=new Usuario(); 
                u.setUsuario_email(rs.getString("Email"));
               
                System.out.println("Se encontro usuario");
                System.out.println("SE ENCONTRO UN EMAIL: "+ u.getUsuario_email());
               
                
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("Algo paso mal");
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        return u;
    }  
    
    
    public Usuario pagar(String user){
        Usuario u = null;
         Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM tarjeta WHERE Usuario=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            rs=pr.executeQuery();
            while(rs.next()){
                u=new Usuario(); 
                u = u.finde(user);
                System.out.println("SE ENCONTRO UN EMAIL: "+ u.getUsuario_email());
                u.setUsuario_fondos(rs.getInt("fondos"));
                u.setUsuario_card(rs.getString("card"));
                System.out.println("Se encontro usuario");
                
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("Algo paso mal");
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        return u;
    }    
        
    public Usuario verificarUsuario(String user, String clave){
        Usuario u=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE Usuario=? AND Contra=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            pr.setString(2, clave);
            rs=pr.executeQuery();
            System.out.println(pr);
            while(rs.next()){
                u=new Usuario(); 
                u.setUsuario_user(rs.getString("Usuario"));
                u.setUsuario_email(rs.getString("Email"));
                u.setUsuario_pass(rs.getString("Contra"));
                u.setUsuario_card(rs.getString("Num_tar"));
                u.setUsuario_cvv(rs.getInt("CVV"));
                u.setUsuario_aidi(rs.getInt("Id_usu"));
                u.setUsuario_temporal(rs.getString("temp_us"));
                System.out.println("Se encontro temporal" + u.getUsuario_temporal());
                
                break;
                
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("No Se conecto");
        }
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM pagos WHERE Usuario=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);;
            rs=pr.executeQuery();
            while(rs.next()){
                u=new Usuario(); 
                u.setLlamadaLocal(rs.getInt("llamada_local"));
                u.setLlamadaInter(rs.getInt("llamada_inter"));
                u.setAgua(rs.getInt("agua"));
                u.setLuz(rs.getInt("luz"));
                System.out.println("Se encontro usuario");
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        return u;
    }
        
       
    
    public Usuario dameUuu(String user){
        Usuario u=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE Usuario=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            rs=pr.executeQuery();
            System.out.println(pr);
            while(rs.next()){
                u=new Usuario(); 
                u.setUsuario_user(rs.getString("Usuario"));
                u.setUsuario_email(rs.getString("Email"));
                u.setUsuario_pass(rs.getString("Contra"));
                u.setUsuario_card(rs.getString("Num_tar"));
                u.setUsuario_cvv(rs.getInt("CVV"));
                u.setUsuario_aidi(rs.getInt("Id_usu"));
                u.setUsuario_temporal(rs.getString("temp_us"));
                System.out.println("Se encontro temporal" + u.getUsuario_temporal());
                
                break;
                
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
            System.out.println("No Se conecto");
        }
        finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        return u;
    }
        
	/** Metodos GET de la clase usuario
     * @return  */
        public int llamadas_local(){
            return this.llama_loc;
        }
        public String getUsuario_user(){
		 return this.Usuario;
	}
        public String getUsuario_idi(){
		 return this.idi;
	}
	public String getUsuario_email(){
		 return this.Email;
	}
	public String getUsuario_pass(){
		 return this.Contra;
	}
	public String getUsuario_card(){
		 return this.Num_tar;
	}
        public int getUsuario_cvv(){
		 return this.CVV;
	}
        public int getUsuario_aidi(){
		 return this.Id_usu;
	}
        public int getLlamadaLocal(){
		 return this.llama_loc;
	}
        public int getLlamadaInter(){
		 return this.llama_int;
	}
        public int getAgua(){
		 return this.ajua;
	}
        public int getLuz(){
		 return this.luza;
	}
        public int getUsuario_fondos(){
            return this.fondo;
        }
        public String getUsuario_temporal(){
            return this.temporal;
        }
        public String getUsuario_pago(){
            return this.Pago;
        }
        public int getUsuario_cargo(){
            return this.cargo;
        }
        public String getUsuario_fecha(){
            return this.Fecha;
        }
	/** Metodos SET de la clase usuario
        * @param tempo */
        
    /**
     * Metodos SET de la clase usuario
     * @param fondo
     */
        public void setUsuario_fecha(String date){
            this.Fecha = date;
        }
        public void setUsuario_cargo(int charge){
            this.cargo = charge;
        }
        public void setUsuario_pago(String tipo){
            this.Pago = tipo;
        }
        public void setUsuario_fondos(int fondo){
            this.fondo = fondo;
        }
        public void setUsuario_idi(String aidi){
            this.idi = aidi;
        }
        public void setLlamadaLocal(int ll_local){
		 this.llama_loc=ll_local;
	}
        public void setLlamadaInter(int ll_inter){
		 this.llama_int=ll_inter;
	}
        public void setAgua(int ahua){
		 this.ajua=ahua;
	}
        public void setLuz(int luzi){
		 this.luza=luzi;
	}
        public void setUsuario_user(String usuario_User){
		 this.Usuario=usuario_User;
	}

	public void setUsuario_email(String usuario_Email){
		 this.Email=usuario_Email;
	}
	public void setUsuario_pass(String usuario_Pass){
		 this.Contra=usuario_Pass;
	}
        public void setUsuario_card(String usuario_Card){
		 this.Num_tar=usuario_Card;
	}
	
	public void setUsuario_cvv(int usuario_CVV){
		 this.CVV=usuario_CVV;
	}
	public void setUsuario_aidi(int usuario_Aidi){
		 this.Id_usu=usuario_Aidi;
	}
        public void setUsuario_temporal(String tempo){
            this.temporal = tempo;
        }
}
