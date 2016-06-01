/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author antonio
 */
public class pagar extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String user=request.getParameter("name");
        int can =Integer.parseInt(request.getParameter("valor"));
        System.out.println("DINEROOOOO "+can);
        System.out.println("la wea" + can);
        System.out.println("EL USUARIU es: " + user);
        String doit = (String)request.getParameter("tipo");
        String emi = (String)request.getParameter("correo");
        System.out.println("EL CORREO DEBERIA SER " + emi);
        System.out.println("la dosssssssssss " + doit);
        int ho = 0;
        Usuario u=new Usuario();
        u=u.pagar(user);
        String has;
            has = "telefono";
        
        int fondo = u.getUsuario_fondos();
        String tarjeta = u.getUsuario_card();
        String correo = u.getUsuario_email();
        System.out.println("El fondo es " +fondo);
        int total = fondo - can;
        
        if(total > 0){
            try {
        
            String sql_inserta = "UPDATE tarjeta SET fondos = "+total +" where Usuario = '"+user +"'";
            System.out.println("La sentencia sql es: " +sql_inserta);
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.executeUpdate();
            statement.close();
            } 
            catch (Exception e) {
                System.out.println("NO SE INSERTO NADA EN LA TABLA DE tarjeta" + e);
            }
            if(doit.equals("telefono")){
                 try {
        
            String sql_inserta = "UPDATE pagos SET llamada_local = 0, llamada_inter = 0 where Usuario = '"+user +"'" ;
            System.out.println("La sentencia sql es: " +sql_inserta);
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.executeUpdate();
            statement.close();
            response.sendRedirect("logout.jsp");
            } 
            catch (Exception e) {
                System.out.println("NO SE INERTO NADA AEN LA TABLA DE PAGOS" + e);
                response.sendRedirect("usuarios.jsp?status=2");
            }
            String tele = "telefono";
            if(can==0){
                     System.out.println("LA WEA NO SE PAGOOOOOOOOOOOOOOOOOOO");
                }
                else{
                    try {
        
            String sql_inserta = "insert into historial (Usuario, Email, Tarjeta, Pago, Cargo) VALUES(?, ?, ?, ?, ?)" ;
            
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.setString(1,user);
            statement.setString(2,correo);
            statement.setString(3,tarjeta);
            statement.setString(4,tele);
            statement.setInt(5,can);
            System.out.println("La sentencia sql es: " +statement);
            statement.executeUpdate();
            statement.close();
            } 
            catch (Exception e) {
                System.out.println("NO SE INERTO NADA AEN LA TABLA DE HISTORIAL" + e);
                response.sendRedirect("usuarios.jsp?status=2");
            }
                }
                 
                 
             }
            else{
                try {
        
            String sql_inserta = "UPDATE pagos SET "+ doit +" = 0 where Usuario = '"+user +"'" ;
            System.out.println(sql_inserta);
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.executeUpdate();
            statement.close();
            response.sendRedirect("logout.jsp");
            } 
            catch (Exception e) {
                System.out.println("NO SE INSERTO NADA EN LA TABLA DE PAGOS DE " + doit + "" + e);
                response.sendRedirect("usuarios.jsp?status=2");
            }
                if(can==0){
                     System.out.println("LA WEA NO SE PAGOOOOOOOOOOOOOOOOOOO");
                }
                else{
                    try {
        
            String sql_inserta = "insert into historial (Usuario, Email, Tarjeta, Pago, Cargo) VALUES(?, ?, ?, ?, ?)" ;
            
            PreparedStatement statement = con.prepareStatement(sql_inserta);
            statement.setString(1,user);
            statement.setString(2,correo);
            statement.setString(3,tarjeta);
            statement.setString(4,doit);
            statement.setInt(5,can);
            System.out.println("La sentencia sql es: " +statement);
            statement.executeUpdate();
            statement.close();
            } 
            catch (Exception e) {
                System.out.println("NO SE INERTO NADA AEN LA TABLA DE HISTORIAL" + e);
                response.sendRedirect("usuarios.jsp?status=2");
            }
                }
                
                
            }
             
        }
        else if(total <= 0){
            response.sendRedirect("usuarios.jsp?error_pago=1");
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
