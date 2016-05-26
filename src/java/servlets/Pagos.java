/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.*;

/**
 *
 * @author antonio
 */
public class Pagos{
        private String Email;
	private String Usuario;
	private String Contra;
	private int Num_tar;
        private int CVV;
        private int Id_usu;

	/** Crea un nueva instancia de la clase usuario con magia de sirenas*/
	public Pagos(){

	}

     /**
     * Metodo usado para verificar si un usuario esta registrado en la Base de Datos
     * con su User y Clave de forma correcta
     * @param user Que viene a ser el user del Usuario
     * @param clave Que viene a ser la clave del Usuario
     */
    public Usuario verificarUsuario(String user, String clave){
        Usuario u=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM registro WHERE Usuario=?";
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            pr.setString(2, clave);
            rs=pr.executeQuery();
            while(rs.next()){
                u=new Usuario(); 
                u.setUsuario_user(rs.getString("Usuario"));
                u.setUsuario_email(rs.getString("Email"));
                u.setUsuario_pass(rs.getString("Contra"));
                u.setUsuario_card(rs.getString("Num_tar"));
                u.setUsuario_cvv(rs.getInt("CVV"));
                u.setUsuario_aidi(rs.getInt("Id_usu"));
                System.out.println("Se encontro usuario");
                
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
        }finally{
            try{
                rs.close();
                pr.close();
                rs.close();
            }catch(SQLException ex){

            }
        }
        return u;
    }

}
