<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="stuff, to, help, search, engines, not" name="keywords">
  <meta content="What this page is about." name="description">
  <meta content="Display Webcam Stream" name="title">
  <title>Display Webcam Stream</title>
  
  <style>
    #container {
      margin: 0px auto;
      width: 500px;
      height: 375px;
      border: 10px #333 solid;
    }
    #videoElement {
      width: 500px;
      height: 375px;
      background-color: #666;
    }
    #container2 {
      margin: 0px auto;
      width: 500px;
      height: 375px;
      border: 10px #333 solid;
    }
    #videoElement2 {
      width: 500px;
      height: 375px;
      background-color: #666;
    }
  </style>
</head>

<body style="">
  <div id="container">
    
    <video autoplay id="videoElement">
      
    </video>
  </div>

 <div id="container2">
    
    <video autoplay id="videoElement2">
      
    </video>
  </div>

  <script>
  
  var video = document.querySelector("#videoElement");
  var firstWebcam;
  navigator.mediaDevices.enumerateDevices()
  .then(function(devices){
		for(i=0;i<devices.length;i++){
			var camera = devices[i];
			if(camera.kind  == "videoinput" && camera.deviceId == "b0ce15c0c705f2ec644690487f819ff3a9a23f83a3508091e9607af147a111e3"){
				firstWebcam = camera.deviceId;
				console.log("inside if");
				var constraints = { deviceId: { exact: camera.deviceId } };
				obj = navigator.mediaDevices.getUserMedia({ video: constraints });
				break;
			}
		}
		 return obj;
 	 }
 ) 
 .then(stream => video.srcObject = stream)
 .catch(e => console.error(e))

  
  var video2 = document.querySelector("#videoElement2");
  navigator.mediaDevices.enumerateDevices()
  .then(function(devices){
		for(i=0;i<devices.length;i++){
			var camera = devices[i];
			if(camera.kind  == "videoinput" && camera.deviceId == "ce03194cf9b47af834779e4a366403a346d1c1f9254f52591029d9d87dd86b8b"){
				console.log(camera);
				var constraints = { deviceId: { exact: camera.deviceId } };
				obj = navigator.mediaDevices.getUserMedia({ video: constraints });
				break;
			}
		}
		 return obj;
 	 }
 )  
 .then(stream => video2.srcObject = stream)
 .catch(e => console.error(e))

  
  </script>
</body>

</html>