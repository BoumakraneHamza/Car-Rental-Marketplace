let nav = 0;
let json;
let map = null;
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
		let day_count = document.createElement('div');
		day_count.setAttribute('id','day_count');
		let weekday = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			weekday:'long',
		});
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
		if(i == nav){	
			let CurrDate = month +", "+ year;
			let month_year = document.querySelector("#calendar_month");
			month_year.innerHTML = CurrDate;	
		}
		let weektext = document.createElement("p");
		weektext.setAttribute("id","weekday");
		weektext.innerHTML = weekday;
		let day_month = document.createElement("p");
		day_month.setAttribute("id","day_month");
		day_month.innerHTML = day;
		day_count.append(weektext);
		day_count.append(day_month);
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
					delete json[key];
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
					delete json[key];
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		dayWrapper.append(day_calendar);
		calendar_content.append(dayWrapper);
		
	}
}
function initButtons(){
	document.querySelector("#back").addEventListener("click",function(){
		nav--;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	document.querySelector("#today").addEventListener("click",function(){
		nav=0;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	document.querySelector("#next").addEventListener("click",function(){
		nav++;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	
}
const activities_list = document.querySelector("#activities_list");
function create_Upcoming_Acts(){
	let keys = Array.from(map.keys());
	clearChild(activities_list);
	for (let i=0;i<keys.length;i++){
		const activity_date = document.createElement("div");
		activity_date.setAttribute("id","activity_date");
		const date = document.createElement("p");
		date.setAttribute("id","date");
		let numericDate = keys[i];
		let ActDate = new Date(numericDate.split("/").reverse().join("/")).toLocaleDateString('en-GB',{
			weekday:'long',
			day:'numeric',
			month:'long',
		});
		date.innerHTML = ActDate;
		activity_date.append(date);
		const activity_list = document.createElement("div");
		activity_list.setAttribute("id","activity_list");
		activities_list.append(activity_date);
		let apptValues = map.get(keys[i]);
		for (let arr in apptValues){
			let ApptArray = apptValues[arr];
			let MeetingDate = ApptArray[1];
			let MTD = new Date(MeetingDate);
			var MTD2 = new Date(MTD.getTime() + 15*60000);
			let StartTime = (MTD.getHours() < 10 ? '0' : '') + MTD.getHours()+":"+(MTD.getMinutes() < 10 ? '0' : '') + (MTD.getMinutes()-1);
			let EndTime = (MTD2.getHours() < 10 ? '0' : '') + MTD2.getHours()+":"+(MTD2.getMinutes() < 10 ? '0' : '') + (MTD2.getMinutes()-1);
			const appt = document.createElement('div');
			appt.setAttribute("id","appt");
			const apptTime = document.createElement('div');
			apptTime.setAttribute("id","time");
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
			title.innerHTML = "Meeting";
			appt_info.append(title);
			const subtitle = document.createElement('p');
			subtitle.setAttribute('id','subtitle');
			subtitle.innerHTML = ApptArray[0].nom +" "+ApptArray[0].prenom;
			appt_info.append(subtitle);
			appt.append(appt_info);
			const image_wrapper = document.createElement("div");
			image_wrapper.setAttribute("id","image_wrapper");
			const client_image = document.createElement("div");
			client_image.setAttribute("id","client_image");
			const image = document.createElement('img');
			image.style.width="50px";
			image.src="/Atelier"+ApptArray[0].image;
			client_image.append(image);
			image_wrapper.append(client_image);
			appt.append(image_wrapper);
			activity_list.append(appt);
		}
		activities_list.append(activity_list);
	}
}
function getData(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			let data = JSON.parse(this.responseText);
			json = data[0];
			let Upcoming = data[1];
			let firstIndex;
			let n = 0;
			for (let k in Upcoming){
				if (n==0){
					firstIndex = k
				}
				n++;
			}
			let date = new Date(firstIndex).toLocaleDateString('en-GB',{
					day:'numeric',
					month:'numeric',
					year:'numeric',
				});
			let values = []
			let value = [Upcoming[firstIndex] ,firstIndex ];
			values.push(value);
			map = new Map();
			map.set(date,values)
			n=0;
			for (let key in Upcoming){
				if(n>0){
					date = new Date(key).toLocaleDateString('en-GB',{
					day:'numeric',
					month:'numeric',
					year:'numeric',
				});
				if(map.has(date) != true){
					value = [Upcoming[key],key];
					let values = new Array();
					values.push(value);
					map.set(date , values);
				}else{
					let values = map.get(date);
					value = [Upcoming[key],key];
					values.push(value);
					map.set(date,values);
				}
				}
				n++;
			}
			if(map.keys.length>0){
				create_Upcoming_Acts();
			}
			load();
		}
	};
	xhr.open("GET","GetMeetings?limit="+4);
	xhr.send();
}
$( document ).ready(function() {
	clearChild(days_header);
	clearChild(calendar_content);
	getData();
	initButtons();
});