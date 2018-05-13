<%-- 
    Document   : comunidad
    Created on : 28-feb-2018, 10:50:21
    Author     : Juan Béjar
--%>

<%--
    Página comunidad, donde un usuario podrá ver su perfil y sus amigos. Si se pulsa en el botón de Modificar Perfil aparecerá un modal 
    para modificar los datos del usuario, aunque de momento solo es visual.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Comunidad</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <%@include file="/WEB-INF/layout/head_links.jspf" %>
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/comunidad.css'/>">

    </head>


    <!--Barra de navegación -->
    <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>
    <body>


        <div class="container-fluid">
            <div class="row fila-buffer">

                <div class="col-xl-4">
                    <!--Sección de perfil personal -->
                    <h2 class="titulo">
                        MI PERFIL
                    </h2>
                    <hr width="100%" style="background:rgb(72, 153, 219); border:0; height:7px" />
                    <div class="card  mi-perfil " id="usuario" c-actual='${cliente.id}' style="width: 25rem;">
                        <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" id="frame" height="400" alt="Imagen de perfil">
                        <!-- <canvas id="snapshot" width=320 height=500></canvas> -->
                        <div  class="card-body">
                            <h5 class="card-title"> ${cliente.nombre}</h5>
                            <p class="card-text">${cliente.biografia}</p>
                            <div id="perfil" estado-actual="${cliente.online}"></div>
                            <p><div style="color: red;"> ${errorMod}  </div></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Número de juegos: ${fn:length(cliente.videojuegos)} </li>
                            <li class="list-group-item">Número de amigos: ${fn:length(cliente.amigos)} </li>

                        </ul>
                        <div class="card-body">
                            <button type="button" id="myBtn" class="btn btn-primary btn-lg">Configurar perfil</button>

                        </div>
                        <div class="image-upload">

                            <label for="camera">
                                <img src="https://bit.ly/2fSnitK" />

                            </label>

                            <input id="camera" type="file"  accept="image/*" />

                            <button type="button" class="btn-sm btn-info btn-lg" data-toggle="modal" data-target="#transmisionWebcam">Utilizar Webcam</button>
                        </div>
                        <div class="card-block  justify-content-between align-items-center">                 
                            <button id='online'  type="button" class="btn btn-success btn-sm">Aparecer como online</button>
                            <button id='offline' type="button" class="btn btn-danger btn-sm">Aparecer como offline</button>
                        </div>

                    </div>




                </div>

                <div class="col-xl-7">
                    <h2 class="titulo"> MIS AMIGOS
                    </h2>
                    <hr width="100%" style="background:rgb(231, 214, 54); border:0; height:7px" />

                    <c:if test="${fn:length(cliente.amigos) < 1}">

                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">Oops..</h1>
                                <p class="lead"> Todavía no tienes agregado a ningún amigo...</p>
                            </div>
                        </div>

                    </c:if>

                    <!--Sección de amigos -->
                    <c:if test="${fn:length(cliente.amigos) != 0}">



                        <p><div style="color: red;">   ${errorAg} </div></p>

                        <div class="album py-5 bg-light">
                            <div class="container">

                                <div class="row">



                                    <c:forEach var="c" varStatus="i" items="${cliente.amigos}">

                                        <div class="col-md-4">
                                            <div class="card mb-4 box-shadow">
                                                <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Imagen usuario">
                                                <div class="card-body">
                                                    <h5 class="card-title">${c.nombre}</h5>
                                                    <p class="card-text">${c.biografia}</p>



                                                    <div class="d-flex justify-content-between" role="group" aria-label="First group">

                                                        <button type="button" class="btn btn-info btn-sm">Enviar mensaje</button>


                                                        <form role="form" action='${srvUrl}/borraramigo?id=${c.id}' method="POST">

                                                            <button type="submit" class="btn btn-danger btn-sm" >Borrar amigo</button>

                                                        </form>



                                                    </div>

                                                </div>
                                                <div class="card-footer">
                                                    <c:if test = "${c.online == false}" > 
                                                        <span class="badge badge-danger">Offline</span>
                                                    </c:if>
                                                    <c:if test = "${c.online == true}" > 
                                                        <span class="badge badge-success">Online</span>
                                                    </c:if>


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


    <!--Modal para mostrar confiuración de perfil-->     
    <div class="modal fade" id="edCliente" tabindex="-1" role="dialog" >
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Configuración del perfil</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form:form id="formPerfil" class="form-horizontal" modelAttribute="cliente" role="form" action="${srvUrl}/modificarperfil" validate="true" method="POST" >

                    <div class="modal-body">

                        <div class="form-group">
                            <form:label path="nombre" for="user">Nombre de usuario: </form:label>
                            <form:input path="nombre" id="nombre" type="text" class="form-control" name="user" value='${cliente.nombre}'/>
                            <p><form:errors path="nombre" cssStyle="color: red;"/></p>
                            <span id="errNombre" style="color: red;">${errNombre}</span>
                        </div>


                        <div class="form-group">
                            <form:label path="biografia" for="biografia">Biografía:</form:label>
                            <form:input path="biografia" id="biografia" type="text" class="form-control" name="biografia" value='${cliente.biografia}'/>
                            <p><form:errors path="biografia" cssStyle="color: red;"/></p>
                            <span id="errBiografia" style="color: red;">${errNombre}</span>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <button type="submit" class="btn btn-success" >Guardar</button>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
    </div>


    <!-- Modal para transmisión cámara-->

    <div class="modal fade" id="transmisionWebcam" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <video id="player" controls autoplay></video>
                <button class="btn btn-info" id="capture">Capturar</button>

            </div>
        </div>
    </div>




</body>


<!--Foooter -->
<%@include file="/WEB-INF/layout/footer.jspf" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<script src="<c:url value='/js/ClientesController.js'/>"></script>
<script src="<c:url value='/js/ValidarModificacionPerfil.js'/>"></script>
<script src="<c:url value='/js/capturaImagenperfil.js'/>"></script>
<script src="<c:url value='/js/capturaWebCamPerfil.js'/>"></script>

</html>