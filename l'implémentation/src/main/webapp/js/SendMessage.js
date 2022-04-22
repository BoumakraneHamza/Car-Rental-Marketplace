const minimize = document.querySelector("#minimize");
const form = document.querySelector(".Send-message-form-content");
const closeBtn = document.querySelector("#close");
const sendMessage = document.querySelector(".send-message-form");
const input1 = sendMessage.querySelector("#destination");
const input2 = sendMessage.querySelector("#title");
const inputSend = sendMessage.querySelector("#send");
const textArea = sendMessage.querySelector("#content");
const filter = sendMessage.querySelector("#filter");
const reply_conversation_id = sendMessage.querySelector("#a_reply");
minimize.addEventListener("click",function(){
	if(form.style.display != "none"){
		form.style.display="none";
	}else{
		form.style.display="flex";
	}
});
function closeSendingMessage(){
	sendMessage.style.display="none";
	if(input1){input1.value=null;}
	if(input2){input2.value=null;}
	if(textArea){textArea.value=null;}
}
closeBtn.addEventListener("click",function(){
	closeSendingMessage();
});

inputSend.addEventListener("click",function(e){
	e.preventDefault();
	let destValue = input1.value;
	let titleValue ;
	if(input2){
		titleValue = input2.value;
	}
	else{
		titleValue = null;
	}
	const contentValue= textArea.value;
	let tagValue;
	if (filter){
		tagValue = filter.value;
	}else{
		tagValue = null
	}
	let conv_id = 0;
	conv_id = reply_conversation_id.value;
	let xhr = new XMLHttpRequest();
	xhr.onload = function() {
		 if(xhr.status === 200) {                       
			closeSendingMessage();
			//update(conv_id);
    	}
	}
	if(conv_id>0){
		xhr.open("POST","SendMessage?destination="+destValue+"&title="+titleValue+"&content="+contentValue+"&tag="+tagValue+"&conversation_id="+conv_id);
	}
	else{
		xhr.open("POST","SendMessage?destination="+destValue+"&title="+titleValue+"&content="+contentValue+"&tag="+tagValue);
	}
	xhr.send();
});