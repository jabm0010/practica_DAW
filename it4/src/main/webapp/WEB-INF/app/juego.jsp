<%-- 
    Document   : juego
    Created on : 03-mar-2018, 12:44:59
    Author     : Juan Béjar
--%>

<%--
    Página de juego, donde un usuario podrá procesar el pago de un juego que haya seleccionado en las otras vistas
--%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego</title>
        <%@include file="/WEB-INF/layout/head_links.jspf" %>
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/busqueda.css'/>">

    </head>

    <body>
        <!--Barra de navegación -->
        <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

        <div class="container-fluid">
            <div class="row fila-buffer">
                <div class="col-md-5">
                    <!--Información del juego -->
                    <h1 class="titulo">Juego</h1>
                    <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />
                    <div class="card  juego-compra " style="width: 25rem;">
                        <img class="round card-img-top" src="${pageContext.request.contextPath}/imgs/juego${videojuegoElegido.videojuegoID}.png"
                             alt="imagen videojuego"  height="500" width="500">
                        <div class="card-body">
                            <h5 class="card-title"> ${videojuegoElegido.nombreVideojuego}</h5>
                          
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Precio: <span class="badge badge-secondary">${videojuegoElegido.precio} €</span></li>
                            <li class="list-group-item">Desarrollador: ${videojuegoElegido.desarrollador}</li>
                            <li class="list-group-item">Publicador: ${videojuegoElegido.publicador}</li>

                        </ul>

                    </div>

                </div>

                <div class="col-md-7">

                    <!--Formulario de pago -->
                    <h1 class="titulo">Pago</h1>
                    <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />



                    <form:form modelAttribute="tarjeta" class="formulario-pago"  role="form" action="${srvUrl}/comprar?id=${videojuegoElegido.videojuegoID}" method="POST">
                        <div class="form-row">
                            <div class="form-group col-md-3"></div>
                            <div class="form-group col-md-6">
                                <form:label path="nombre" for="inputEmail">Titular de la tarjeta</form:label>
                                <form:input path="nombre" type="text" class="form-control" id="inputNombre" placeholder="Nombre"></form:input>
                                <form:errors path="nombre" cssStyle="color: rgb(72, 153, 219);"/>

                            </div>

                            <div class="form-group col-md-3"></div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-3"></div>
                            <div class="form-group col-md-6">
                                <div class="form-group">
                                    <form:label path="numeroTarjeta" for="inputDirección">Número de tarjeta</form:label>
                                    <form:input path="numeroTarjeta" type="text" class="form-control" id="inputAddress" placeholder="Número"></form:input>
                                    <form:errors path="numeroTarjeta" cssStyle="color: rgb(72, 153, 219);"/>

                                </div>
                            </div>
                            <div class="form-group col-md-3"></div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3"></div>
                            <div class="form-group col-md-4">
                                <label  for="inputTarjeta">Tarjeta Crédito<label>
                                        <select id="inputTarjeta" class="form-control">
                                            <option selected>Visa<option>
                                            <option>Mastercard<option>
                                            <option>Paypal<option>
                                            <select>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <form:label path="CVV" for="CCV">CVV</form:label>
                                                    <form:input path="CVV" type="text" class="form-control" id="inputCCV"></form:input>
                                                    <form:errors path="CVV" cssStyle="color: rgb(72, 153, 219);"/>

                                                </div>
                                                <div class="form-group col-md-2"></div>
                                                </div>


                                                <div class="form-row">
                                                    <div class="form-group col-md-3"></div>

                                                    <button type="submit"  class="btn btn-success">Comprar</button>

                                                    <!--<button type="submit" data-toggle="modal" data-target="#notificacion-compra" class="btn btn-success">Comprar</button>-->

                                                </div>

                                                <div class="form-row">
                                                    <div class="col-md-3"></div>
                                                    <p><div class="col-md-6" style="color: red;"> ${yaComprado}  </div></p>
                                                    <div class="col-md-3"></div>
                                                </div>
                                            </form:form>



                                            </div>




                                            </div>


                                            </div>



                                            <!--Modal para mostrar confirmación de compra de juego-->     

                                            <div class="modal fade" id="notificacion-compra" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Compra realizada</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            La compra se ha realizado correctamente. El juego será ahora añadido a tu biblioteca
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-success" data-dismiss="modal">OK!</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            </body>



                                            <!--Footer -->
                                            <%@include file="/WEB-INF/layout/footer.jspf" %>
                                            </html>
