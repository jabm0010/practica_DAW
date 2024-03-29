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

                <div class="col-md-4">
                    <!--Sección de perfil personal -->
                    <h2 class="titulo">
                        MI PERFIL
                    </h2>
                    <hr width="80%" style="background:rgb(72, 153, 219); border:0; height:7px" />
                    <div class="card  mi-perfil " style="width: 25rem;">
                        <img class="round card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> ${cliente.nombre}</h5>
                            <p class="card-text">${cliente.biografia}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Número de juegos: </li>
                            <li class="list-group-item">Número de amigos: ${fn:length(cliente.amigos)} </li>

                        </ul>
                        <div class="card-body">
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#configuracion-perfil">Configurar perfil</button>

                        </div>
                    </div>




                </div>

                <div class="col-md-7">

                    <!--Sección de amigos -->
                    <div class="row">
                        <h2 class="titulo"> MIS AMIGOS
                        </h2>
                        <hr width="90%" style="background:rgb(231, 214, 54); border:0; height:7px" />


                        <!--En caso de que amigos esté vaciío-->
                        <c:if test="${fn:length(cliente.amigos) < 1}">

                            <h3>Todavía no tienes a ningún amigo agregado</h3>

                        </c:if>


                        <div class="card-deck">

                            <c:forEach var="c" items="${cliente.amigos}">


                                <c:set var="qry" value="?id=${c.id}"/>

                                <div class="card">
                                    <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">${c.nombre}</h5>
                                        <p class="card-text">${c.biografia}</p>

                                        <div class="btn-group mr-2" role="group" aria-label="First group">

                                            <button type="button" class="btn btn-info">Enviar mensaje</button>
                                            
                                            <div class="boton-der">
                                            <form role="form" action='${srvUrl}/borraramigo?id=${c.id}' method="POST">
                                                <button type="submit" class="btn btn-danger" >Borrar amigo</button>
                                            </form>
                                            </div>
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

                            </c:forEach>



                        </div>

                    </div>

                </div>

            </div>







            <!--Modal para mostrar confiuración de perfil-->     



            <div class="modal fade" id="configuracion-perfil" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Configuración del perfil</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form:form class="form-horizontal" modelAttribute="cliente" role="form" action="${srvUrl}/modificarperfil" method="POST" >

                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="user">Nombre de usuario: </label>
                                    <form:input path="nombre" type="text" class="form-control" name="user" value='${cliente.nombre}'/>
                                    <p><form:errors path="nombre" cssStyle="color: red;"/></p>
                                </div>

                                <div class="form-group">
                                    <label for="new-pwd">Nueva contraseña:</label>
                                    <form:input path="pwd" type="text" class="form-control" name="new-pwd" />
                                    <p><form:errors path="pwd" cssStyle="color: red;"/></p>
                                </div>

                                <div class="form-group">
                                    <label for="biografia">Biografía:</label>
                                    <form:input path="biografia" type="text" class="form-control" name="biografia" value='${cliente.biografia}'/>
                                    <p><form:errors path="biografia" cssStyle="color: red;"/></p>
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

        </div>








    </body>

    <!--Foooter -->
    <%@include file="/WEB-INF/layout/footer.jspf" %>

</html>