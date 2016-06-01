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
String correo ="";
error = request.getParameter("error");
String contra  ="";
String usi="";
if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>
</jsp:forward>
<%
} else {
correo = (String)sesionOk.getAttribute("corre");
usuario = (String)sesionOk.getAttribute("temporal");
usi = (String)sesionOk.getAttribute("temporal");
LinkedList<Usuario> lista = busca.getconsulta4(usuario);
   for (int i=0;i<lista.size();i++)
    {
            email = lista.get(0).getUsuario_email();
            contra=  lista.get(0).getUsuario_pass();
    }     
        
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
          color:#039be5;
         
      }

      </style>
      <script type="text/javascript">
       $(document).ready(function(){
           $('#fantasma').click(function(){
                document.forms["holo"].submit();
           });
           $('#dale').click(function(){
               document.forms["formu"].submit();
           }); 
            if($("#hola").val()==1){
                     Materialize.toast('El email ya esta registrado, prueba con otro', 4000)
                }
       });
         
        
      
   
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
        <br>
        <br>
        <input type="hidden" id="hola" value="<%=error%>">
    <center>
        <h3><font color="white">Datos Generales <%=usuario%></font></h3>
      <table  class="highlight hola">
       
        <tbody>   
       
          <tr>
        <br>
              <td><a><%=email%></a></td>
            <td>
                 <form method="post" name="holo" action="actualizar">
          <input placeholder="Cambiar Email" name="email" type="email" class="validate" >
          <input placeholder="Cambiar Email" name="hacer" type="hidden" class="validate" value="1">
          <input placeholder="Cambiar Email" name="usuario" type="hidden" class="validate" value="<%=usuario%>" >
                               
        </form>
        </td>
            <td>
                <button class="btn waves-effect waves-light col 6" id="fantasma" >Cambiar
                     </button>
            </td>
          </tr>
            
        <thead></thead>
        
          <tr>
            <td><a>*******************</a></td>
            <td> 
                <form method="post" action="actualizar" name="formu"> 
                    <input name="pass" type="password" class="validate">
                    <input name="usuario" type="hidden" class="validate" value="<%=usuario%>" >
                    <input placeholder="Cambiar Email" name="email" type="hidden" class="validate" value="<%=email%>" >
                    <input name="hacer" type="hidden" class="validate" value="2">
                </form>    
            </td>
            <td><button class="btn waves-effect waves-light col 6" id="dale">Cambiar
                     </button></td>
          </tr>
          
        </tbody>
      </table>
        </center>
    <center>
        <h3><font color="white">Metodo de Pago</font></h3>
        <center>
        <table>
            <tr>
                <td>
                    
                </td>
            </tr>
        </table>
        </center>
            
        <div class="row">
            <div class="input-field col s3">
           
            <input id="card" type="number" name="card">
            <label for="card">Credit Card</label>
          </div>
        </div> 
          <div class="row margin ">
          <div class="input-field col s1 ">
            
            <input id="cvv" type="number" name="cvv">
            <label for="cvv">CVV</label>
          </div>
              <div class="input-field col s1">
                  <select name="mes">
                <option value="" disabled selected>Mes</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
            
            <label for="mes"></label>
          </div>
              
              <div class="input-field col s1">
                  <select id="ano" name="ano">
                <option value="" disabled selected>Año</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
                <option value="2028">2028</option>
                <option value="2029">2029</option>
                <option value="2030">2030</option>
              </select>
           
            <label for="ano"></label>
          </div>
        </div>
</center>
    <center>
        <h3><font color="white">Peticion de Baja</font></h3>
        <div class="row">
        <form action='baja' method='post'>
            <div class="input-field col s8">
            <input id="tex" name="peticion" placeholder='razon'>
            <input type="text" name="user" value='<%=usuario%>'>
            <input type="text" name='email' value="<%=email%>">
            <input type="text" name='temporal' value="<%=usi%>">
            <button class="btn waves-effect waves-light col 6" id="dale" type="submit">Dar de baja
                     </button>
            </div>
        </form>
        </div>
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
