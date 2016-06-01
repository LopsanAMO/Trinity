<%-- 
    Document   : casa
    Created on : 28/04/2014, 03:41:56 AM
    Author     : Lopsan
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="servlets.*" %>

<%@ page session="true" %>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
Usuario u = new Usuario();
usuario = (String)sesionOk.getAttribute("usuario");
u = u.verificaAdmin2(usuario);
if (u == null) {
%>
<jsp:forward page="login.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>
</jsp:forward>
<%
} else {
usuario = (String)sesionOk.getAttribute("usuario");

}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de Usuarios</title>
         <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32">
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png">
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4">
  <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
  <link href="sources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="sources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->    
    <link href="sources/css/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <!-- CSS style Horizontal Nav (Layout 03)-->    
    <link href="sources/css/style-horizontal.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="../../../../cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  


  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="sources/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="sources/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="sources/js/plugins/data-tables/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="sources/js/plugins/chartist-js/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
      <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script>
          function enviar(form){
            form.submit();
          }
      </script>
      <script>
          $(document).ready(function(){
              if($("#hola").val()==1){
                   Materialize.toast('El pago con la tarjeta fue rechazado, checa tu metodo de pago, o cambialo', 4000)
              }
             
          });
      </script>
      <style>
        #logomoto{
            font-size: 42px;
            padding-left: 5.40%;
            color: #2E3337;
        }
        #tamano-font{
          font-size: 20px; 
          color: #2E3337;
        }

body {
  /*background: url(imges/jister.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;*/
  background-color: #2E3337;
  }
  .Contenido_total{

  	padding-top: 1%;
    padding-bottom: 5%;
  	width: 70%;
    height: 100%;
	margin: 0 auto;
  }
.hola{
          color:white;
         
      }
      html,body{
         color: rgba(0, 0, 0, 0.87);

      }

      </style>
      
    </head>
    <body>
         <nav>
          <div class="nav-wrapper">
            <a href="#" class="brand-logo" id="logomoto"> <b>Auto</b>Bank</a>
            <ul class="right hide-on-med-and-down">
              <li><a href="index_admin.jsp" id="tamano-font">Home</a></li>
              <li><a href="javascript:enviar(ip);" id="tamano-font">Logout</a></li>
            </ul>
          </div>
        </nav
        <br>
        <br>
        <br>
         <form method="post" name="ip" action="Logout">
            <input type="hidden"  value="elipdelUser">
        </form>
        <div class="col s12 m8 l9 " ><center>
   <table id="data-table-simple" class="responsive-table display hola highlight" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Correo</th>
                            <th>Razon</th>
                            <th>Baja</th>
                            <th>No baja</th>
                            <th>historial</th>
                        </tr>
                    </thead>
                    <tbody>
                       <% 
LinkedList<Usuario> lista = busca.getconsulta5();
for (int i=0;i<lista.size();i++)
{
   
                                
                       out.println("<tr>");
                         out.println("<td>"+"<a>"+lista.get(i).getUsuario_temporal()+"</a>"+"</td>");
                         out.println("<td>"+"<a>"+lista.get(i).getUsuario_email()+"</a>"+"</td>");
                         out.println("<td>"+"<a>"+lista.get(i).getBaja_razon()+"</a>"+"</td>");
                         out.println("<td>"+"<form method='post' action='down'>");
                       %>
                    <input type="hidden" name="aidi" value="<%=lista.get(i).getBaja_id()%>">
                    <input type="hidden" name="email" value="<%=lista.get(i).getUsuario_email()%>">
                   <input type="hidden" name="temporal" value="<%=lista.get(i).getUsuario_temporal()%>">
                    <input type="hidden" name="user" value="<%=lista.get(i).getUsuario_user()%>">
                    <input type="hidden" name="action" value="1">
                         <button class="btn waves-effect waves-light col 6" id="dale">Dar de Baja
                     </button>
                         <%
                         out.println("</form>"+"</td>");
                         out.println("<td>"+"<form method='post' action='down'>");
                       %>
                     <input type="hidden" name="aidi" value="<%=lista.get(i).getBaja_id()%>">
                     <input type="hidden" name="user" value="<%=lista.get(i).getUsuario_user()%>">
                     <input type="hidden" name="email" value="<%=lista.get(i).getUsuario_email()%>">
                     <input type="hidden" name="temporal" value="<%=lista.get(i).getUsuario_temporal()%>">
                       <input type="hidden" name="action" value="2">
                         <button class="btn waves-effect waves-light col 6" id="dale">No dar de baja
                     </button>
                        <%
                         out.println("</form>"+"</td>");
                         out.println("<td>"+"<form method='post' action='baja_historial'>");
                       %>
                       <input type="hidden" name="user" value="<%=lista.get(i).getUsuario_user()%>">
                    <input type="hidden" name="action" value="1">
                         <button class="btn waves-effect waves-light col 6" id="dale">Historial
                     </button>
                       <%
                         out.println("</form>"+"</td>");
                         out.println("</tr>");
                       
                        }
%>
                    
                    </tbody>
                  </table>
            </center>
                </div>
      
        <script>
            $(document).ready(function() {
                $('select').material_select();
              });
        </script>
        <!-- jQuery Library -->
    <script type="text/javascript" src="sources/js/jquery-1.11.2.min.js"></script>    
    <!--materialize js-->
    <script type="text/javascript" src="sources/js/materialize.js"></script>
    <!--prism-->
    <script type="text/javascript" src="sources/js/prism.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="sources/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <!-- data-tables -->
    <script type="text/javascript" src="sources/js/plugins/data-tables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="sources/js/plugins/data-tables/data-tables-script.js"></script>
    <!-- chartist -->
    <script type="text/javascript" src="sources/js/plugins/chartist-js/chartist.min.js"></script>   
    
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="sources/js/plugins.js"></script>   
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
