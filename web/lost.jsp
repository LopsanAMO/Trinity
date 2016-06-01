<%
    String token = request.getParameter("token");
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
       <script>
      function speed()
      {
         
          //validacion TDC oTDD
         if(document.getElementById("email").value==document.getElementById("email2").value)
             {  
                 
                 return true;
             }else{
                 alert('las contraseñas no coinciden');
                 return false;
             }
         
      }
    
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
                 <form class="col s12" action="lost" method="post" onsubmit= "return speed()">
              
                     <input name="idi" value="<%=token%>" type="hidden">
                <div class="row">
                  <div class="input-field col s6">
                      <input id="email" type="password" name="email" class="validate" >
                    <label for="email">Contraseña</label>
                  </div>
                  <div class="input-field col s6">
                      <input id="email2" type="password" name="email" class="validate" >
                    <label for="email2">Confirmar contraseña</label>
                  </div>
                </div>
                     <center><button class="btn waves-effect waves-light" id="fantasma" type="submit" >Recuperar
                     </button></center>
              </form>
                 
             
            </div>
          </div>
        </div>  
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
