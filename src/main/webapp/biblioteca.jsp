<%-- 
    Document   : biblioteca
    Created on : 28-feb-2018, 10:45:55
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@include file="/WEB-INF/layout/head_links.jspf" %>

    <link rel="stylesheet" href="css/biblioteca.css">

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
                        <a class="nav-link " href="comunidad.jsp">Comunidad</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Biblioteca</a>
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
                        <li class="list-group-item d-flex justify-content-between align-items-center active">
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