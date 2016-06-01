
package servlets;

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
public class down extends HttpServlet {

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

        System.out.println("Se ha conectado a la base de datos del servlet down");
        } catch (Exception e) {
        System.out.println("No se ha conectado a la base de datos del servlet down");
        }
    }
    
    
     
       
        
  /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
            String usuario = (String) req.getParameter("user");
            String id = (String) req.getParameter("aidi");
            String email = (String) req.getParameter("email");
            String temporal = (String) req.getParameter("temporal");
            int action = Integer.parseInt(req.getParameter("action"));
            
            if(action == 1){
                
            
                InetAddress address = InetAddress.getLocalHost();
                String sHostName;
                sHostName = address.getHostName();
                            byte[] bIPAddress = address.getAddress();

                // IP en formato String
                String sIPAddress = "";

                for (int x=0; x<bIPAddress.length; x++) {
                  if (x > 0) {
                    // A todos los numeros les anteponemos
                    // un punto menos al primero    
                    sIPAddress += ".";
                  }
                  // Jugamos con los bytes y cambiamos el bit del signo
                  sIPAddress += bIPAddress[x] & 255;	   
                }
                System.out.println("ASDSADSADS: "+sHostName + "y " + sIPAddress);

                 // Cogemos la IP 


                 String servidorSMTP = "smtp.gmail.com";
                String puerto = "587";
                String userio = "makiki789@gmail.com";
                String password = "Elpayasoeso12345";

                String destino = email;
                String asunto = "Registro!";
                String url = sIPAddress+":8080/Trinity/login.jsp";
                String mensaje = "Hola! " + temporal + "\n Tu solicitud de baja del sistema ah sido aceptada, lamentamos tu partida :c";

                Properties props = new Properties();

                props.put("mail.debug", "true");
                props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
                props.put("mail.smtp.host", servidorSMTP);
                props.put("mail.smtp.port", puerto);

                Session session = Session.getInstance(props, null);

                try {
                 MimeMessage message = new MimeMessage(session);
                 message.addRecipient(Message.RecipientType.TO, new InternetAddress(
                   destino));
                 message.setSubject(asunto);
                 message.setSentDate(new Date());
                 message.setText(mensaje);

                 Transport tr = session.getTransport("smtp");
                 tr.connect(servidorSMTP, userio, password);
                 message.saveChanges();   
                 tr.sendMessage(message, message.getAllRecipients());
                 tr.close();

                } catch (MessagingException e) {
                 e.printStackTrace();
                 }

                try {

                String sql_inserta = "update registro set Contra='cuenta_desactivada' where Usuario='"+usuario+"'";

                PreparedStatement statement = con.prepareStatement(sql_inserta);
                statement.executeUpdate();
                statement.close();
                } 
                catch (Exception e) {
                    System.out.println("NO SE INSERTO EN LA TABLA DE registro, EN EL SERVLET DE down" + e);
                }
                try {

                String sql_inserta = "delete from Servicio_baja where id_baja='"+id+"'";

                PreparedStatement statement = con.prepareStatement(sql_inserta);
                statement.executeUpdate();
                statement.close();
                } 
                catch (Exception e) {
                    System.out.println("NO SE INSERTO EN LA TABLA DE Servicio_baja, EN EL SERVLET DE down" + e);
                }
                if(1>0){
                    res.sendRedirect("index_admin.jsp");
                } 
            }
            else if(action == 2){
                InetAddress address = InetAddress.getLocalHost();
                String sHostName;
                sHostName = address.getHostName();
                            byte[] bIPAddress = address.getAddress();

                // IP en formato String
                String sIPAddress = "";

                for (int x=0; x<bIPAddress.length; x++) {
                  if (x > 0) {
                    // A todos los numeros les anteponemos
                    // un punto menos al primero    
                    sIPAddress += ".";
                  }
                  // Jugamos con los bytes y cambiamos el bit del signo
                  sIPAddress += bIPAddress[x] & 255;	   
                }
                System.out.println("ASDSADSADS: "+sHostName + "y " + sIPAddress);

                 // Cogemos la IP 


                 String servidorSMTP = "smtp.gmail.com";
                String puerto = "587";
                String userio = "makiki789@gmail.com";
                String password = "Elpayasoeso12345";

                String destino = email;
                String asunto = "Registro!";
                String url = sIPAddress+":8080/Trinity/login.jsp";
                String mensaje = "Hola! " + temporal + "\n Tu solicitud de baja del sistema ah sido rechazada";

                Properties props = new Properties();

                props.put("mail.debug", "true");
                props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
                props.put("mail.smtp.host", servidorSMTP);
                props.put("mail.smtp.port", puerto);

                Session session = Session.getInstance(props, null);

                try {
                 MimeMessage message = new MimeMessage(session);
                 message.addRecipient(Message.RecipientType.TO, new InternetAddress(
                   destino));
                 message.setSubject(asunto);
                 message.setSentDate(new Date());
                 message.setText(mensaje);

                 Transport tr = session.getTransport("smtp");
                 tr.connect(servidorSMTP, userio, password);
                 message.saveChanges();   
                 tr.sendMessage(message, message.getAllRecipients());
                 tr.close();

                } catch (MessagingException e) {
                 e.printStackTrace();
                 }
                try {

                String sql_inserta = "delete from Servicio_baja where id_baja='"+id+"'";
                System.out.println(sql_inserta);
                PreparedStatement statement = con.prepareStatement(sql_inserta);
                statement.executeUpdate();
                statement.close();
                } 
                catch (Exception e) {
                    System.out.println("NO SE INSERTO EN LA TABLA DE Servicio_baja, EN EL SERVLET DE down cuando es la opcion 2" + e);
                }
                if(1>0){
                    res.sendRedirect("index_admin.jsp");
                } 
            }
            
            
            
            
    }
}