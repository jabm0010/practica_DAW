<%-- 
    Document   : tienda
    Created on : 28-feb-2018, 10:40:03
    Author     : Juan Béjar
--%>
<%--
    Página de la tienda, donde se mostrarán las principales ofertas y novedades de la página.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


    <head>
        <title>Tienda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="/WEB-INF/layout/head_links.jspf" %>

        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/tienda.css'/>">

    </head>

    <body>

        <!--Barra de navegación -->
        <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-1 col-md-1"></div>
                <div class="col-xs-6 col-md-6">

                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    <!--Sección de destacados con carousel-->
                    <h2 class="titulo pri">
                        <center>DESTACADOS</center>
                    </h2>
                    <hr width="85%" style="background:rgb(65, 23, 122); border:0; height:7px" />

                    <div id="carousel-destacados" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-destacados" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-destacados" data-slide-to="1"></li>
                            <li data-target="#carousel-destacados" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">


                            <div class="carousel-item active">
                                <img class="d-block w-100" src="${pageContext.request.contextPath}/imgs/juegoc1.png" alt="First slide" class="rounded">
                            </div>

                            <div class="carousel-item">
                                <img class="d-block w-100" src="${pageContext.request.contextPath}/imgs/juegoc2.png" alt="Second slide" class="rounded">
                            </div>

                            <div class="carousel-item">
                                <img class="d-block w-100" src="${pageContext.request.contextPath}/imgs/juegoc3.png" alt="Third slide" class="rounded">
                            </div>



                            <%--
                            <c:forEach var="p"  varStatus="i" items="${promocionados}">

                                <c:choose>
                                    <c:when test="${i.index == 0}">
                                        <div class="carousel-item-active">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/imgs/juego${p.videojuegoID}.png" alt="slide" class="rounded">
                                        </div>
                                    </c:when>
                                    <c:when test="${i.index != 0}">
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/imgs/juego${p.videojuegoID}.png" alt="slide" class="rounded">
                                        </div>
                                    </c:when>

                                </c:choose>

                            </c:forEach>
                            --%>


                        </div>
                        <a class="carousel-control-prev" href="#carousel-destacados" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-destacados" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <div class="col-xs-4 col-md-4">

                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <!--Sección de ofertas semanales-->
                    <h4 class="titulo sec">
                        <center>OFERTAS SEMANALES</center>
                    </h4>
                    <hr width="85%" style="background:rgb(18, 119, 9); border:0; height:7px" />

                    <div class="container">
                        <div class="row">

                            <c:forEach var="o"  items="${enOferta}">
                                <div class="col-md-6">
                                    <div class="card mb-6 box-shadow">
                                        <div class="card-header d-flex justify-content-aroundr">
                                            <span class="badge badge-warning">- ${o.descuento} %</span>
                                            <span class="badge badge-success">${o.precio}</span>

                                        </div>

                                        <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/imgs/juego${o.videojuegoID}.png" alt="juego" width="240" height="200">
                                        <div class="card-footer text-muted d-flex justify-content-center">
                                            <a href="${srvUrl}/juego?id=${o.videojuegoID}" class="btn btn-primary">Ver juego</a>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>



                </div>
                <div class="col-xs-1 col-md-1"></div>

            </div>




            <!--Hasta aquí las filas con los titulos y las ofertas destacadas y semanales-->


        </div>



        <!--Sección de información-->
        <div class="features">
            <h2 class="titulo-med"><center>TE ASEGURAMOS</center></h2>
            <hr width="100%" style="background:rgb(72, 153, 219); border:0; height:7px" />
            <div class="row">
                <div class="col-lg-4">
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/imgs/6.png" alt="Generic placeholder image" width="140" height="140">
                    <h3 class="titulo-med">MEJOR PRECIO</h3>


                </div>
                <div class="col-lg-4">
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/imgs/7.png" alt="Generic placeholder image" width="140" height="140">
                    <h3 class="titulo-med">SIN DRM</h3>


                </div>
                <div class="col-lg-4">
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/imgs/8.png" alt="Generic placeholder image" width="140" height="140">
                    <h3 class="titulo-med">SEGURIDAD</h3>


                </div>
            </div>
            <hr width="100%" style="background:rgb(72, 153, 219); border:0; height:7px" />
        </div>
















        <div class="container-fluid">
            <div class="mas-vendidos">
                <div class="row">
                    <div class="col-xs-12 col-md-12">

                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <!--Sección de más vendidos-->
                        <h4 class="titulo ter">
                            <center>LOS MÁS VENDIDOS</center>
                        </h4>
                        <hr width="85%" style="background:rgb(255,255,255); border:0; height:7px" />



                    </div>
                </div>




                <div class="row">
                    <div class="col-xs-1 col-md-1"></div>
                    <c:forEach var="m"  items="${masVendidos}">

                        <div class="col-xs-2 col-md-2">
                            <div class="card card-outline-primary text-center ">



                                <img class="card-img-top" src="${pageContext.request.contextPath}/imgs/juego${m.videojuegoID}.png" width="300" height="250" alt="Card image cap">
                                <div class="card-block" style="color: black;">
                                    <h5 class="card-title">${m.nombreVideojuego}</h5>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Desarrollador: ${m.desarrollador}</li>
                                        <li class="list-group-item">Publicador: ${m.publicador}</li>

                                    </ul>
                                    <div class="card-footer text-muted ">
                                        <span class="badge badge-success">${m.precio}</span>
                                        <a href="${srvUrl}/juego?id=${m.videojuegoID}" class="btn btn-primary">Ver juego</a>
                                    </div>



                                </div>
                            </div>

                        </div>

                    </c:forEach>

                    <div class="col-xs-1 col-md-1"></div>
                </div>
            </div>
        </div>



        <!--Hasta aquí sección de más vendidos-->








        <!--Sección de más vendidos-->
        <div class="container-fluid">
            <div class="proximos-lanzamientos">
                <div class="row">
                    <div class="col-xs-12 col-md-12">

                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <h4 class="titulo ter">
                            <center>PROXIMOS LANZAMIENTOS</center>
                        </h4>
                        <hr width="85%" style="background:rgb(255,255,255); border:0; height:7px" />



                    </div>
                </div>

                <!--Hast aqui titulo-->


                <div class="row">



                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-2 col-md-2">
                        <div class="card card-outline-primary mb-3 text-center">



                            <img class="card-img-top" src="http://placehold.it/400x300" alt="Card image cap">
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper interdum commodo. Morbi
                                    molestie, ligula ut max imus accumsan, arcu leo imperdiet nisl, vel imperdiet lorem mauris

                                </p>
                            </div>
                        </div>

                    </div>




                </div>


            </div>
        </div>







    </body>

    <!--footer-->

    <%@include file="/WEB-INF/layout/footer.jspf" %>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

</html>
