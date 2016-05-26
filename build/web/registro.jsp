<%-- 
    Document   : registro
    Created on : 17/05/2016, 02:04:35 AM
    Author     : antonio
--%>
<%  
    String stat = request.getParameter("error");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de Usuarios</title>
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="sources/css/materialize.min.css"  media="screen,projection"/>
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
                if($("#hola").val()==1){
                     Materialize.toast('El email ya esta registrado, prueba con otro', 4000)
                }
            });
      </script>
       <script>
          var allpower=false;
          var one=false;
          var two=false;
      function speed()
      {
         
          //validacion TDC oTDD
         var force= document.getElementById("tarjeta").value;
         var dark= document.getElementById("cebebe").value;
         try{
             if(isNaN(force)||isNaN(dark))
             {
                 throw "Esos no son numeros";
                 one=false;
               
             }else if(!isNaN(force)||!isNaN(dark)){
                 one=true;
             }
             if(document.getElementById("password").value!==document.getElementById("passwordagain").value)
             {
                 throw "Las Contraseñas no coinciden";
                 two=false;
             }else{
                 two=true;
             }
             
         }catch(error)
         {
             alert("Error: "+error);
         }
         
      }
    
      </script>
    </head>
    <body>
        <input id="hola" value="<%=stat%>" type="hidden">
        
         <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
      <form class="login-form" action="Registrar" method="post">
        <div class="row">
          <div class="input-field col s12 center">
            <h4>Register</h4>
            <p class="center">Join to our community now !</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            
            <input id="email" type="email" name="email">
            <label for="email" class="center-align">Email</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
           
            <input id="card" type="number" name="card">
            <label for="card">Credit Card</label>
          </div>
        </div> 
          <div class="row margin">
          <div class="input-field col s4">
            
            <input id="cvv" type="number" name="cvv">
            <label for="cvv">CVV</label>
          </div>
              <div class="input-field col s4">
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
              
              <div class="input-field col s4">
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
        <div class="row">
          <div class="input-field col s12">
              <button class="btn waves-effect waves-light col s12" id="fantasma" type="submit" name="action">Registrate
                        
                     </button>
            
          </div>
          <div class="input-field col s12">
            <p class="margin center medium-small sign-up">Already have an account? <a href="login.jsp">Login</a></p>
          </div>
        </div>
      </form>
    </div>
  </div>
        <script>
             $(document).ready(function() {
    $('select').material_select();
  });
        </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="sources/js/materialize.min.js"></script>
    </body>
</html>
