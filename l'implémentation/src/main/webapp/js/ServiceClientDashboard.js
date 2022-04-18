function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}

const ReadingField = document.querySelector(".email-content");
const Replies_list = document.querySelector(".email_replies_list");
const conversation_content = document.querySelector("#conversation-content"); 
const no_message = document.querySelector("#no-messages");
function read(element){
	const id= element.querySelector("#id").value;
	let xhr = new XMLHttpRequest();
	const tag = element.querySelector("#tag").innerHTML;
	const title = element.querySelector("#title").value;
	let count;
	var json
	clearChild(Replies_list);
	xhr.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {    
			json = JSON.parse(this.responseText);            
			console.log(json);
			count = json.conversation.messages.length;
			console.log(count);
			let conversation_id = conversation_content.querySelector("#conversation_id");
			let id=element.querySelector("#id").value;
			conversation_id.value = id
			conversation_content.style.display="block";
			no_message.style.display="none";
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
			ReadingField.querySelector("#email-time").innerHTML = json.conversation.messages[0].time;
			ReadingField.querySelector("#main-email-content-text").querySelector("#text").innerHTML = json.conversation.messages[0].content; 
    	}
	}
	xhr.open("GET","GetRequestInfo?id="+id);
	xhr.send();
}