/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.Usuario;
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
 * @author antonio
 */
public class recuperar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String mail = (String)request.getParameter("email");
        Usuario u=new Usuario();
        u=u.lost(mail);
        if(u!=null){
            InetAddress address = InetAddress.getLocalHost();
                byte[] bIPAddress = address.getAddress();
                 String sIPAddress = "";

                for (int x=0; x<bIPAddress.length; x++) {
                  if (x > 0) {
                    sIPAddress += ".";
                  }
                  sIPAddress += bIPAddress[x] & 255;	   
                }
                String servidorSMTP = "smtp.gmail.com";
                String puerto = "587";
                String userio = "makiki789@gmail.com";
                String password = "Elpayasoeso12345";

                String destino = mail;
                String asunto = "Restablezca la contraseña perro c:!";
                String url = sIPAddress+":8080/Trinity/lost.jsp?token="+u.getUsuario_idi();
                String mensaje = "Reestablesca su contraseña aqui \n" + url;

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
                response.sendRedirect("recuperar.jsp?status=1");
        }
        else{
            response.sendRedirect("recuperar.jsp?status=2");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
