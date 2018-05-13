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




                <div class="col-xl-6">


                    <h1 class="titulo"> Juegos con "${busca_nombre}"</h1>
                    <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />

                    <c:if test="${fn:length(videojuegos) < 1}">

                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">Oops..</h1>
                                <p class="lead"> No hay juegos con que contengan la secuencia de caracteres introducida</p>
                            </div>
                        </div>

                    </c:if>


                    <div class="album py-5 bg-light">
                        <div class="container">
                            <div class="row">

                                <c:forEach var="v" items="${videojuegos}">

                                    <c:set var="qry" value="?videojuegoID=${v.videojuegoID}"/>

                                    <div class="col-md-4">
                                        <div class="card mb-4 box-shadow">
                                            <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/imgs/juego${v.videojuegoID}.png" alt="juego" width="240" height="200">
                                            <div class="card-body">
                                                <h5 class="card-title">${v.nombreVideojuego}</h5>
                                                <p class="card-text">${v.desarrollador}</p>
                                                <p class="card-text">${v.publicador}</p>
                                                <p class="card-text"><small class="text-muted">${v.precio} €</small></p>
                                            </div>
                                            <div class="card-footer">

                                                <a class="btn btn-success" href='${srvUrl}/juego?id=${v.videojuegoID}'>Ver</a>

                                            </div>
                                        </div>
                                    </div>




                                </c:forEach>




                            </div>

                        </div>


                    </div>



                </div>

                <!--Sección de usuarios -->    
                <div class="col-xl-6">


                    <h1 class="titulo">Usuarios con "${busca_nombre}"</h1>
                    <hr width="60%" style="background:rgb(231, 214, 54); border:0; height:7px" />

                    <c:if test="${fn:length(usuarios) < 1}">

                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">Oops..</h1>
                                <p class="lead"> No hay usuarios con que contengan la secuencia de caracteres introducida</p>
                            </div>
                        </div>

                    </c:if>




                    <c:if test="${fn:length(usuarios) != 0}">

                        <div class="album py-5 bg-light">
                            <div class="container">
                                <div class="row">
                                    <c:forEach var="c" items="${usuarios}">
                                        <div class="col-md-4">
                                            <div class="card mb-4 box-shadow">
                                                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                                                <div class="card-body">
                                                    <h5 class="card-title">${c.nombre}</h5>
                                                    <p class="card-text">${c.biografia}</p>

                                                </div>
                                                <div class="card-footer">
                                                    <form role="form" action='${srvUrl}/agregaramigo?id=${c.id}' method="POST">
                                                        <button type="submit" class="btn btn-primary" >Añadir amigo</button>
                                                    </form>
                                                    <%--
                                                      <button type="submit" class="btn btn-primary"  href='${srvUrl}/agregaramigo?id=${c.id}' data-toggle="modal" data-target="#notificacion-amistad">Añadir amigo</button>
                                                    --%>
                                                </div>
                                            </div>
                                        </div>




                                    </c:forEach>




                                </div>

                            </div>


                        </div>
                    </c:if>


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

<div class="footer-busq">
    <%@include file="/WEB-INF/layout/footer.jspf" %>       
</div>
</body>





</html>