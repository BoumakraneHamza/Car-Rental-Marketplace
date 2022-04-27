let nav = 0;
let json;
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
let calendar_content = document.querySelector("#calendar_content");
clearChild(calendar_content);
const days_header = document.querySelector('#calendar_sec_header');
function load(){
	let dt = new Date();
	let currentYear = dt.getFullYear();
	let month;
	let year;
	for(let i=nav;i<5+nav;i++){
		let day_count = document.createElement('p');
		day_count.setAttribute('id','day_count');
		let day = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			day:'numeric',
			month:'long',
		});
		let NumericDay = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			day:'numeric',
		});
		month = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			month:'long',
		});
		NumericMonth = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			month:'numeric',
		});
		year = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			year:'numeric',
		});
		day_count.innerHTML = day.toString();
		days_header.append(day_count);
		let dayWrapper = document.createElement('div');
		dayWrapper.setAttribute("id","day");
		let day_calendar = document.createElement('div');
		day_calendar.setAttribute("id","day_calendar");
		for (let j=0;j<4;j++){
			let tile = document.createElement('div');
			tile.setAttribute("id","tile");
			let time = document.createElement('p');
			time.setAttribute("id","time");
			let date1 = 8+j;
			let date2 = 8+j+1;
			let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":00"+":00";
			let to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let key in json){
				let meetingDate = new Date(key);
				if (meetingDate >= new Date(from) && meetingDate <= new Date(to)){
					let appt = document.createElement('div');
					appt.setAttribute("id",'appt');
					let appt_info = document.createElement('div');
					appt_info.setAttribute('id','appt_info');
					let title = document.createElement('p');
					title.setAttribute('id','title');
					title.innerHTML = "Meeting";
					appt_info.append(title);
					let subtitle = document.createElement('p');
					subtitle.setAttribute('id','subtitle');
					subtitle.innerHTML = json[key].nom + json[key].prenom;
					appt_info.append(subtitle);
					appt.append(appt_info);
					let appt_image = document.createElement('div');
					appt_image.setAttribute('id','appt_image');
					let image = document.createElement('img');
					image.src = '/Atelier'+json[key].image;
					image.style.width="30px";
					appt_image.append(image);
					appt.append(appt_image);
					tile_content.append(appt);
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		for (let j=0;j<4;j++){
			let tile = document.createElement('div');
			tile.setAttribute("id","tile");
			let time = document.createElement('p');
			time.setAttribute("id","time");
			let date1 = 13+j;
			let date2 = 13+j+1;
			let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":00"+":00";
			let to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let key in json){
				let meetingDate = new Date(key);
				if (meetingDate >= new Date(from) && meetingDate <= new Date(to)){
					let appt = document.createElement('div');
					appt.setAttribute("id",'appt');
					let appt_info = document.createElement('div');
					appt_info.setAttribute('id','appt_info');
					let title = document.createElement('p');
					title.setAttribute('id','title');
					title.innerHTML = "Meeting";
					appt_info.append(title);
					let subtitle = document.createElement('p');
					subtitle.setAttribute('id','subtitle');
					subtitle.innerHTML = json[key].nom + json[key].prenom;
					appt_info.append(subtitle);
					appt.append(appt_info);
					let appt_image = document.createElement('div');
					appt_image.setAttribute('id','appt_image');
					let image = document.createElement('img');
					image.src = '/Atelier'+json[key].image;
					image.style.width="30px";
					appt_image.append(image);
					appt.append(appt_image);
					tile_content.append(appt);
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		dayWrapper.append(day_calendar);
		calendar_content.append(dayWrapper);
		
	}
	let CurrDate = month +" "+ year;
	const month_year = document.querySelector("#calendar_month");
	month_year.innerHTML = CurrDate;
}
function initButtons(){
	document.querySelector("#back").addEventListener("click",function(){
		nav--;
		clearChild(days_header);
		clearChild(calendar_content);
		load();
	});
	document.querySelector("#next").addEventListener("click",function(){
		nav++;
		clearChild(days_header);
		clearChild(calendar_content);
		load();
	});
	
}
function getData(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			json = JSON.parse(this.responseText);            
			console.log(json);
			load();
		}
	};
	xhr.open("GET","GetMeetings");
	xhr.send();
}
$( document ).ready(function() {
	clearChild(days_header);
	clearChild(calendar_content);
	getData();
	initButtons();
});