<%-- 
    Document   : buscaJuegos
    Created on : 01-mar-2018, 20:49:41
    Author     : Juan Béjar
--%>

<%--
    A esta búsqueda se accede pulsando el botón de la barra de navegación. Los caracteres en dicha barra aparecen también 
    en esta vista de forma dinámica. Además hay una barra de "Géneros" que se utilizará en el futuro
    para filtrar juegos por el género al que pertenecen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda</title>
        <%@include file="/WEB-INF/layout/head_links.jspf" %>

        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/busqueda.css'/>">

    </head>
    <body>
        <!--Barra de navegación -->
        <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

        <div class="container-fluid">
            <div class="row fila-buffer">
                <div class="col-md-2">

                    <!--Sección de géneros -->


                    <h4 class="titulo sec">
                        <center>Géneros</center>
                    </h4>
                    </br>
                    </br>

                    <form>

                        <input type="checkbox" class="col-md-2" id="genero1" value="genero1"><label> Género 1</label><br>

                        <input type="checkbox" class="col-md-2" id="genero2" value="genero2"><label for="cbox2">Género 2</label>
                    </form>
                </div>



                <div class="col-md-5">


                    <h1 class="titulo"> Juegos con "${busca_nombre}"</h1>
                    <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />

                    <c:if test="${fn:length(videojuegos) < 1}">


                        </br>
                        <h3>No hay juegos con que contengan la secuencia de caracteres introducida</h3>

                    </c:if>

                    <div class="card-columns">

                        <c:forEach var="v" items="${videojuegos}">

                            <c:set var="qry" value="?videojuegoID=${v.videojuegoID}"/>
                            <div class="card">
                                <img class="card-img-top img-fluid" src="http://placehold.it/240x180" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">${v.nombreVideojuego}</h5>
                                    <p class="card-text">${v.desarrollador}</p>
                                    <p class="card-text">${v.publicador}</p>
                                    <p class="card-text"><small class="text-muted">${v.precio} €</small></p>
                                </div>
                                <div class="card-footer">

                                    <a class="btn btn-success" href='${srvUrl}/juego${qry}'>Ver</a>

                                </div>
                            </div>


                        </c:forEach>


                    </div>
                </div>

                <!--Sección de usuarios -->    
                <div class="col-md-5">


                    <h1 class="titulo">Usuarios con "${busca_nombre}"</h1>
                    <hr width="60%" style="background:rgb(231, 214, 54); border:0; height:7px" />

                    <c:if test="${fn:length(videojuegos) < 1}">

                        <h3>No hay usuarios con que contengan la secuencia de caracteres introducida</h3>

                    </c:if>



                    <div class="card-columns">
                        <c:forEach var="c" items="${usuarios}">

                            <div class="card">
                                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">${c.nombre}</h5>
                                    <p class="card-text">${c.biografia}</p>

                                </div>
                                <div class="card-footer">
                                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#notificacion-amistad">Añadir amigo</button>

                                </div>
                            </div>

                        </c:forEach>



                    </div>  
                </div>

            </div>
        </div>

    </div>



    <!--Modal para que muestre un mensaje confirmando que una solicitud de amistad se realizó correctamente-->     

    <div class="modal fade" id="notificacion-amistad" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Añadir amigo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Se ha enviado una solicitud de amistad.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK!</button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>










<!--Footer -->
<div class="footer-busq">
    <%@include file="/WEB-INF/layout/footer.jspf" %>       
</div>
</html>