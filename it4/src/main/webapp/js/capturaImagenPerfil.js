/* 
 Archivo javascript en el que se introducen algunas de las funcionalidades expuestas en el trabajo dirigido
 */



var camera = document.getElementById('camera');
var frame = document.getElementById('frame');


//Obtención de una foto desde el propio explorador de archivos
camera.addEventListener('change', function (e) {
    var file = e.target.files[0];
    //Asociamos la imagen con la variable frame
    frame.src = URL.createObjectURL(file);

});

