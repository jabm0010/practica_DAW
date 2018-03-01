<%-- 
    Document   : buscaJuegos
    Created on : 01-mar-2018, 20:49:41
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

    <div class="row">
      <div class="col-md-6">
        <h1>Juegos con "${param.log_usuario}"</h1>

      </div>  
      <div class="col-md-6">
         <h1>Usuarios con "${param.busca}"</h1>

      </div>  


    </div>


    <%@include file="/WEB-INF/layout/footer.jspf" %>

  </body>
</html>
