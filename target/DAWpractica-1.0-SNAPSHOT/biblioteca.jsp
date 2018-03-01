<%-- 
    Document   : biblioteca
    Created on : 28-feb-2018, 10:45:55
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
    <title>Biblioteca</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

    <link rel="stylesheet" href="css/biblioteca.css">

  </head>

  <body>

   


    <!--Hasta aquí barra de navegación-->



    <div class="container-fluid">
      <div class="row">

        <div class="col-sm-5 busqueda-juegos">
          <input type="search" class="form-control ds-input btn-outline-primary" id="search-input" placeholder="Buscar..." autocomplete="off"
                 spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-owns="algolia-autocomplete-listbox-0"
                 dir="auto" style="position: relative; vertical-align: top;">
        </div>
        ¡


      </div>
    </div>


    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-4 ">
          <div class="lista-juegos">


            <ul class="list-group ">

              <li class="list-group-item d-flex  justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center active">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>

              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>

              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>

              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>

              <li class="list-group-item d-flex justify-content-between align-items-center">
                Cras justo odio
                <span class="badge badge-primary badge-pill">Instalado</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Dapibus ac facilisis in
                <span class="badge badge-info badge-pill">Pendiente de actualizar</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Morbi leo risus
                <span class="badge badge-warning badge-pill">Pendiente de descarga</span>
              </li>




            </ul>
          </div>
        </div>

        <div class="col-sm-8 juego-elegido">


          <div class="card mb-3 border-primary">
            <img class="card-img-top" src="https://www.thinkcomputers.org/wp-content/uploads/2018/02/PUBG.jpg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <div class="btn-group mr-2" role="group" aria-label="First group">
                <button type="button" class="btn btn-success">Jugar</button>
                <button type="button" class="btn btn-dark">Descargar</button>
                <button type="button" class="btn btn-danger">Desinstalar</button>

              </div>
              <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
          </div>

        </div>


      </div>




    </div>




    <%@include file="/WEB-INF/layout/footer.jspf" %>


  </body>

</html>