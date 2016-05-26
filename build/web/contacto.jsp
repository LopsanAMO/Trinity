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
String error = "";
String email = "";
error = request.getParameter("error_pago");

String contra  ="";



if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>
</jsp:forward>
<%
} else {
usuario = (String)sesionOk.getAttribute("usuario");
LinkedList<Usuario> lista = busca.getconsulta3(usuario);
         
            email = lista.get(0).getUsuario_email();
        
        contra=  lista.get(0).getUsuario_pass();
                       

}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de Usuarios</title>
        
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
          height: 50%;
          width: 50%;
          color:white;
         
      }

      </style>
      <script type="text/javascript">
           
      var saldo=6000.00;    
      function convertidor()
      {
         valor = document.getElementById('canti');
         valor2 = document.getElementById('divisa');
         valor3 = valor.value * valor2.value;
         document.getElementById('num').innerHTML = "$"+valor3.toFixed(4);
      }
           function peso()
      {
         valore = document.getElementById('peso');
         valore2 = document.getElementById('divis');
         valore3 = valore.value / valore2.value;
         document.getElementById('new').innerHTML = "$"+valore3.toFixed(4);
      }   
      
   
      </script>
    </head>
    <body>
        <nav>
          <div class="nav-wrapper">
            <a href="usuarios.jsp" class="brand-logo" id="logomoto"> <b>Auto</b>Bank</a>
            <ul class="right hide-on-med-and-down">
              <li><a href="contacto.jsp" id="tamano-font">Modificacion de datos</a></li>
             <!-- <li><a href="pago.html" id="tamano-font">Pago de Servicios</a></li>-->
              <li><a href="index.html" id="tamano-font">Acerca de Banco de México</a></li>
              <li><a href="index.html" id="tamano-font">Contacto</a></li>
              <li><a href="javascript:enviar(ip);" id="tamano-font">Logout</a></li>
            </ul>
          </div>
        </nav>
        <br>
        <br>
    <center>
        
      <table  class="highlight hola">
       
        <tbody>
          <tr>
              <td><a><%=email%></a></td>
            <td>
          <input placeholder="Cambiar Email" id="first_name" type="text" class="validate">
        </td>
            <td><button class="btn waves-effect waves-light col 6" id="fantasma" onclick="peso()">Cambiar
                     </button></td>
          </tr>
        <thead></thead>
          <tr>
            <td><a><%=contra%></a></td>
            <td> <input placeholder="Cambiar Contraseña" id="nose" type="password" class="validate"></td>
            <td><button class="btn waves-effect waves-light col 6" id="dale" onclick="peso()">Cambiar
                     </button></td>
          </tr>
          
        </tbody>
      </table>
            
    </center>
      
        <script>
            $(document).ready(function() {
                $('select').material_select();
              });
        </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
