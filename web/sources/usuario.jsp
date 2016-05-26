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
if (sesionOk.getAttribute("usuario") == null) {
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
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
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
      <script type="text/javascript">
           
      var saldo=6000.00;    
      function convertidor()
      {
          
      }
              
      
   
      </script>
    </head>
    <body>
        <nav>
          <div class="nav-wrapper">
            <a href="index.html" class="brand-logo" id="logomoto"> <b>Auto</b>Bank</a>
            <ul class="right hide-on-med-and-down">
              <li><a href="contacto.html" id="tamano-font">Modificacion de datos</a></li>
             <!-- <li><a href="pago.html" id="tamano-font">Pago de Servicios</a></li>-->
              <li><a href="index.html" id="tamano-font">Acerca de Banco de México</a></li>
              <li><a href="index.html" id="tamano-font">Contacto</a></li>
            </ul>
          </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
 		<div class="Contenido_total">
 			<header>
 				<h2><center>Bienvenido a AutoBank</center></h2>
                              
 			</header>
                    
          <div align="right" >
            <a class="waves-effect waves-light btn-large" href="pago.html"><i class="material-icons right">payment</i>Pago De Servicios</a>
          </div>
      
                                
                   <div class="row">
        <div align="center" class="col s12 m7">
          <div  align="center" class="card medium">
            <div  align="center" class="card-image">
              <img src="plan.jpg">
              <span class="card-title">Convertidor</span>
            </div>
            <div   align="center" class="card-content">
                <select>
                    <option value="Pesos Mexicanos">Pesos Mexicanos</option>
                    <option value="Dolar">Dolar</option>
                    <option value="Euro">Euro</option>
                </select>
            </div>
            <div class="card-action">
              <a href="https://www.bmv.com.mx/">Bolsa Mexicana De Valores</a>
            </div>
          </div>
        </div>
      </div>
                    
                   
 		</div>
        
            
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
