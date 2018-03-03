<%-- 
    Document   : tienda
    Created on : 28-feb-2018, 10:40:03
    Author     : Juan Béjar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


  <head>
    <title>Tienda</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/WEB-INF/layout/head_links.jspf" %>

    <link rel="stylesheet" href="css/tienda.css">

  </head>

  <body>

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
                <img class="d-block w-100" src="http://placehold.it/800x600" alt="First slide" class="rounded">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="http://placehold.it/800x600" alt="Second slide" class="rounded">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="http://placehold.it/800x600" alt="Third slide" class="rounded">
              </div>
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
          <h4 class="titulo sec">
            <center>OFERTAS SEMANALES</center>
          </h4>
          <hr width="85%" style="background:rgb(18, 119, 9); border:0; height:7px" />
          <div class="list-group">

            <a href="#" class="list-group-item">
              <div class="media col-md-4">

                <img class="media-object img-rounded img-responsive" src="http://placehold.it/370x200" alt="placehold.it/350x250" >



              </div>

            </a>

            <a href="#" class="list-group-item">
              <div class="media col-md-4">

                <img class="media-object img-rounded img-responsive " src="http://placehold.it/370x200" alt="placehold.it/350x250">



              </div>

            </a>

            <a href="#" class="list-group-item">
              <div class="media col-md-4 ">

                <img class="media-object img-rounded img-responsive " src="http://placehold.it/370x200" alt="placehold.it/350x250">



              </div>

            </a>




          </div>

        </div>
        <div class="col-xs-1 col-md-1"></div>

      </div>




      <!--Hasta aquí las filas con los titulos y las ofertas destacadas y semanales-->
      <!--Intentar luego hacerlas en una sola fila para que no se descoloquen en tamaño movil-->






    </div>

  </table>


  <div class="features">
    <h2 class="titulo-med"><center>TE ASEGURAMOS</center></h2>
    <hr width="100%" style="background:rgb(72, 153, 219); border:0; height:7px" />
    <div class="row">
      <div class="col-lg-4">
        <img class="rounded-circle" src="imgs/6.png" alt="Generic placeholder image" width="140" height="140">
        <h3 class="titulo-med">MEJOR PRECIO</h3>


      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="imgs/7.png" alt="Generic placeholder image" width="140" height="140">
        <h3 class="titulo-med">SIN DRM</h3>


      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="rounded-circle" src="imgs/8.png" alt="Generic placeholder image" width="140" height="140">
        <h3 class="titulo-med">SEGURIDAD</h3>


      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
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
          <h4 class="titulo ter">
            <center>LOS MÁS VENDIDOS</center>
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



  <!--Hasta aquí sección de más vendidos-->









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





  <%@include file="/WEB-INF/layout/footer.jspf" %>



</body>

</html>
