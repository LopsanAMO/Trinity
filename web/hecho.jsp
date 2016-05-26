<%
    String token = request.getParameter("status");
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
        <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
       <script>
        $(document).ready(function(){
                if($("#hola").val()==2){
                     Materialize.toast('Este link ya es inutil, la contraseña ya fue restablecida', 4000)
                }
                else if($("#hola").val()==2){
                    Materialize.toast('La contraseña fue restablecida correctamente', 4000)
                }
                else{
                    Materialize.toast('no juegue con el url perro >:(', 4000)
                }
            });
      </script>
    </head>
    <body>
        <nav>
          <div class="nav-wrapper">
            <a href="index.html" class="brand-logo" id="logomoto"> <b>Auto</b>Bank</a>
            <ul class="right hide-on-med-and-down">
              <li><a href="index.html" id="tamano-font">Acerca de Banco de México</a></li>
              <li><a href="index.html" id="tamano-font">Pago de Servicios</a></li>
              <li><a href="index.html" id="tamano-font">Contacto</a></li>
            </ul>
          </div>
        </nav>
        <div class="fondo">
            <br>
        <br>
        <br>
        <br>
        <br>
            <div class="formulario" >
             <div class="row">
                 <form class="col s12" action="login" method="post">
              
             
                <div class="row">
                  <div class="input-field col s6">
                      <input id="tarjeta" type="text" name="name" class="validate" >
                    <label for="tarjeta">Usuario</label>
                  </div>

                  <div class="input-field col s3">
                      <input id="cebebe" type="password" name="pass" class="validate">
                    <label for="cebebe">Contraseña</label>
                  </div>
                </div>
                     <center><button class="btn waves-effect waves-light" id="fantasma" type="submit" >Iniciar Perfil
                     </button></center>
              </form>
           
                
             
            </div>
          </div>
        
        <input id ="hola" value="<%=token%>" type="hidden">
        </div>  
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
