
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenida</title>
        <link rel="stylesheet" type="text/css"  href="<c:url value='/css/indice.css'/>">
    </head>
    <body>

        <section class="intro">
            <div class="inner">
                <div class="content">
                    <h1> Hasta pronto</h1>
                    <br>
                    <a class="btn bienvenida" href="${srvUrl}/tienda">Volver a entrar</a>
                    <a class="btn bienvenida" href="${srvUrl}/registrar">Quiero registrarme</a>

                </div>
            </div>


        </section>

    </body>

</html>
