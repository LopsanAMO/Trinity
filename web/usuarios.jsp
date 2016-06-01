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
error = request.getParameter("error_pago");
String estado= estado = request.getParameter("status");
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
      <script src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script>
          function enviar(form){
            form.submit();
          }
      </script>
      <script>
          $(document).ready(function(){
              if($("#hola").val()==1){
                   Materialize.toast('El pago con la tarjeta fue rechazado, checa tu metodo de pago, o cambialo', 7000)
              }
              if($("#stado").val()==1){
                  
                  Materialize.toast('Tu pago fue realizado correctamente!', 7000)
                  console.log("HOLIS")
              }
              else if($("#stado").val()==2){
                  Materialize.toast('El pago con la tarjeta fue rechazado, checa tu metodo de pago, o cambialo', 7000)
              }
              else if($("#stado").val()==3){
                  Materialize.toast('Correo perfectamente actualizado, te llegara un correo de confirmacion y/o cancelacion. Te recomendamos que cierres sesion e inicies de nuevo para poder actualizar tus datos', 8000)
              }
              else if($("#stado").val()==4){
                  Materialize.toast('Contraseña perfectamente actualizada, te llegara un correo de confirmacion. Te recomendamos que cierres sesion e inicies de nuevo para poder actualizar tus datos', 8000)
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
              <li><a href="about.jsp" id="tamano-font">Acerca de Banco de México</a></li>
              <li><a href="javascript:enviar(ip);" id="tamano-font">Logout</a></li>
            </ul>
          </div>
        </nav>
        
        <form method="post" name="ip" action="Logout">
            <input type="hidden"  value="elipdelUser">
        </form>
        <input id="hola" type="hidden" value="<%=error%>" >
        <input id="stado" type="hidden" value="<%=estado%>" >
        <br>
 		<div class="Contenido_total">
 			<header>
                            <h2><center><font color="white">Bienvenido a AutoBank</font></center></h2>
                              
 			</header>
                    
                    <br>
                    <br>
      
                    <h4><font color="white">Pesos mexicano - Divisa Extranjera</font></h4>  
                  <div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title" id="num">$0.00</span>
              
              <div class="input-field col s4">
          
          <input id="canti" type="text" class="validate">
          <label for="canti">Cantidad $</label>
        </div>
              <div class="input-field col s4">
                  <select id="divisa">
                <option value="" disabled selected>Divisa</option>
                <option value="17.9000">Dolar (USA)</option>
                <option value="1.2878">Peso (Argentina)</option>
                <option value="0.0262">Peso (Chile)</option>
                <option value="0.0059">Peso (Colombia)</option>
                <option value="0.5795">Peso (Uruguay)</option>
                <option value="2.6534">Boliviano</option>
                <option value="5.0795">Real (Brasil)</option>
                <option value="13.7800">Dolar (Canada)</option>
                <option value="0.0341">Colón (Costa Rica)</option>
                <option value="0.0007">Sucre (Ecuador)</option>
                <option value="2.3655">Quetzal (Guatemala)</option>
                <option value="0.0032">Guaraní (Paraguay)</option>
                <option value="5.4088">Sol (Perú)</option>
                <option value="0.0084">Bolivar (venezuela)</option>
                <option value="20.1532">Euro</option>
                <option value="2.7093">Corona (Dinamarca)</option>
                <option value="26.5770">Libra Esterlina</option>
                <option value="2.1694">Corona (Noruega)</option>
                <option value="2.1754">Corona (Suecia)</option>
                <option value="18.2320">Franco (Suiza)</option>
                <option value="45.4586">Libra (Chipre)</option>
                <option value="2.3273">Dólar (Hong Long)</option>
                <option value="0.2683">Rupia (India)</option>
                <option value="0.1639">Yen (Japon)</option>
                <option value="26.7068">Dólar (Nueva Zelanda)</option>
                <option value="13.1074">Dólar (Singapur)</option>
              </select>
            
            <label for="mes"></label>
          </div>
            </div>
              
            <div class="card-action">
              <button class="btn waves-effect waves-light col 6" id="fantasma" onclick="convertidor()">calcular
                     </button>
            </div>
          </div>
        </div>
      </div>
                    <br>
                       <div align="right" >
            <a class="waves-effect waves-light btn-large" href="pagos.jsp"><i class="material-icons right">payment</i>Pago De Servicios</a>
          </div>
                    
                    <form action="consulta" method="post">
                        
                        <button class="btn waves-effect waves-light col 6" id="fantasma" type="submit">calcular
                     </button>
                    </form>
                    <br>
                    <h4><font color="white">Divisa Extranjera - Pesos mexicano</font></h4>  
                  <div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title" id="new">$0.00</span>
              
              <div class="input-field col s4">
          
          <input id="peso" type="text" class="validate">
          <label for="peso">Cantidad $</label>
        </div>
              <div class="input-field col s4">
                  <select id="divis">
                <option value="" disabled selected>Divisa</option>
                <option value="17.9000">Dolar (USA)</option>
                <option value="1.2878">Peso (Argentina)</option>
                <option value="0.0262">Peso (Chile)</option>
                <option value="0.0059">Peso (Colombia)</option>
                <option value="0.5795">Peso (Uruguay)</option>
                <option value="2.6534">Boliviano</option>
                <option value="5.0795">Real (Brasil)</option>
                <option value="13.7800">Dolar (Canada)</option>
                <option value="0.0341">Colón (Costa Rica)</option>
                <option value="0.0007">Sucre (Ecuador)</option>
                <option value="2.3655">Quetzal (Guatemala)</option>
                <option value="0.0032">Guaraní (Paraguay)</option>
                <option value="5.4088">Sol (Perú)</option>
                <option value="0.0084">Bolivar (venezuela)</option>
                <option value="20.1532">Euro</option>
                <option value="2.7093">Corona (Dinamarca)</option>
                <option value="26.5770">Libra Esterlina</option>
                <option value="2.1694">Corona (Noruega)</option>
                <option value="2.1754">Corona (Suecia)</option>
                <option value="18.2320">Franco (Suiza)</option>
                <option value="45.4586">Libra (Chipre)</option>
                <option value="2.3273">Dólar (Hong Long)</option>
                <option value="0.2683">Rupia (India)</option>
                <option value="0.1639">Yen (Japon)</option>
                <option value="26.7068">Dólar (Nueva Zelanda)</option>
                <option value="13.1074">Dólar (Singapur)</option>
              </select>
            
            <label for="mes"></label>
          </div>
            </div>
              
            <div class="card-action">
              <button class="btn waves-effect waves-light col 6" id="fantasma" onclick="peso()">calcular
                     </button>
            </div>
          </div>
        </div>
      </div>     
                   
 		</div>
      
        <script>
            $(document).ready(function() {
                $('select').material_select();
              });
        </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    </body>
</html>
