<%
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de Usuarios</title>
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link href="sources/css/style2.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/css/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
  
         <link href="sources/css/style-horizontal.css" type="text/css" rel="stylesheet" media="screen,projection">
         <link href="sources/css/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

        <link href="sources/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
        <link href="sources/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
       <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
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
      <script>
          
          $(document).ready(function(){
              if($("#hola").val()==1){
                   Materialize.toast('Se ha enviado un correo para recuperar contraseña', 4000)
              }
              else if($("#hola").val()==2){
                  Materialize.toast('No se encontro algun correo valido, intente poner uno existente', 4000)
              }

          });
      </script>
    </head>
    <body>
      
         <input id="hola" value="<%=status%>" type="hidden">    
             <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
      <form class="login-form" action="recuperar" method="post">
        <div class="row">
          <div class="input-field col s12 center">
            <h4>Forgot Password</h4>
            <p class="center">You can reset your password, only put your email</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="email" type="email" name="email" class="validate">
            <label for="email" class="center-align">Email</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
              <button class="btn waves-effect waves-light col s12" id="fantasma" type="submit" >Reset Password
                     </button>
           
          </div>
          <div class="input-field col s12">
            <p class="margin sign-up"><a href="login.jsp">Login</a> <a href="registro.jsp" class="right">Register</a></p>
          </div>
        </div>
      </form>
    </div>
  </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
