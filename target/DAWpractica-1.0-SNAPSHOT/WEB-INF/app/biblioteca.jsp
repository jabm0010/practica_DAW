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
                <!--Barra para buscar entre los juegos de tu biblioteca -->
                <div class="col-sm-5 busqueda-juegos">
                    <input type="search" class="form-control ds-input btn-outline-primary" id="search-input" placeholder="Busca en tu biblioteca" autocomplete="off"
                           spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-owns="algolia-autocomplete-listbox-0"
                           dir="auto" style="position: relative; vertical-align: top;">
                </div>



            </div>
        </div>


        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 ">
                    <div class="lista-juegos">


                        <ul class="list-group ">



                            <c:forEach var="c" items="${cliente.videojuegos}">




                                <li class="list-group-item d-flex  justify-content-between align-items-center">
                                    ${c.nombreVideojuego}
                                    <c:if test = "${c.estado == 'Desinstalado'}" > 
                                        <span class="badge badge-warning badge-pill">${c.estado}</span>
                                    </c:if>
                                    <c:if test = "${c.estado == 'Pendiente de actualización'}" > 

                                        <span class="badge badge-info badge-pill">${c.estado}</span>
                                    </c:if>
                                    <c:if test = "${c.estado == 'Instalado'}" > 
                                        <span class="badge badge-primary badge-pill">${c.estado}</span>
                                    </c:if>

                                </li>



                            </c:forEach>





                        </ul>
                    </div>
                </div>

                <div class="col-sm-8 juego-elegido">
                    <!--Juego seleccionado de tu biblioteca -->

                    <c:if test="${fn:length(cliente.videojuegos) > 0}">

                        <div class="card mb-3 border-primary">
                            <img class="card-img-top" src="http://placehold.it/800x450" alt="Card image cap">
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

                    </c:if>




                </div>


            </div>




        </div>



        <!--Footer -->
        <%@include file="/WEB-INF/layout/footer.jspf" %>


    </body>

</html>