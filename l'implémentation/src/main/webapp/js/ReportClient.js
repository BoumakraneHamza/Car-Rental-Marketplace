function selectTab(element){
	const tab_list =document.querySelector("#tabs");
	const tabs = tab_list.querySelectorAll(".tab");
	tabs.forEach((tab)=>{
		tab.classList.remove("active");
	});
	element.classList.toggle("active");	
	let text = element.querySelector("#text").innerHTML;
	const pages = document.querySelector("#pages");
	const file_page = pages.querySelector("#file_page");
	const meeting_page = pages.querySelector("#meeting_page");
	if (text == "File"){
		file_page.style.display="flex";
		meeting_page.style.display="none";
	}else{
		file_page.style.display="none";
		meeting_page.style.display="flex";
	}
}
function closeTab(element){
	const tab = element.parentNode.parentNode;
	tab.style.display="none";
}
let meeting = new Array();
let Selected_Meetingdate = null ;
function selectMeeting(element){
	const meeting_page = document.querySelector("#meeting_page");
	const appts = meeting_page.querySelectorAll("#appt");
	appts.forEach((appt)=>{
		appt.style.borderColor ="#E4E4E4";
	});
	meeting=[];
	Selected_Meetingdate = null;
	element.style.borderColor ="#0071FF";
	Selected_Meetingdate = element.querySelector("#title").innerHTML;
	meeting.push(element.querySelector("#Meeting_date").value);
	meeting.push(element.querySelector("#Client_email").value);
	
}
const submit_btn_pages= document.querySelector("#submit_btn_pages");
submit_btn_pages.addEventListener("click",()=>{
	const client_report = document.querySelector(".report_client");
	client_report.style.display="flex";
	document.querySelector("#Upload_refrences").style.display="none";
	let add_files =document.querySelector("#add_files");
	if(Selected_Meetingdate != null){
		add_files.querySelector("#title").innerHTML = "Meeting On " + Selected_Meetingdate;	
	}else{
		add_files.querySelector("#title").innerHTML = "Add References";
	}		
});
let json;
function selectUpload(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.status == 200 && this.readyState == 4 ){
			meeting = [];
			Selected_Meetingdate = null;
			document.querySelector(".report_client").style.display="none";
			document.querySelector("#Upload_refrences").style.display="block";
			json = JSON.parse(this.responseText);
			const meeting_page = document.querySelector("#meeting_page");
			clearChild(meeting_page);
			for (key in json){
				const appt = document.createElement("div");
				appt.setAttribute("id","appt");
				appt.setAttribute("onclick","selectMeeting(this)");
				let Meeting_date = document.createElement("input");
				Meeting_date.setAttribute("type","hidden");
				Meeting_date.setAttribute("id","Meeting_date");
				Meeting_date.value=key;
				appt.append(Meeting_date);
				let Client_email = document.createElement("input");
				Client_email.setAttribute("type","hidden");
				Client_email.setAttribute("id","Client_email");
				Client_email.value=json[key].email;
				appt.append(Client_email);
				const apptTime = document.createElement('div');
				apptTime.setAttribute("id","time");
				let MeetingDate = key;
				let MTD = new Date(MeetingDate);
				var MTD2 = new Date(MTD.getTime() + 15*60000);
				let StartTime = (MTD.getHours() < 10 ? '0' : '') + MTD.getHours()+":"+(MTD.getMinutes() < 10 ? '0' : '') + (MTD.getMinutes()-1);
				let EndTime = (MTD2.getHours() < 10 ? '0' : '') + MTD2.getHours()+":"+(MTD2.getMinutes() < 10 ? '0' : '') + (MTD2.getMinutes()-1);
				const starttime = document.createElement('p');
				starttime.setAttribute("id","start_time");
				starttime.innerHTML = StartTime;
				apptTime.append(starttime);
				const endtime = document.createElement('p');
				endtime.setAttribute('id','end_time');
				endtime.innerHTML = EndTime;
				apptTime.append(endtime);
				appt.append(apptTime);
				const appt_info = document.createElement("div");
				appt_info.setAttribute("id","appt_info");
				const title = document.createElement('p');
				title.setAttribute('id','title');
				let numericDate = key;
				let ActDate = new Date(numericDate).toLocaleDateString('en-GB',{
					weekday:'long',
					day:'numeric',
					month:'long',
				});
				title.innerHTML = ActDate;
				appt_info.append(title);
				const subtitle = document.createElement('p');
				subtitle.setAttribute('id','subtitle');
				subtitle.innerHTML = json[key].nom +" "+json[key].prenom;
				appt_info.append(subtitle);
				appt.append(appt_info);
				const image_wrapper = document.createElement("div");
				image_wrapper.setAttribute("id","image_wrapper");
				const client_image = document.createElement("div");
				client_image.setAttribute("id","client_image");
				const image = document.createElement('img');
				image.style.width="50px";
				image.src="/Atelier"+json[key].image;
				client_image.append(image);
				image_wrapper.append(client_image);
				appt.append(image_wrapper);
				meeting_page.append(appt);
			}
		}
	}
	xhr.open('Get','GetMeetings?client_email=1@email.com');
	xhr.send()
}

document.querySelector(".report_client").addEventListener("submit",(e)=>{
	e.preventDefault();
	let report_client = document.querySelector(".report_client"); 
	let xhr = new XMLHttpRequest();
	let destination = report_client.querySelector("#destination").value;
	let title = report_client.querySelector("#Request_title").value;
	let tag = report_client.querySelector("#filter").value;
	let content = report_client.querySelector("#content").value;
	xhr.onreadystatechange = ()=>{
		if(this.status == 200){
			report_client.style.display="none";
		}
	}
	xhr.open("POST","SendMessage?destination="+destination+"&title="+title+"&content="+content+"&tag="+tag);
	xhr.send();
});