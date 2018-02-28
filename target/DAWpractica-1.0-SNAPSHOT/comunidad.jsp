<%-- 
    Document   : comunidad
    Created on : 28-feb-2018, 10:50:21
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
    <title>Comunidad</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/WEB-INF/layout/head_links.jspf" %>

    <link rel="stylesheet" href="css/comunidad.css">

  </head>

  <body>

    <div class="barra-navegacion">
      <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
          <span class="navbar-toggler-icon"></span>
        </button>

        <a class="navbar-brand">
          <img src="imgs/3.png" height="40" widht="30">
        </a>

        <span class="navbar-text">
          <h4>Steam</h4>
        </span>


        <div class="collapse navbar-collapse justify-content-end" id="collapse_target">




          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="tienda.jsp">Tienda</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="#">Comunidad</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="biblioteca.jsp">Biblioteca</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#footer">Contacto</a>
            </li>

          </ul>
        </div>

      </nav>

    </div>


    <!--Hasta aquí barra de navegación-->



    <div class="container-fluid">
      <div class="row fila-buffer">
        <div class="col-sm-8">
          <div class="row">
            <h2 class="titulo">
              <center>MIS AMIGOS</center>
            </h2>
            <hr width="80%" style="background:rgb(231, 214, 54); border:0; height:7px" />
            <div class="card-columns">

              <div class="card">
                <img class="round card-img-top img-fluid" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png"
                     width="150px" height="150px" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">user 1</h5>
                  <button type="button" class="btn btn-primary">Enviar mensaje</button>
                </div>
                <div class="card-footer">
                  <span class="badge badge-success">Online</span>
                </div>
              </div>

              <div class="card">
                <img class="round card-img-top img-fluid" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png"
                     width="150px" height="150px" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">user 1</h5>
                  <button type="button" class="btn btn-primary">Enviar mensaje</button>
                </div>
                <div class="card-footer">
                  <span class="badge badge-danger">Offline</span>
                </div>
              </div>






            </div>



          </div>








        </div>
        <div class="col-sm-4">
          <h2 class="titulo">
            <center>MI PERFIL</center>
          </h2>
          <hr width="80%" style="background:rgb(72, 153, 219); border:0; height:7px" />
          <div class="card  mi-perfil " style="width: 25rem;">
            <img class="round card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png"
                 alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">Cras justo odio</li>
              <li class="list-group-item">Dapibus ac facilisis in</li>
              <li class="list-group-item">Vestibulum at eros</li>
            </ul>
            <div class="card-body">
              <a href="#" class="card-link">Card link</a>
              <a href="#" class="card-link">Another link</a>
            </div>
          </div>


        </div>


      </div>

    </div>










    <%@include file="/WEB-INF/layout/footer.jspf" %>

    <!--Hasta aquí el footer-->


  </body>

</html>