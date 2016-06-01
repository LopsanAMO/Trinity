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
public class login_admin extends HttpServlet {

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
            String user=request.getParameter("name");
        String clave=request.getParameter("pass");
        Usuario u=new Usuario();
        u=u.verificaAdmin(user, clave);

        
        if(u!=null){
            //El usuario existe en la base de datos y clave correcta
            //Creamos la sesion
            String privilegio = (String)u.getAdmin_pri();
            HttpSession sesion=request.getSession(true);
            sesion.setAttribute("usuario", u);
            HttpSession sesionOk = request.getSession();
            sesionOk.setAttribute("usuario",user);
            sesionOk.setAttribute("contra", clave);
            sesionOk.setAttribute("privilegio",privilegio);
            if(1 == 1){
                response.sendRedirect("index_admin.jsp");
            }     
            System.out.println("TODO OK CO EL INICIO DE SESIONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE con el administrador" );
        }else{
            //El usuario no existe o clave incorrecta
            response.sendRedirect("error.jsp");
            
            
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
