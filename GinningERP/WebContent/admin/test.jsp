
  <div class="select" >
    <label for="videoSource">Video source: </label><select id="videoSource"></select>
  </div>
<div class="select" >
    <input type="text" id="cameraInput1">
    <input type="text" id="cameraInput2">
  </div>
  <video id='video1' autoplay muted playsinline></video>
   <video id='video2' autoplay muted playsinline></video>              
  
  
     <canvas id="canvas1" width="213" height="160"  name="ImageFile1" style="display: none;"></canvas>
       <img id="canvasImg1" name="ImageFile"><img>
       <input type="hidden" name="ImageData" id="ImageData1" >
						        
     <canvas id="canvas2" width="213" height="160"  name="ImageFile1" style="display: none;"></canvas>
     <img id="canvasImg2" name="ImageFile"><img>
     <input type="hidden" name="ImageData" id="ImageData2" >
     
     <button type="button" id='front'>Front</button>
     <button type="button" id='back'>back</button>
<script>

var videoElement1 = document.querySelector('video#video1');
var videoElement2 = document.querySelector('video#video2');
var videoSelect = document.querySelector('select#videoSource');

var promise = navigator.mediaDevices.enumerateDevices();

console.log(promise);

/*for (const deviceInfo of deviceInfos) {
     
    if (deviceInfo.kind === 'videoinput') {
     condole.log(deviceInfo.deviceId)
    }
  }*/


/* videoSelect.onchange = getStream;

getStream().then(getDevices).then(gotDevices);

function getDevices() {
  // AFAICT in Safari this only gets default devices until gUM is called :/
  return navigator.mediaDevices.enumerateDevices();
}



function gotDevices(deviceInfos) {
  window.deviceInfos = deviceInfos; // make available to console
  console.log('Available input and output devices:', deviceInfos);
  
  for (const deviceInfo of deviceInfos) {
    const option = document.createElement('option');
    option.value = deviceInfo.deviceId;
     
    if (deviceInfo.kind === 'videoinput') {
      option.text = deviceInfo.label || `Camera ${videoSelect.length + 1}`;
      videoSelect.appendChild(option);
      document.getElementById("cameraInput1").value = deviceInfo.label || `Camera ${videoSelect.length + 1}`;
      document.getElementById("cameraInput2").value = deviceInfo.label || `Camera ${videoSelect.length + 2}`;
      
    }
  }
}

function getStream() {
  if (window.stream) {
    window.stream.getTracks().forEach(track => {
      track.stop();
    });
  }
  const videoSource1 = videoSelect.value;
  //const videoSource2 = videoSelect.options[1].value;
  
  const constraints = {
    video: {deviceId: videoSource1 ? {exact: videoSource} : undefined},
    //****************
   // video1: {deviceId: videoSource ? {exact: videoSource1} : undefined},
  };
  return navigator.mediaDevices.getUserMedia(constraints).
    then(gotStream).catch(handleError);
}

function gotStream(stream) {
  window.stream = stream; // make stream available to console
  videoSelect.selectedIndex = [...videoSelect.options].
    findIndex(option => option.text === stream.getVideoTracks()[0].label);
  videoElement1.srcObject = stream;
  videoElement2.srcObject = stream;
}

function handleError(error) {
  console.error('Error: ', error);
}

//***************************************************************************************************
var dataUrl="";
var video = document.getElementById("video");

var canvas1 = document.getElementById("canvas1"),
context1 = canvas1.getContext("2d")


var canvas2 = document.getElementById("canvas2"),
context2 = canvas2.getContext("2d")

document.getElementById("front").addEventListener("click", function () {
    context1.drawImage(video, 0, 0, 213, 160);
    document.getElementById('canvasImg1').src = canvas1.toDataURL("image/png");
    dataUrl = canvas1.toDataURL();
    //document.getElementById('video').style.display = "none";  // hide the live image video portin after click on take picture
});
document.getElementById("back").addEventListener("click", function () {
    context2.drawImage(video, 0, 0, 213, 160);
    document.getElementById('canvasImg2').src = canvas2.toDataURL("image/png");
    dataUrl = canvas2.toDataURL();
    //document.getElementById('video').style.display = "none";  // hide the live image video portin after click on take picture
});
 */</script>