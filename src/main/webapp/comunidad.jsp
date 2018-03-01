<%-- 
    Document   : comunidad
    Created on : 28-feb-2018, 10:50:21
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

  <head>
    <title>Comunidad</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

    <link rel="stylesheet" href="css/comunidad.css">

  </head>

  <body>




    


    <!--Hasta aquí barra de navegación-->



    <div class="container-fluid">
      <div class="row fila-buffer">
        <div class="col-md-8">
          <div class="row">
            <h2 class="titulo">
              <center>MIS AMIGOS</center>
            </h2>
            <hr width="80%" style="background:rgb(231, 214, 54); border:0; height:7px" />


            <div class="card-deck">
              <div class="card">
                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
                <div class="card-footer">
                  <span class="badge badge-danger">Offline</span>
                </div>
              </div>
              <div class="card">
                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
                <div class="card-footer">
                  <span class="badge badge-danger">Offline</span>
                </div>
              </div>
              <div class="card">
                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
                <div class="card-footer">
                  <span class="badge badge-danger">Offline</span>
                </div>
              </div>
              <div class="card">
                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
                <div class="card-footer">
                  <span class="badge badge-danger">Offline</span>
                </div>
              </div>
            </div>






          </div>



        </div>









        <div class="col-md-4">
          <h2 class="titulo">
            <center>MI PERFIL</center>
          </h2>
          <hr width="80%" style="background:rgb(72, 153, 219); border:0; height:7px" />
          <div class="card  mi-perfil " style="width: 25rem;">
            <img class="round card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png"
                 alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title"> ${param.log_usuario}</h5>
              <p class="card-text">Biografía</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">Número de juegos: </li>
              <li class="list-group-item">Número de amigos: </li>

            </ul>
            <div class="card-body">
              <a href="#" class="card-link">Modificar mi biografía</a>

            </div>
          </div>


        </div>

      </div>
    </div>

  </div>










  <%@include file="/WEB-INF/layout/footer.jspf" %>

  <!--Hasta aquí el footer-->


</body>

</html>