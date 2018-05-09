<%-- 
    Document   : registrar
    Created on : 25-abr-2018, 13:17:13
    Author     : jabm9
--%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="/WEB-INF/layout/head_links.jspf" %>
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/bootstrap.css'/>">
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/index.css'/>">

    </head>
    <body>

        <!--Barra de navegación -->
        <div class="barra-navegacion">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

                <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand">
                    <img src="${pageContext.request.contextPath}/imgs/3.png" height="40" widht="30">
                </a>



                <div class="collapse navbar-collapse justify-content-end" id="collapse_target">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href='${srvUrl}/tienda'>Log In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#footer">Contacto</a>
                        </li>

                    </ul>
                </div>

            </nav>

        </div>


        <!--Login y registro -->

        <div class="row">
            <div class="col-xs-4 col-md-4"></div>
            <div class="col-xs-4 col-md-4">

                <div class="columna registro">
                    <h1 class="page-header">Regístrate</h1>
                    <form:form  modelAttribute="cliente" class="form-horizontal" role="form" action="${srvUrl}/registrar" method="POST">
                        <div class="form-group">
                            <i class="fas fa-envelope-square"></i>
                            <form:label path="correo" class="control-label col-sm-2" >Email:</form:label>
                                <div class="col-sm-10">
                                <form:input path="correo" type="email" class="form-control" name="reg_email" placeholder="Introduce tu email"/>
                                <form:errors path="correo" cssStyle="color: rgb(18, 119, 9);"/>
                            </div>

                        </div>
                        <div class="form-group">
                            <i class="fas fa-user"></i>
                            <form:label path="nombre" class="control-label col-sm-2" >Usuario:</form:label>
                                <div class="col-sm-10">
                                <form:input path="nombre" type="text" class="form-control" name="reg_usuario"  placeholder="Introduce tu nombre"/>
                                <form:errors path="nombre" cssStyle="color: rgb(18, 119, 9);"/>
     
                            </div>

                        </div>
                        <div class="form-group">
                            <i class="fas fa-key"></i>
                            <form:label path="pwd" class="control-label col-sm-2" >Contraseña:</form:label>
                                <div class="col-sm-10">
                                <form:input path="pwd" type="password" class="form-control" name="reg_pwd" placeholder="Introduce tu contraseña"/>
                                <form:errors path="pwd" cssStyle="color: rgb(18, 119, 9);"/>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="registrarme" class="btn btn-outline-secondary">Registrarme</button>
                            </div>
                        </div>


                    </form:form>
                    <!--Error debido a que el usuario ya existe-->
                    <form:errors path="correo.*" cssClass="text-danger" element="div" />


                </div>

            </div>


            <div class="col-xs-4 col-md-4"></div>

        </div>


        <!--Formularios hasta aquí-->





        <hr width="85%" style="background: rgb(18, 119, 9); border:0; height:7px" />



        <!--Sección de información -->

        <div class="row ">

            <div class="col-md-1"></div>
            <div class="col-md-3 col-abajo" id=borde-der>

                <img src="${pageContext.request.contextPath}/imgs/2.png" width="300" height="250">

                <h1>Juega</h1>


                <p>Disfruta de tus juegos favoritos</p>
            </div>

            <div class="col-md-1"></div>
            <div class="col-md-3 col-abajo justify-content-around" id=borde-der>

                <img src="${pageContext.request.contextPath}/imgs/4.jpg" width="250" height="250">
                <h1>Comunidad</h1>
                <p>Agrega a tus amigos y juega junto a ellos</p>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3 col-abajo justify-content-around">
                <img src="${pageContext.request.contextPath}/imgs/5.png" width="250" height="250">
                <h1>Busca</h1>
                <p>Encuentra tus juegos favoritos en un amplio catálogo</p>
            </div>


        </div>




        <!--Footer -->



    </body>



    <%@include file="/WEB-INF/layout/footer.jspf" %>



</html>



