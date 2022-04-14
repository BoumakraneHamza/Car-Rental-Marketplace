const minimize = document.querySelector("#minimize");
const form = document.querySelector(".Send-message-form-content");
const closeBtn = document.querySelector("#close");
const sendMessage = document.querySelector(".send-message-form");
const input1 = sendMessage.querySelector("#destination");
const input2 = sendMessage.querySelector("#title");
const inputSend = sendMessage.querySelector("#send");
const textArea = sendMessage.querySelector("#content");
const filter = sendMessage.querySelector("#filter");
minimize.addEventListener("click",function(){
	if(form.style.display != "none"){
		form.style.display="none";
	}else{
		form.style.display="flex";
	}
});
function closeSendingMessage(){
	sendMessage.style.display="none";
	input1.value=null;
	input2.value=null;
	textArea.value=null;
}
closeBtn.addEventListener("click",function(){
	closeSendingMessage();
});

inputSend.addEventListener("click",function(e){
	e.preventDefault();
	const destValue = input1.value;
	console.log(destValue);
	const titleValue = input2.value;
	const contentValue= textArea.value;
	const tagValue= filter.value;
	
	let xhr = new XMLHttpRequest();
	xhr.onload = function() {
		 if(xhr.status === 200) {                       
       		$(".inbox-list").load("Inbox #email");
			closeSendingMessage();
    	}
	}
	xhr.open("POST","SendMessage?destination="+destValue+"&title="+titleValue+"&content="+contentValue+"&tag="+tagValue);
	xhr.send();
});