<%-- 
    Document   : biblioteca
    Created on : 28-feb-2018, 10:45:55
    Author     : Juan Béjar
--%>

<%--
    Vista biblioteca donde un usuario podrá ver los juegos que posee.
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Biblioteca</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="/WEB-INF/layout/head_links.jspf" %>
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/biblioteca.css'/>">


    </head>

    <body>

        <!--Barra de navegación -->
        <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>





        <div class="container-fluid">
            <div class="row">

            </div>
        </div>


        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 ">
                    <div class="lista-juegos">


                        <ul class="list-group ">



                            <c:forEach var="c" varStatus="i" items="${cliente.videojuegos}">

                                <c:choose>
                                    <c:when test="${primerJuego.videojuegoID == c.videojuegoID}">
                                        <li id="elemLista"  class="list-group-item active d-flex  justify-content-between align-items-center">
                                            ${c.nombreVideojuego}
                                            <c:if test = "${c.estado == 'Desinstalado'}" > 
                                                <span class="badge badge-warning badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Pendiente de actualización'}" > 

                                                <span class="badge badge-info badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Instalado'}" > 
                                                <span class="badge badge-dark badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Jugando'}" > 
                                                <span class="badge badge-success badge-pill">${c.estado}</span>
                                            </c:if>



                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li id="elemLista"  class="list-group-item  d-flex  justify-content-between align-items-center">
                                            ${c.nombreVideojuego}
                                            <c:if test = "${c.estado == 'Desinstalado'}" > 
                                                <span class="badge badge-warning badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Pendiente de actualización'}" > 

                                                <span class="badge badge-info badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Instalado'}" > 
                                                <span class="badge badge-dark badge-pill">${c.estado}</span>
                                            </c:if>
                                            <c:if test = "${c.estado == 'Jugando'}" > 
                                                <span class="badge badge-success badge-pill">${c.estado}</span>
                                            </c:if>

                                        </li>
                                    </c:otherwise>

                                </c:choose>

                                <a class="btn btn-outline-info" href='${srvUrl}/seleccionarJuego?id=${c.videojuegoID}'>Seleccionar</a>






                            </c:forEach>





                        </ul>
                    </div>
                </div>

                <div class="col-sm-8 juego-elegido">
                    <!--Juego seleccionado de tu biblioteca -->

                    <c:if test="${fn:length(cliente.videojuegos) < 1}">

                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">Tu biblioteca está vacía</h1>
                                <p class="lead"> Comienza a completar tu colección buscando tus juegos favoritos</p>
                            </div>
                        </div>


                    </c:if>


                    <c:if test="${fn:length(cliente.videojuegos) != 0}">

                        <div class="card mb-3 border-primary">
                            <img class="card-img-top"  src="${pageContext.request.contextPath}/imgs/juegoc${primerJuego.videojuegoID}.png" width="800" height="550" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">${primerJuego.nombreVideojuego}</h5>
                                <div class="btn-group mr-2" role="group" aria-label="First group">

                                    <form action="${srvUrl}/jugar?id=${primerJuego.videojuegoID}" method="POST">
                                        <button type="submit" class="btn btn-success">Jugar</button>
                                    </form>
                                    <form action="${srvUrl}/instalar?id=${primerJuego.videojuegoID}" method="POST">
                                        <button type="submit" class="btn btn-dark">Instalar</button>
                                    </form>
                                    <form action="${srvUrl}/desinstalar?id=${primerJuego.videojuegoID}" method="POST">
                                        <button type="submit" class="btn btn-danger">Desinstalar</button>
                                    </form>

                                </div>

                            </div>
                        </div>

                    </c:if>

                </div>


            </div>




        </div>



        <!--Footer -->
        <%@include file="/WEB-INF/layout/footer.jspf" %>


    </body>

</html>