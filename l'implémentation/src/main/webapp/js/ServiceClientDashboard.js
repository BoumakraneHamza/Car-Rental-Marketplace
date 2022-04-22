const conversation_content = document.querySelector("#conversation-content"); 
const no_message = document.querySelector("#no-messages");
const response_done = document.querySelector("#response_done");
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
function loadMore(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			$(".request_list").load("ServiceClient #request");
		}
	}
	xhr.open("GET","ServiceClient");
	xhr.send();
}
function reply_message(element){
	const sendMessage = document.querySelector(".send-message-form");
	let conversation_id= element.parentNode.querySelector("#conversation_id").value;
	let email = element.parentNode.querySelector("#sender-email").value;
	let request_id_value = element.parentNode.querySelector("#request_id").value;
	const a_reply = sendMessage.querySelector("#a_reply");
	const request_id = sendMessage.querySelector("#request_id");
	const destination = sendMessage.querySelector("#destination");
	a_reply.value = conversation_id;
	request_id.value = request_id_value;
	destination.value = email;
	sendMessage.style.display="flex";
	
	const send_Btn = sendMessage.querySelector("#send");
	send_Btn.addEventListener("click",function(){
	var param = sendMessage.querySelector("#request_id").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			$(".request_list").load("ServiceClient #request");
			no_message.style.diplay="none";
			conversation_content.removeAttribute("style");
			conversation_content.style.display="none";
			response_done.style.display="flex";
			console.log(response_done);
		}
	}
	xhr.open("POST","ServiceClient");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("request_id="+param);
});
}
const ReadingField = document.querySelector(".email-content");
const Replies_list = document.querySelector(".email_replies_list");
function read(element){
	const conversation_id_value= element.querySelector("#conversation_id").value;
	const request_id_value = element.querySelector("#request_id").value;
	let xhr = new XMLHttpRequest();
	const tag = element.querySelector("#tag").innerHTML;
	const title = element.querySelector("#title").value;
	let count;
	let json
	clearChild(Replies_list);
	xhr.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
			let conversation_id = conversation_content.querySelector("#conversation_id");
			let request_id = conversation_content.querySelector("#request_id");
			conversation_id.value = conversation_id_value;
			console.log(conversation_id_value);
			console.log(conversation_id);
			request_id.value = request_id_value; 
			console.log(request_id_value);
			console.log(request_id);
			json = JSON.parse(this.responseText);            
			console.log(json);
			count = json.conversation.messages.length;
			console.log(count);
			no_message.style.display="none";
			response_done.style.display="none";
			conversation_content.style.display="block";
			for(var i=count-1;i>0;i--){
				const reply = document.createElement('div');
				reply.className ="reply";
				reply.setAttribute("onclick","expand(this)");
				const reply_source = document.createElement("div");
				reply_source.setAttribute("id","reply_source");
				const p_sender = document.createElement("p");
				p_sender.setAttribute("id","sender");
				p_sender.innerHTML = json.conversation.messages[i].sourceName;
				const reply_image = document.createElement("div");
				reply_image.setAttribute("id","source_image");
				const image = document.createElement("img");
				image.style.width="50px";
				let path = "/Atelier" + json.conversation.messages[i].sourceImage;
				image.setAttribute("src",path);
				reply_image.append(image);
				reply_source.append(reply_image);
				reply_source.append(p_sender);
				reply.append(reply_source);
				const text_demo = document.createElement("div");
				text_demo.setAttribute("id","text_demo");
				const text = document.createElement("p").innerHTML =json.conversation.messages[i].content;
				text_demo.append(text);
				reply.append(text_demo);
				const date = document.createElement("p");
				date.setAttribute("id","time");
				date.innerHTML=json.conversation.messages[i].time;
				reply.append(date);
				Replies_list.append(reply);
			}
			ReadingField.querySelector("#tag").innerHTML = tag;
			ReadingField.querySelector("#timer").innerHTML = json.conversation.messages[0].time;
			ReadingField.querySelector("#title").innerHTML = title;
			ReadingField.querySelector("#imageSrc").src = "/Atelier"+ json.conversation.messages[0].sourceImage;
			ReadingField.querySelector("#sender-user-name").innerHTML = json.conversation.messages[0].sourceName;
			ReadingField.querySelector("#sender-email").value = json.conversation.messages[0].source;
			ReadingField.querySelector("#email-time").innerHTML = json.conversation.messages[0].time;
			ReadingField.querySelector("#main-email-content-text").querySelector("#text").innerHTML = json.conversation.messages[0].content; 
    	}
	}
	xhr.open("GET","GetRequestInfo?id="+request_id_value);
	xhr.send();
}