<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : index
    Created on : 28-feb-2018, 10:11:35
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Bienvenido</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%@include file="/WEB-INF/layout/head_links.jspf" %>

        <link rel="stylesheet" href="css/index.css">

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
                            <a class="nav-link" href="#footer">Contacto</a>
                        </li>

                    </ul>
                </div>

            </nav>

        </div>


        <!--Barra de navegación hasta aquí-->

        <div class="row">
            <div class="col-xs-2 col-md-2"></div>
            <div class="col-xs-8 col-md-8">
                <div class="row ">
                    <div class="col-xs-4 col-md-6 ">
                        <div class="columna-izquierda">

                            <h1 class="page-header">Identifícate</h1>

                            <form class="form-horizontal" role="form" action="index.jsp" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="log_usuario">Usuario:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="log_usuario" placeholder="Introduce tu nombre">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="log_pwd">Contraseña:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="log_pwd" placeholder="Introduce tu contraseña">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Recuérdame</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" name="acceder" class="btn btn-default">Acceder</button>
                                    </div>
                                </div>
                            </form>
                            
                           

                            <!--Si el formulario se envía, mostrar posibles errores-->



                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('acceder')!=null}">
                                    <c:if test="${pageContext.request.getParameter('log_usuario')==''}">
                                        Introduce tu nombre de usuario <br> 
                                    </c:if>
                                </c:if>
                            </c:if>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('acceder')!=null}">
                                    <c:if test="${pageContext.request.getParameter('log_pwd')==''}">
                                        Introduce tu contraseña
                                    </c:if>
                                </c:if>

                            </c:if>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('acceder')!=null}">
                                    <c:if test="${pageContext.request.getParameter('log_usuario')!=''}">
                                        <c:if test="${pageContext.request.getParameter('log_pwd')!=''}">
                                            <c:redirect url="comunidad.jsp?log_usuario=${param.log_usuario}"/>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:if>       






                        </div>
                    </div>




                    <div class="col-xs-4 col-md-6 ">

                        <div class="columna-derecha">
                            <h1 class="page-header">Regístrate</h1>

                            <form class="form-horizontal" role="form" action="index.jsp" method="POST">
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="reg_email">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" name="reg_email" placeholder="Introduce tu email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="reg_usuario">Usuario:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="reg_usuario" placeholder="Introduce tu nombre">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="reg_pwd">Contraseña:</label>
                                    <div class="col-sm-10">
                                        
                                        <input type="password" class="form-control" name="reg_pwd" placeholder="Introduce tu contraseña">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" name="registrarme" class="btn btn-default">Registrarme</button>
                                    </div>
                                </div>
                            </form>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('registrarme')!=null}">
                                    <c:if test="${pageContext.request.getParameter('reg_email')==''}">
                                        Introduce tu email <br>
                                    </c:if>
                                </c:if>
                            </c:if>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('registrarme')!=null}">
                                    <c:if test="${pageContext.request.getParameter('reg_usuario')==''}">
                                        Introduce tu nombre de usuario <br>
                                    </c:if>
                                </c:if>
                            </c:if>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('registrarme')!=null}">
                                    <c:if test="${pageContext.request.getParameter('reg_pwd')==''}">
                                        Introduce tu contraseña
                                    </c:if>
                                </c:if>
                            </c:if>

                            <c:if test="${pageContext.request.method=='POST'}">
                                <c:if test="${pageContext.request.getParameter('registrarme')!=null}">
                                    <c:if test="${pageContext.request.getParameter('reg_pwd')!=''}">
                                        <c:if test="${pageContext.request.getParameter('reg_usuario')!=''}">
                                            <c:if test="${pageContext.request.getParameter('reg_email')!=''}">
                                                <c:redirect url="comunidad.jsp?log_usuario=${param.reg_usuario}"/>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:if>    

                        </div>
                    </div>

                </div>







            </div>


            <div class="col-xs-2 col-md-2"></div>

        </div>


        <!--Formularios hasta aquí-->





        <hr width="85%" style="background:rgb(65, 23, 122); border:0; height:7px" />





        <div class="row ">


            <div class="col-md-4 justify-content-around" id=borde-der>
                <img src="imgs/2.png" width="250" height="250">

                <h1>Lore ipsum</h1>
                <p>Sumo appellantur ius ad. Error vitae ridens ea q</p>
            </div>

            <div class="col-md-4 justify-content-around" id=borde-der>
                <img src="imgs/4.jpg" width="250" height="250">
                <h1>Lore ipsum</h1>
                <p>Sumo appellantur ius ad. Error vitae ridens ea q</p>
            </div>
            <div class="col-md-4 justify-content-around">
                <img src="imgs/5.png" width="250" height="250">
                <h1>Lore ipsum</h1>
                <p>Sumo appellantur ius ad. Error vitae ridens ea q</p>
            </div>


        </div>



        <!--Fila de debajo con información adicional hasta aquí-->




        <%@include file="/WEB-INF/layout/footer.jspf" %>




    </body>

</html>