function expand(element){
	element.classList.toggle("active");
}
function SendMessage(){
	const sendMessage = document.querySelector(".send-message-form");
	sendMessage.style.display="flex"
}
setInterval(function () {
        let xhr = new XMLHttpRequest();
		xhr.onload = function() {
			 if(xhr.status === 200) {                       
	       		$(".inbox-list").load("Inbox #email");
	    	}
		}
		xhr.open("GET","Inbox");
		xhr.send();
    },10000);
const ReadingField = document.querySelector(".email-content");
function read(element){
	const id= element.querySelector("#id").value;
	let xhr = new XMLHttpRequest();
	xhr.onload = function() {
		 if(xhr.status === 200) {                       
       		$(".inbox-list").load("Inbox #email");
    	}
	}
	xhr.open("POST","Inbox?id="+id);
	xhr.send();
	
	const tag = element.querySelector("#tag").innerHTML;
	const timer = element.querySelector("#time").innerHTML;
	const title = element.querySelector("#title").value;
	const image = element.querySelector("#imageSrc").src;
	const user_name = element.querySelector("#sender").innerHTML;
	const text = element.querySelector("#content").querySelector("#text").innerHTML;
	ReadingField.querySelector("#tag").innerHTML = tag;
	ReadingField.querySelector("#timer").innerHTML = timer;
	ReadingField.querySelector("#title").innerHTML = title;
	ReadingField.querySelector("#imageSrc").src = image;
	ReadingField.querySelector("#sender-user-name").innerHTML = user_name;
	ReadingField.querySelector("#email-time").innerHTML = timer;
	ReadingField.querySelector("#main-email-content-text").querySelector("#text").innerHTML = text; 
}