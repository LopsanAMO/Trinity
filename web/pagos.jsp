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
String llama_lo = "";
String llama_int = "";
String agua = "";
String luz = "";
String correo = "";
int total = 0;
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
llama_lo = (String)sesionOk.getAttribute("llamada_local");
llama_int = (String)sesionOk.getAttribute("llamada_inter");
total = Integer.parseInt(llama_lo) + Integer.parseInt(llama_int);
agua = (String)sesionOk.getAttribute("agua");
luz = (String)sesionOk.getAttribute("luz");
correo = (String)sesionOk.getAttribute("corre");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>Pago De Servicios</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="sources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="sources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <script  type="text/javascript" src="compar.js"></script>
  <script>
      $(document).ready(function(){
         var n1=document.getElementById("can1").innerHTML;
          var n2=document.getElementById("can2").innerHTML;
          var totalo1=(n1*1)+(n2*1);
          var tot=document.getElementById("total1");
          tot.value=totalo1;
        //alert(saldo.usuario);
         //Pago de Agua
         var n3=document.getElementById("can3").innerHTML;
         var n4=document.getElementById("can4").innerHTML;
         var totalo2=(n3*1);
         var tot1=document.getElementById("total2");
         tot1.value=totalo2;
         //Pago Luz
         var n5=document.getElementById("can5").innerHTML;
         var n6=document.getElementById("can6").innerHTML;
         var totalo3=(n5*1);
         var tot2=document.getElementById("total3");
         tot2.value=totalo3; 
      });
 
 </script>
</head>
<body>
  <nav class="white" role="navigation">
    <div class="nav-wrapper container">
        
        <a id="logo-container" class="brand-logo"><img src="sources/img/trinity.jpg" alt="logo" height="62" width="72"></a>
      <ul class="right hide-on-med-and-down">
          <li><a id="logo-container" class="brand-logo" href="usuarios.jsp"><img src="sources/img/bm.jpg" alt="logo" height="62" width="92"> </a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a href="#">Navbar Link</a></li>
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
  </nav>

  <div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
      <div class="container">
        <br><br>
        <h1 class="header center white-text text-lighten-2">Banco Mexico</h1>
        <div class="row center">
          <h5 class="header col s12 light">Pago de Telefono, Agua y Luz. Facil Y Rapido</h5>
          <h5 class="header col s12 ligh">Bienvenido <%=usuario%></h5>
        </div>
        <div class="row center">
            
        </div>
        <br><br>

      </div>
    </div>
        
    <div class="parallax"><img src="sources/img/03d.jpg" alt="Unsplashed background img 1"></div>
  </div>


  <div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <!--<div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">monetization_on</i></h2>
            <h5 class="center">Consulta de Saldo</h5>

            <p class="light">Consultar tu saldo, realizar depositos y mas, nunca habia sido mas sencillo. Inicia sesion para esta gran ventaja y disfruta de todos los servicios que "El Banco De Mexico" tiene para ti.</p>
          </div>-->
        </div>

       
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light"></h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="sources/img/tel.jpg" alt="Unsplashed background img 2"></div>
  </div>
      <div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send brown-text">Pago De Telefono</i></h3>
            <table>
        <thead>
          <tr>
             <!-- <th data-field="id">Nombre</th>-->
              <th data-field="name">Servicio</th>
              <th data-field="price">Precio</th>
              
          </tr>
        </thead>

        <tbody>
          <tr>
            <!--<td>*****</td>
            <td>Mensajes</td>
            <td>$0.87</td>-->
          </tr>
          <tr>
            <!--<td></td>-->
            <td>Llamadas Locales</td>
            <td id="can1"><%=llama_lo%></td>
          </tr>
          <tr>
            <!--<td>Jonathan</td>-->
            <td>Llamadas Internacionales</td>
            <td id="can2"><%=llama_int%></td>
         
          </tr>
          
        </tbody>
      </table>
          <hr>
          
          
              <table>
                  <tbody>
                  <tr>
              <td>Total:</td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td align="right"><%=total%></td>
          </tr>
                  </tbody>
              </table>
          <form action="pagar" method="post">
              <input type="hidden" name="valor" value="<%=total%>">
              <input type="hidden" name="name" value="<%=usuario%>">
              <input type="hidden" name="correo" value="<%=correo%>">
              <input type="hidden" name="tipo" value="telefono">
               <center><button class="btn waves-effect waves-light" id="fantasma" type="submit" >Pagar
                     </button></center>
          </form>
          
          
        </div>
            
      </div>

    </div>
  </div>
     <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light"></h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="sources/img/agua.jpg" alt="Unsplashed background img 2"></div>
  </div>

  <div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send blue-text"></i>Pago De Agua</h3>
           <table>
        <thead>
          <tr>
             <!-- <th data-field="id">Nombre</th>-->
              <th data-field="name">Servicio</th>
              <th data-field="price">Precio</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <!--<td>*****</td>
            <td>Mensajes</td>
            <td>$0.87</td>-->
          </tr>
          <tr>
            <!--<td></td>-->
            <td>Servicio De Agua</td>
            <td id="can3"><%=agua%></td>
          </tr>
        </tbody>
      </table>
          <hr>
          <table>
                  <tbody>
                  <tr>
              <td>Total:</td>
              <td></td>
              <td></td>
              <td></td>
              <td align="right"><%=agua%></td>
          </tr>
                  </tbody>
              </table>
          <form action="pagar" method="post">
              <input type="hidden" name="valor" value="<%=agua%>">
              <input type="hidden" name="name" value="<%=usuario%>">
              <input type="hidden" name="correo" value="<%=correo%>">
              <input type="hidden" name="tipo" value="agua">
               <center><button class="btn waves-effect waves-light" id="fantasma" type="submit" >Pagar
                     </button></center>
          </form>
          
        </div>
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light"></h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="sources/img/rey.jpg" alt="Unsplashed background img 3"></div>
  </div>
<div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send purple-text"></i>Pago De Luz</h3>
           <table>
        <thead>
          <tr>
             <!-- <th data-field="id">Nombre</th>-->
              <th data-field="name">Servicio</th>
              <th data-field="price">Precio</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <!--<td>*****</td>
            <td>Mensajes</td>
            <td>$0.87</td>-->
          </tr>
          <tr>
            <!--<td></td>-->
            <td>Servicio De Luz</td>
            <td id="can5"><%=luz%></td>
          </tr>
        </tbody>
      </table>
          <hr>
          <table>
                  <tbody>
                  <tr>
              <td>Total:</td>
              <td></td>
              <td></td>
              <td></td>
              <td align="right"><%=luz%></td>
          </tr>
                  </tbody>
              </table>
          <form action="pagar" method="post">
              <input type="hidden" name="valor" value="<%=luz%>">
              <input type="hidden" name="name" value="<%=usuario%>">
              <input type="hidden" name="correo" value="<%=correo%>">
              <input type="hidden" name="tipo" value="luz">
               <center><button class="btn waves-effect waves-light" id="fantasma" type="submit" >Pagar
                     </button></center>
          </form>
        </div>
      </div>

    </div>
  </div>
    
    
    
    
    
  <footer class="page-footer teal">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
         

        
        
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
      Hecho Por: <a class="brown-text text-lighten-3" href="#">Trinity</a>
      </div>
    </div>
  </footer>

<script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="sources/js/materialize.js"></script>
  <script src="sources/js/init.js"></script>

  </body>
</html>

        