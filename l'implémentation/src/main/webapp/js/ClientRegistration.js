 let constraintObj = { 
    audio: false, 
    video: { 
        facingMode: "user", 
        width: { min: 640, ideal: 1280, max: 1920 },
        height: { min: 480, ideal: 720, max: 1080 } 
    } 
}; 
// width: 1280, height: 720  -- preference only
// facingMode: {exact: "user"}
// facingMode: "environment"

//handle older browsers that might implement getUserMedia in some way
if (navigator.mediaDevices === undefined) {
    navigator.mediaDevices = {};
    navigator.mediaDevices.getUserMedia = function(constraintObj) {
        let getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
        if (!getUserMedia) {
            return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
        }
        return new Promise(function(resolve, reject) {
            getUserMedia.call(navigator, constraintObj, resolve, reject);
        });
    }
}else{
    navigator.mediaDevices.enumerateDevices()
    .then(devices => {
        devices.forEach(device=>{
            console.log(device.kind.toUpperCase(), device.label);
            //, device.deviceId
        })
    })
    .catch(err=>{
        console.log(err.name, err.message);
    })
}
function UpdateTimer(element){
	if(element.innerHTML>0){
		element.innerHTML = element.innerHTML - 1;
	}
}
navigator.mediaDevices.getUserMedia(constraintObj)
.then(function(mediaStreamObj) {
    //connect the media stream to the first video element
    let video = document.querySelector('video');
	video.srcObject = mediaStreamObj;
    if ("srcObject" in video) {
        video.srcObject = mediaStreamObj;
    } else {
        //old version
        video.src = window.URL.createObjectURL(mediaStreamObj);
    }
    
    video.onloadedmetadata = function(ev) {
        //show in the video element what is being captured by the webcam
        video.play();
    };
    
    //add listeners for saving video/audio
    let start = document.getElementById('btnStart');
    let stop = document.getElementById('btnStop');
    let vidSave = document.getElementById('vid2');
    let mediaRecorder = new MediaRecorder(mediaStreamObj);
    let chunks = [];
    
    start.addEventListener('click', (ev)=>{
        mediaRecorder.start();
		start.style.display="none";
		stop.style.display="block";
		counter = 5;
		var videoTimer = setInterval(function(){
			if(document.querySelector(".counter").innerHTML>0){
				document.querySelector(".counter").innerHTML = document.querySelector(".counter").innerHTML - 1;
			}else{
				clearInterval(videoTimer);
				start.style.display="none";
				stop.style.display="none";
				document.querySelector("#Next").style.display="block";
				mediaRecorder.stop();
        		console.log(mediaRecorder.state);
			}
		},1000);
        console.log(mediaRecorder.state);
    })
    stop.addEventListener('click', (ev)=>{
        mediaRecorder.stop();
        console.log(mediaRecorder.state);
    });
    mediaRecorder.ondataavailable = function(ev) {
        chunks.push(ev.data);
    }
    mediaRecorder.onstop = (ev)=>{
        let blob = new Blob(chunks, { 'type' : 'video/mp4;' });
		let xhr = new XMLHttpRequest();
		var fd = new FormData();
		fd.append('file', blob);
		fd.append("required_action",'addVideoToFaceRecognition');
		xhr.onload = ()=>{
			if(xhr.status == 200){
				let http = new XMLHttpRequest();
				http.onload = ()=>{
					document.querySelector("#next").style.display="block";	
				}
				http.open("GET","http://127.0.0.1:5000/CreateClientProfile/"+ document.querySelector("#email").value);
				http.send();
			}
		}
		xhr.open("Post","ClientRegistration");
		xhr.send(fd);
		console.log(blob);
        chunks = [];
        let videoURL = window.URL.createObjectURL(blob);
        vidSave.src = videoURL;
    }
})
.catch(function(err) { 
    console.log(err.name, err.message); 
});
