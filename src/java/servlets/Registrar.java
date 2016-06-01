
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
public class Registrar extends HttpServlet {

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
        System.out.println("SE PUDO CONECTAR A LA BASE DE DATOS DESDE EL SERVLET DE REGISTRAR");
        } catch (Exception e) {
        System.out.println("SE PUDO CONECTAR A LA BASE DE DATOS DESDE EL SERVLET DE REGISTRAR");
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
            String usuario = UUID.randomUUID().toString().replaceAll("-", "");
            String contra = UUID.randomUUID().toString();
            String email = (String) req.getParameter("email");
            int anio = Integer.parseInt((String)req.getParameter("ano"));
            int mes = Integer.parseInt((String)req.getParameter("mes"));
            String tarjeta = ((String)req.getParameter("card"));
            int cvv = Integer.parseInt( (String) req.getParameter("cvv"));
            int lla_loca = (int)(Math.random() * 1010);
            int lla_inter = (int)(Math.random() * 1010);
            int agu = (int)(Math.random() * 1010);
            int luzz = (int)(Math.random() * 1010);
            int fondo = (int)(Math.random() * 3000);
            String tempo = email.replaceAll("@gmail.com","").replaceAll("@hotmail.com","");
            String idi =  UUID.randomUUID().toString().replaceAll("-", "");
            Usuario u = new Usuario();
            u = u.lost(email);
            if(u==null){
                System.out.println("El pinche numero es" + tarjeta);
                InetAddress address = InetAddress.getLocalHost();
                String sHostName;
                sHostName = address.getHostName();
                byte[] bIPAddress = address.getAddress();
                String sIPAddress = "";
                for (int x=0; x<bIPAddress.length; x++) {
                  if (x > 0) {
                    sIPAddress += ".";
                  }
                  sIPAddress += bIPAddress[x] & 255;	   
                }
                System.out.println("ASDSADSADS: "+sHostName + "y " + sIPAddress);

                String servidorSMTP = "smtp.gmail.com";
                String puerto = "587";
                String userio = "makiki789@gmail.com";
                String password = "Elpayasoeso12345";
                String destino = email;
                String asunto = "Registro!";
                String url = sIPAddress+":8080/Trinity/login.jsp";
                String mensaje = "tu usuario es: " + usuario + ", y tu contraseña es: "+ contra + "\n Empieza a disfrutar de tu cuenta y entra a " + url;

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

                } 
                catch (MessagingException e) {
                    e.printStackTrace();
                }

                try {
                    String sql_inserta = "insert into registro ( Usuario, Contra, Email, Num_tar, CVV, id_lost,temp_us) VALUES(?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = con.prepareStatement(sql_inserta);
                    statement.setString(1,usuario);
                    statement.setString(2,contra);
                    statement.setString(3,email);
                    statement.setString(4,tarjeta);
                    statement.setInt(5,cvv);
                    statement.setString(6,idi);
                    statement.setString(7,tempo);
                    statement.executeUpdate();
                    statement.close();
                    System.out.println("SE INSERTO EN LA TABLA DE REGISTRO, EN EL SERVLET DE REGISTRO" );
                } 
                catch (Exception e) {
                    System.out.println("NO SE INSERTO EN LA TABLA DE REGISTRO, EN EL SERVLET DE REGISTRO" + e);
                }

                try{
                    String sql = "insert into pagos(Usuario, llamada_local, llamada_inter, agua,luz) VALUES(?, ?, ?, ?, ?)";
                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(1,usuario);
                    statement.setInt(2,lla_loca);
                    statement.setInt(3,lla_inter);
                    statement.setInt(4,agu);
                    statement.setInt(5,luzz);
                    statement.executeUpdate();
                    statement.close();
                    System.out.println("SE INSERTO EN LA TABLA DE PAGOS, EN EL SERVLET DE REGISTRO");
                }
                catch(Exception e){
                    System.out.println("NO SE INSERTO EN LA TABLA DE PAGOS, EN EL SERVLET DE REGISTRO" + e);
                }

                try{
                    String no = "insert into tarjeta(Usuario, card, cvv, m_vencimiento,a_vencimiento, fondos) VALUES(?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = con.prepareStatement(no);
                    statement.setString(1,usuario);
                    statement.setString(2,tarjeta);
                    statement.setInt(3,cvv);
                    statement.setInt(4,mes);
                    statement.setInt(5,anio);
                    statement.setInt(6,fondo);
                    statement.executeUpdate();
                    statement.close();
                    System.out.println("SE INSERTO EN LA TABLA DE TARJETA, EN EL SERVLET DE REGISTRO");
                }
                catch(Exception e){
                    System.out.println("NO SE INSERTO EN LA TABLA DE TARJETA, EN EL SERVLET DE REGISTRO" + e);
                }
                if(1>0){
                    res.sendRedirect("login.jsp?error=2");
                   } 
            }
            else{
                res.sendRedirect("registro.jsp?error=1");
            }        
    }
}