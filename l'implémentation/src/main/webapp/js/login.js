
function hideNotification(){
	const notification = document.querySelector(".notification");
	notification.style.display="none";	
}
let xhr = new XMLHttpRequest();
xhr.onload = ()=>{
	if(xhr.status == 200){
		let json = JSON.parse(xhr.responseText);
		console.log(json);
	}	
}
xhr.open("GET"," http://127.0.0.1:5000/imageRecognition/118638161_301647434472196_8086933110366648042_n.jpg");
xhr.send();