

import servlets.Usuario;
import java.io.*;
import java.net.InetAddress;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Properties;
import java.util.UUID;



import java.util.Date;
import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 

/**
 *
 * @author Lopsan
 */
public class lost extends HttpServlet {

    private Connection con;                    //
    private Statement set;
    private ResultSet rs;
    public void init(ServletConfig cfg) throws ServletException {
        String URL = "jdbc:mysql:3306//localhost/banco_mexico";  //se traza la ruta de conexion
        String userName = "root";                               //se determina el usuario de conecion de mysql
        String password = "n0m3l0";                           //el password si es que cuenta con uno
        try {
        Class.forName("com.mysql.jdbc.Driver");                 
        URL = "jdbc:mysql://localhost/banco_mexico";
        
        con = DriverManager.getConnection(URL,userName,password);
        set = con.createStatement();

        System.out.println("Se ha conectado");
        } catch (Exception e) {
        System.out.println("No se ha conectado");
        }
    }
    
    
     
       
        
  /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
            String contra = (String)req.getParameter("email");
            String id = (String)req.getParameter("idi");
            String new_id = UUID.randomUUID().toString().replaceAll("-", "");
           try {
        
            String sql_inserta = "UPDATE registro SET Contra = '"+contra +"', id_lost= '"+ new_id +"' where id_lost = '"+id +"'";
            System.out.println("La sentencia sql es: " +sql_inserta);
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.executeUpdate();
            statement.close();
            } 
            catch (Exception e) {
                System.out.println("NO SE ACTUALIZO LA CONTRASEÑA" + e);
                
            }
            Usuario u = null;
            u = new Usuario();
            u = u.dameId(id);
            System.out.println("la wea del usuario "+ u);
            if(u!=null){
                res.sendRedirect("hecho.jsp?status=1");
            }
            else{
                res.sendRedirect("hecho.jsp?status=2");
            }
            
    }
}