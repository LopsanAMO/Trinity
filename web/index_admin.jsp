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


}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de Usuarios</title>
        
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
      <script src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
     
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
        
        <form method="post" name="ip" action="Logout">
            <input type="hidden"  value="elipdelUser">
        </form>

        <br>
 		<div class="Contenido_total">
 			<header>
                            <h2><center><font color="white">Bienvenido a AutoBank</font></center></h2>
                              
 			</header>
                    
          </div>
    <div class="card-action center-align">
              <input type="button" class="btn waves-effect waves-light col 6" id="fantasma" onclick="location.href='/Trinity/ah'" value="Ver historial">
                    
              <input type="button" class="btn waves-effect waves-light col 6" id="fantasma" onclick="location.href='/Trinity/baja.jsp'" value="Bajas del Sistema">
            </div>

                   
               
 	
      

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    </body>
</html>
