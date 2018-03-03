<%-- 
    Document   : juego
    Created on : 03-mar-2018, 12:44:59
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Juego</title>
    <%@include file="/WEB-INF/layout/head_links.jspf" %>
    <link rel="stylesheet" href="css/busqueda.css">

  </head>

  <body>
    <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

    <div class="container-fluid">
      <div class="row fila-buffer">
        <div class="col-md-5">

          <h1 class="titulo">Juego</h1>
          <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />
          <div class="card  juego-compra " style="width: 25rem;">
            <img class="round card-img-top" src="http://placehold.it/800x500"
                 alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title"> ${param.log_usuario}</h5>
              <p class="card-text">Descripción:</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">Géneros a los que pertenece: </li>
              <li class="list-group-item">Amigos que tienen este juego: </li>

            </ul>

          </div>

        </div>

        <div class="col-md-7">



     

        </div>




      </div>


    </div>




  </body>

  <%@include file="/WEB-INF/layout/footer.jspf" %>
</html>
