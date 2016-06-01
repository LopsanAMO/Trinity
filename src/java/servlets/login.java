/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

//import static com.sun.xml.internal.ws.api.message.Packet.State.ClientResponse;
//import static com.sun.xml.ws.api.message.Packet.State.ClientResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 

import java.io.File;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
*/
/**
 *
 * @author antonio
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @return 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*private ClientResponse sendSimpleMessage() {
    Client client = Client.create();
    client.addFilter(new HTTPBasicAuthFilter("api",  "key-d3fa838de4d818a92b36c0892519c221"));
    WebResource webResource = client.resource("https://api.mailgun.net/v3/sandboxe78e29f07c1548ffaad639dbb1f19c45.mailgun.org/messages");
    MultivaluedMapImpl formData = new MultivaluedMapImpl();
     formData.add("from", "tu pinshi dios <mailgun@lopsan.com>");
    formData.add("to", "moshi moshi omar desu <salazarpazomar@gmail.com>");
    formData.add("subject", "eres una perra");
    formData.add("text", "Congratulations moshi moshi, eres una perra.");
     return webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class, formData);
  }
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String user=request.getParameter("name");
        String clave=request.getParameter("pass");
        int hacer = 1;
        try{
            hacer = Integer.parseInt(request.getParameter("DIY"));
        }
        catch(NumberFormatException e){
            
        }
        System.out.println("El numeor que deberia de ser es: " + hacer);
        Usuario u=new Usuario();
        u=u.verificarUsuario(user, clave);
        Usuario w = new Usuario();
        w = w.verificarUsuario2(user, clave);
        
        
        if(u!=null && w!=null){
            //El usuario existe en la base de datos y clave correcta
            //Creamos la sesion
            String llo = String.valueOf(u.getLlamadaLocal());
            String lin = String.valueOf(u.getLlamadaInter());
            String water = String.valueOf(u.getAgua());
            String light = String.valueOf(u.getLuz());
            String tem = String.valueOf(w.getUsuario_temporal());
            String correo = u.getUsuario_email();
            HttpSession sesion=request.getSession(true);
            sesion.setAttribute("usuario", u);
            System.out.println("LA WEAAAAAAA" + (String)(w.getUsuario_temporal()));
            HttpSession sesionOk = request.getSession();
            sesionOk.setAttribute("usuario",user);
            sesionOk.setAttribute("contra", clave);
            sesionOk.setAttribute("llamada_local",llo);
            sesionOk.setAttribute("llamada_inter",lin);
            sesionOk.setAttribute("agua",water);
            sesionOk.setAttribute("luz",light);
            sesionOk.setAttribute("temporal",tem);
            sesionOk.setAttribute("corre",correo);
            if(hacer == 1){
                response.sendRedirect("usuarios.jsp");
            }
            else if(hacer == 2){
                response.sendRedirect("usuarios.jsp?status=1");
            }
            
            System.out.println("TODO OK CO EL INICIO DE SESIONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE" );
        }else{
            //El usuario no existe o clave incorrecta
            response.sendRedirect("login.jsp?error=1");
            
            
        }
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
        response.sendRedirect("usuarios.jsp?status=1");
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
