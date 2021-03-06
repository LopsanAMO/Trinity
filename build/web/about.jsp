<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="servlets.*" %>

<%@ page session="true" %>
<%
String usuario = "";
String contra = "";
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
contra = (String)sesionOk.getAttribute("contra");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>Banco Mexico</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="sources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="sources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
  <nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" class="brand-logo" ><img src="sources/img/trinity.jpg" alt="logo" height="62" width="72"></a>
      <ul class="right hide-on-med-and-down">
        <li><a id="logo-container" class="brand-logo"><img src="sources/img/bm.jpg" alt="logo" height="62" width="92"> </a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a href="#">Navbar Link</a></li>
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menú</i></a>
    </div>
  </nav>

  <div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
      <div class="container">
        <br><br>
        <h1 class="header center blue-text text-lighten-2">Banco Mexico</h1>
        <div class="row center">
          <h5 class="header col s12 light">¡Bienvenidos al Portal de Banco Mexico!</h5>
          <br>
          <br>
          <br>
          <a href="usuarios.jsp"><h5>¡Empieza tu experiencia ahora!</h5></a>
        </div>
       
        <br><br>

      </div>
    </div>
    <div class="parallax"><img src="sources/img/Bank3.jpg" alt="Unsplashed background img 1"></div>
  </div>


  <div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">monetization_on</i></h2>
            <h5 class="center">Consulta de Saldo</h5>

            <p class="light">Consultar tu saldo, realizar depositos y mas, nunca habia sido mas sencillo. Inicia sesion para esta gran ventaja y disfruta de todos los servicios que "El Banco De Mexico" tiene para ti.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">payment</i></h2>
            <h5 class="center">Pagos en Linea</h5>

            <p class="light">Nos hemos concentrado en realizar una manera rapida y sencilla en la que puedes pagar telefono, luz y agua...Todo esto a solo un click de distancia</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">lock</i></h2>
            <h5 class="center">Reportes de Robo</h5>

            <p class="light">En ocaciones en necesario tomar acciones rapidas, acciones que tardarian demasiado en un banco convencional, hemos creado un sistema que permite el reporte de robo de tarjetas de una manera rapida, segura y sencilla por que nos interesas tu y tu bienestar</p>
          </div>
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
    <div class="parallax"><img src="sources/img/5.jpg" alt="Unsplashed background img 2"></div>
  </div>

  <div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send brown-text"></i></h3>
          <h3>Banco Mexico</h3>
          <p class="left-align light">El Banco de México es el banco central del Estado Mexicano. Por mandato constitucional, es autónomo en sus funciones y administración. Su finalidad es proveer a la economía del país de moneda nacional y su objetivo prioritario es procurar la estabilidad del poder adquisitivo de dicha moneda. Adicionalmente, le corresponde promover el sano desarrollo del sistema financiero y propiciar el buen funcionamiento de los sistemas de pago.</p>
          <h4><strong>Mision</strong></h4>
          <p class="light">El Banco de México tiene el objetivo prioritario de preservar el valor de la moneda nacional a lo largo del tiempo y, de esta forma, contribuir a mejorar el bienestar económico de los mexicanos. </p>
          <h4><strong>Vision</strong></h4>
        <p class="light">Ser una institución de excelencia merecedora de la confianza de la sociedad por lograr el cabal cumplimiento de su misión, por su actuación transparente, así como por su capacidad técnica y compromiso ético.</p>
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
    <div class="parallax"><img src="sources/img/est.jpg" alt="Unsplashed background img 3"></div>
  </div>
  <footer class="page-footer teal">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">Y Aún Hay Más</h5>
          <p class="grey-text text-lighten-4">Porque eres parte importante de nosotros y queremos mantenernos en contacto</p>


        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Redes Sociales</h5>
          <i class="material-icons">share</i>
          <ul>
              
            <li><a class="white-text" href="https://www.facebook.com/DivulgacionBanxico">Facebook</a></li>
            <li><a class="white-text" href="http://twitter.com/Banxico">Twitter</a></li>
            <li><a class="white-text" href="http://www.youtube.com/c/banxico">Youtube</a></li>
            
          </ul>
        </div>
        <!--<div class="col l3 s12">
          <h5 class="white-text">Twitter</h5>
          <ul>
            <li><a class="white-text" href="#!">Link 1</a></li>
            <li><a class="white-text" href="#!">Link 2</a></li>
            <li><a class="white-text" href="#!">Link 3</a></li>
            <li><a class="white-text" href="#!">Link 4</a></li>
          </ul>
        </div>-->
      </div>
    </div>
      
    <div class="footer-copyright">
      <div class="container">
      Hecho Por: <a class="brown-text text-lighten-3" href="#">Trinity</a>
      
      </div>
    </div>
  </footer>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="sources/js/materialize.js"></script>
  <script src="sources/js/init.js"></script>

  </body>
</html>

        