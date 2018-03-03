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
    <title>Búsqueda</title>
    <%@include file="/WEB-INF/layout/head_links.jspf" %>


    <link rel="stylesheet" href="css/busqueda.css">
  </head>
  <body>
    <%@include file="/WEB-INF/layout/barra_navegacion.jspf" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">

          </br>
          </br>
          </br>
          </br>

          <h1 class="titulo"> Juegos con "${param.busca}"</h1>
          <hr width="60%" style="background:rgb(72, 153, 219); border:0; height:7px" />
          <div class="card-deck">
            <div class="card">
              <img class="card-img-top" src="http://placehold.it/512x512" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
              </div>
              <div class="card-footer">
                <form action="juego.jsp" method="get">
                  <button type="submit" class="btn btn-success">Ver</button>
                </form>

              </div>
            </div>
            <div class="card">
              <img class="card-img-top" src="http://placehold.it/512x512" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
              </div>
              <div class="card-footer">
                <form action="juego.jsp" method="get">
                  <button type="submit" class="btn btn-success">Ver</button>
                </form>
              </div>
            </div>
            <div class="card">
              <img class="card-img-top" src="http://placehold.it/512x512" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
              </div>
              <div class="card-footer">
                <form action="juego.jsp" method="get">
                  <button type="submit" class="btn btn-success">Ver</button>
                </form>

              </div>
            </div>
          </div>

        </div>  
        <div class="col-md-6">

          </br>
          </br>
          </br>
          </br>
          <h1 class="titulo">Usuarios con "${param.busca}"</h1>
          <hr width="60%" style="background:rgb(231, 214, 54); border:0; height:7px" />
          <div class="card-deck">
            <div class="card">
              <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>

              </div>
              <div class="card-footer">
                <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#notificacion-amistad">Enviar solicitud de amistad</button>

              </div>
            </div>
            <div class="card">
              <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>

              </div>
              <div class="card-footer">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#notificacion-amistad">Enviar solicitud de amistad</button>

              </div>
            </div>
            <div class="card">
              <img class="card-img-top" src="https://www.ocf.berkeley.edu/~dblab/blog/wp-content/uploads/2012/01/icon-profile.png" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>

              </div>
              <div class="card-footer">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#notificacion-amistad">Enviar solicitud de amistad</button>

              </div>
            </div>

          </div>  
        </div>

      </div>


    </div>



    <!--Modal para que muestre un mensaje confirmando que una solicitud de amistad se realizó correctamente-->     

    <div class="modal fade" id="notificacion-amistad" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Solicitud amistad</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Solicitud de amistad enviada correctamente
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">OK!</button>
          </div>
        </div>
      </div>
    </div>


  </body>












  <%@include file="/WEB-INF/layout/footer.jspf" %>       

</html>
