/* 
 * 
 */


var player = document.getElementById('player');
var snapshotCanvas = document.getElementById('snapshot');
var captureButton = document.getElementById('capture');
var videoTracks;

//Obtener una foto a través de la webcam
var handleSuccess = function (stream) {
    player.srcObject = stream;
    videoTracks = stream.getVideoTracks();
};

captureButton.addEventListener('click', function () {
    var context = snapshot.getContext('2d');
    // Guarda la captura del video en el objeto Canvas
    context.drawImage(player, 0, 0, snapshotCanvas.width,
            snapshotCanvas.height);

    videoTracks.forEach(function (track) {
        track.stop()
    });
});

navigator.mediaDevices.getUserMedia({video: true})
        .then(handleSuccess);

