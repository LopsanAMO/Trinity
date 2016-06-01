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
String error = request.getParameter("error");
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
%>

<%
} else {

%>
<jsp:forward page="usuarios.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>
</jsp:forward>

<%
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
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link href="sources/css/style2.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/css/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
  
         <link href="sources/css/style-horizontal.css" type="text/css" rel="stylesheet" media="screen,projection">
         <link href="sources/css/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

        <link href="sources/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
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

        .formulario{
          width: 700px;
          height: 100%;
          
          margin: 0 auto;
          padding-top: 5%;
          padding-bottom: 5%;
          border-radius: 20px;

        }

body {
  /*background: url(imges/jister.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;*/
  background-color: #2E3337;
  }

  
      </style>
       <script type="text/javascript">
       $(document).ready(function(){
            if($("#hola").val()==1){
                     Materialize.toast('Correo y/o contraseña erroneos', 4000)
                }
                if($("#hola").val()==2){
                     Materialize.toast('Se ah mandado un correo al email establecido con tu usuario y contraseña, para que puedas empezar a disfrutass de nuestros servicios', 9000)
                }
       });
         
        
     
      </script>
    </head>
    <body>
        
        
         <input type="hidden" id="hola" value="<%=error%>">
       
        <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
        <form class="login-form" action="login" method="post" name="holis">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="sources/img/icon.png" alt="" class="circle responsive-img valign profile-image-login">
            <p class="center login-form-text">Trinity Payment Administrator</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="username" type="text" name="name">
            <label for="username" class="center-align">Username</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password" name="pass">
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me" />
              <label for="remember-me">Remember me</label>
          </div>
        </div>
        <input name="DIY" values="1" type="hidden">
        <div class="row">
          <div class="input-field col s12">
             
              <button class="btn waves-effect waves-light col s12" id="fantasma" type="submit" >Iniciar Perfil
                     </button>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="registro.jsp">Register Now!</a></p>
          </div>
          <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="recuperar.jsp">Forgot password ?</a></p>
          </div>          
        </div>

      </form>
    </div>
  </div>
       
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
