$( document ).ready(function() {
		updateSentMessagesCounter();
});
function expand(element){
	element.classList.toggle("active");
}
function showMessageField(){
	const sendMessage = document.querySelector(".send-message-form");
	sendMessage.style.display="flex";
}
function reply_message(element){
	let id= element.parentNode.querySelector("#conversation_id").value;
	const sendMessage = document.querySelector(".send-message-form");
	const a_reply = sendMessage.querySelector("#a_reply");
	a_reply.value = id;
	console.log(a_reply.value);
	sendMessage.style.display="flex";
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
setInterval(function () {
        let xhr = new XMLHttpRequest();
		xhr.onload = function() {
			 if(xhr.status === 200) {                    
	    	}
		}
		xhr.open("GET","Inbox");
		xhr.send();
},10000);
function updateSentMessagesCounter(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		var json;
		if(this.readyState == 4 && this.status == 200){
			json = JSON.parse(this.responseText);
			console.log(json);
			const menu_list = document.querySelector("#menu_list");
			const sent= menu_list.querySelector("#sent");
			let element = sent.querySelector("#update")
			element.parentNode.removeChild(element);
			let update_counter = document.createElement("div");
			update_counter.setAttribute("id","update");
			const counter = document.createElement("p").innerHTML = json.NotReadMessages;
			update_counter.append(counter);
			sent.append(update_counter);	
		}
	}
	xhr.open("GET","getSentConversation");
	xhr.send();
}
function getSentMessages(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		var json;
		if(this.readyState == 4 && this.status == 200){
			json = JSON.parse(this.responseText);
			console.log(json);
			let counter = json.conversation.length;
			console.log(counter);
			for (let i=0 ;i<counter;i++){
				const email = document.createElement("div");
				email.setAttribute("id","email");
				if (json.conversation[i].not_read_count > 0){
					email.setAttribute("style","background:#fff");
				}
				email.setAttribute("onclick","read(this)");
				const image = document.createElement("div");
				image.setAttribute("id","image");
				const imagesrc=document.createElement("img");
				imagesrc.setAttribute("style","width:50px;");
				let path = "/Atelier"+json.conversation[i].messages[0].sourceImage;
				imagesrc.setAttribute("src", path);
				image.append(imagesrc);
				email.append(image);
				const email_content = document.createElement("div");
				email_content.setAttribute("id","email-content");
				const header = document.createElement("div");
				header.setAttribute("id","header");
				const inputConvId = document.createElement("input");
				inputConvId.setAttribute("id","id");
				inputConvId.setAttribute("type","hidden");
				inputConvId.setAttribute("value",json.conversation[i].id);
				header.append(inputConvId);
				const inputTitle = document.createElement("input");
				inputTitle.setAttribute("id","title");
				inputTitle.setAttribute("type","hidden");
				inputTitle.setAttribute("value",json.conversation[i].title);
				header.append(inputTitle);
				const sender = document.createElement("p");
				sender.setAttribute("id","sender");
				sender.innerHTML = json.conversation[i].messages[0].sourceName;
				header.append(sender);
				const time = document.createElement("p");
				time.setAttribute("id","time");
				time.innerHTML = json.conversation[i].last_updated;
				header.append(time);
				email_content.append(header);
				const content = document.createElement("div");
				content.setAttribute("id","content");
				const text = document.createElement("p");
				text.setAttribute("id","text");
				text.innerHTML = json.conversation[i].messages[0].content;
				content.append(text);
				email_content.append(content);
				const tags = document.createElement("div");
				tags.setAttribute("id","tags");
				const tag = document.createElement("p");
				tag.setAttribute("id","tag");
				tag.innerHTML = json.conversation[i].tags;
				tags.append(tag);
				if (json.conversation[i].not_read_count > 0){
					const status = document.createElement("div");
					status.setAttribute("id","status");
					const number = document.createElement("p");
					number.innerHTML = json.conversation[i].not_read_count;
					status.append(number);
					tags.append(status);
				}
				email_content.append(tags);
				email.append(email_content);
				const inbox_list = document.querySelector(".inbox-list");
				clearChild(inbox_list);
				inbox_list.append(email);
			}
		}
	}
	xhr.open("GET","getSentConversation");
	xhr.send();
}
const ReadingField = document.querySelector(".email-content");
const Replies_list = document.querySelector(".email_replies_list");
const conversation_content = document.querySelector("#conversation-content"); 
const no_message = document.querySelector("#no-messages");
function read(element){
	const id= element.querySelector("#id").value;
	let xhr = new XMLHttpRequest();
	let count;
	var json
	xhr.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {    
			json = JSON.parse(this.responseText);            
			console.log(json);
			getSentMessages();
			updateSentMessagesCounter();
			count = Object.keys(json).length;
			const tag = element.querySelector("#tag").innerHTML;
			const title = element.querySelector("#title").value;
			let conversation_id = conversation_content.querySelector("#conversation_id");
			let id=element.querySelector("#id").value;
			conversation_id.value = id
			conversation_content.style.display="block";
			no_message.style.display="none";
			clearChild(Replies_list);
			for(var i=count-1;i>0;i--){
				const reply = document.createElement('div');
				reply.className ="reply";
				reply.setAttribute("onclick","expand(this)");
				const reply_source = document.createElement("div");
				reply_source.setAttribute("id","reply_source");
				const p_sender = document.createElement("p");
				p_sender.setAttribute("id","sender");
				p_sender.innerHTML = json[i].sourceName;
				const reply_image = document.createElement("div");
				reply_image.setAttribute("id","source_image");
				const image = document.createElement("img");
				image.style.width="50px";
				let path = "/Atelier" + json[i].sourceImage;
				image.setAttribute("src",path);
				reply_image.append(image);
				reply_source.append(reply_image);
				reply_source.append(p_sender);
				reply.append(reply_source);
				const text_demo = document.createElement("div");
				text_demo.setAttribute("id","text_demo");
				const text = document.createElement("p").innerHTML =json[i].content;
				text_demo.append(text);
				reply.append(text_demo);
				const date = document.createElement("p");
				date.setAttribute("id","time");
				date.innerHTML=json[i].time;
				reply.append(date);
				Replies_list.append(reply);
			}
			
			ReadingField.querySelector("#tag").innerHTML = tag;
			ReadingField.querySelector("#timer").innerHTML = json[0].time;
			ReadingField.querySelector("#title").innerHTML = title;
			ReadingField.querySelector("#imageSrc").src = "/Atelier"+ json[0].sourceImage;
			ReadingField.querySelector("#sender-user-name").innerHTML = json[0].sourceName;
			ReadingField.querySelector("#email-time").innerHTML = json[0].time;
			ReadingField.querySelector("#main-email-content-text").querySelector("#text").innerHTML = json[0].content; 
    	}
	}
	xhr.open("POST","Inbox?id="+id+"&action=read");
	xhr.send();
}
/*function update(id){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
	  	if (this.readyState == 4 && this.status == 200) {  
			json = JSON.parse(this.responseText);            
       		$(".inbox-list").load("Inbox #email");
			$("#menu_list").load("Inbox #menu_list .tile");
			count = Object.keys(json).length;
			const tag = element.querySelector("#tag").innerHTML;
			const timer = json[count-1].time;
			const title = element.querySelector("#title").value;
			const image = json[0].sourceImage;
			const user_name = json[0].sourceName;
			const text = json[0].content;
			let conversation_id = conversation_content.querySelector("#conversation_id");
			let id=element.querySelector("#id").value;
			conversation_id.value = id
			conversation_content.style.display="block";
			no_message.style.display="none";
			clearChild(Replies_list);
			for(var i=0;i<count-1;i++){
				const reply = document.createElement('div');
				reply.className ="reply";
				reply.setAttribute("onclick","expand(this)");
				const reply_source = document.createElement("div");
				reply_source.setAttribute("id","reply_source");
				const p_sender = document.createElement("p");
				p_sender.setAttribute("id","sender");
				p_sender.innerHTML = json[i].sourceName;
				const reply_image = document.createElement("div");
				reply_image.setAttribute("id","source_image");
				const image = document.createElement("img");
				image.style.width="50px";
				let path = "/Atelier" + json[i].sourceImage;
				image.setAttribute("src",path);
				reply_image.append(image);
				reply_source.append(reply_image);
				reply_source.append(p_sender);
				reply.append(reply_source);
				const text_demo = document.createElement("div");
				text_demo.setAttribute("id","text_demo");
				const text = document.createElement("p").innerHTML =json[i].content;
				text_demo.append(text);
				reply.append(text_demo);
				const date = document.createElement("p");
				date.setAttribute("id","time");
				date.innerHTML=json[i].time;
				reply.append(date);
				Replies_list.append(reply);
			}
			
			ReadingField.querySelector("#tag").innerHTML = tag;
			ReadingField.querySelector("#timer").innerHTML = timer;
			ReadingField.querySelector("#title").innerHTML = title;
			ReadingField.querySelector("#imageSrc").src = "/Atelier"+ image;
			ReadingField.querySelector("#sender-user-name").innerHTML = user_name;
			ReadingField.querySelector("#email-time").innerHTML = timer;
			ReadingField.querySelector("#main-email-content-text").querySelector("#text").innerHTML = text; 
		}  
	}
	xhr.open("POST","Inbox?id="+id);
	xhr.send();
}*/