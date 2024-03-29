function weeksBetween(d1, d2) {
    return Math.round((d2 - d1) / (7 * 24 * 60 * 60 * 1000));
}
let weeks = new Array();
function generateWeekIntervals(d1,numberOfweeks){
	weeks.push(d1);
	let dt = new Date(d1);
	for (let i=0;i<numberOfweeks;i++){
		dt = new Date(dt);
		dt = new Date(dt.setDate(dt.getDate()+7));
		weeks.push(dt);
	}
	console.log(weeks);
}
const nth = function(d) {
    if (d > 3 && d < 21) return 'th';
    switch (d % 10) {
        case 1:  return "st";
        case 2:  return "nd";
        case 3:  return "rd";
        default: return "th";
    }
}
let map = new Map();
function sortDatabyWeeks(weeks , twoDim){
	console.log(twoDim);
	for(let j=0;j<jsonSize;j++){
		let keyset = new Map();
		let date = new Date(twoDim[j][0]);
		
		console.log(twoDim[j][0]);
		console.log(twoDim[j][1].length);
		keyset.set(date,j)
		for (let i=0 ;i<weeks.length;i++){
			let firstDate = new Date(weeks[i]);
			let secondDate = new Date(weeks[i+1]);
			if((date <= secondDate && date >= firstDate)){
				let arr = new Array();
				let key;
				let firstMonth = firstDate.getMonth();
				let secondMonth = secondDate.getMonth();
				if(firstMonth != secondMonth){
					key = firstDate.toLocaleString("en-GB",{day:"numeric",})+nth(firstDate.toLocaleString("en-GB",{day:"numeric",}))+" " +firstDate.toLocaleString("en-GB",{month:"long",})+ " - "+secondDate.toLocaleString("en-GB",{day:"numeric",})+nth(secondDate.toLocaleString("en-GB",{day:"numeric",}))+" "+secondDate.toLocaleString("en-GB",{month:"long",}) +" "+secondDate.getFullYear(); 
				}else{
					key = firstDate.toLocaleString("en-GB",{month:"long",})+" "+firstDate.toLocaleString("en-GB",{day:'numeric'})+nth(firstDate.toLocaleString("en-GB",{day:'numeric'}))+" "+secondDate.toLocaleString("en-GB",{day:'numeric'})+nth(secondDate.toLocaleString("en-GB",{day:'numeric'}))+" "+secondDate.getFullYear();
				}
				if(map.has(key)){
					for(let k=0; k<twoDim[keyset.get(date)][1].length;k++){
						map.set(key,map.get(key).concat(twoDim[keyset.get(date)][1][k]));
					}
				}else{
					for(let k=0; k<twoDim[keyset.get(date)][1].length;k++){
						arr.push(twoDim[keyset.get(date)][1][k]);	
					}
					map.set(key,arr);
				}
				break;
				
			}
		}	
	}
	console.log(map);
	
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
function loadData(){
	
	let keys = Array.from(map.keys());
	console.log(keys);
	let booking_List = document.querySelector(".bookings_List");
	clearChild(booking_List);
	for (let i in keys){
		let bookingTile = document.createElement("div");
		bookingTile.setAttribute("id","BookingTile");
		let header_date = document.createElement("p");
		header_date.setAttribute("id","header_date");
		header_date.innerHTML = keys[i];
		bookingTile.append(header_date);
		let booking_tile_content = document.createElement("div");
		booking_tile_content.setAttribute("id","booking_tile_content");
		for(let j=0;j<map.get(keys[i]).length;j++){
			let booking = document.createElement("div");
			booking.setAttribute("id","booking");
			booking.setAttribute("onclick","showDetails(this)");
			let id= document.createElement("input");
			id.setAttribute("type","hidden");
			id.setAttribute("id","reservationId");
			id.value = map.get(keys[i])[j]["id"];
			booking.append(id);
			let booking_info = document.createElement("div");
			booking_info.setAttribute("id","booking_info");
			let image_wrapper = document.createElement("div");
			image_wrapper.setAttribute("id","image_wrapper");
			let image = document.createElement("img");
			image.setAttribute("style","width: 110px;height: 70px;object-fit: cover;");
			image.src="/Atelier"+map.get(keys[i])[j]["vehicule"]["image"];
			image_wrapper.append(image);
			booking_info.append(image_wrapper);
			let text_wrapper = document.createElement("div");
			text_wrapper.setAttribute("id","text_wrapper");
			let car_name = document.createElement("p");
			car_name.setAttribute("id","car_name");
			car_name.innerHTML = map.get(keys[i])[j]["vehicule"]["marque"] +" "+ map.get(keys[i])[j]["vehicule"]["modele"];
			text_wrapper.append(car_name);
			let agency_name = document.createElement("p");
			agency_name.removeAttribute("id");
			agency_name.setAttribute("id","agency_name");
			agency_name.innerHTML = "Hertz";
			text_wrapper.append(agency_name);
			booking_info.append(text_wrapper);
			booking.append(booking_info);
			let type = document.createElement("p");
			type.setAttribute("id","type");
			type.innerHTML = "Premium";
			booking.append(type);
			let location = document.createElement("div");
			location.setAttribute("id","location");
			let image2 = document.createElement("img");
			image2.src= "/Atelier/assets/location-grey.svg";
			let location_text = document.createElement("p");
			location_text.innerHTML = map.get(keys[i])[j]["location"];
			location.append(image2);
			location.append(location_text);
			booking.append(location);
			let date = document.createElement("div");
			date.setAttribute("id","date");
			let image3 = document.createElement("img");
			image3.setAttribute("style","width: 22px;");
			image3.src="/Atelier/assets/hour_icon_darkgrey.svg";
			date.append(image3);
			let date_range = document.createElement("div");
			date_range.setAttribute("id","date_range");
			let date_1 = document.createElement("p");
			let startDate = new Date(map.get(keys[i])[j]["pick_up_date"]);
			let sd = startDate.toLocaleString("en-GB",{
				day:"numeric",
			})
			date_1.innerHTML = sd+nth(sd) +" -"
			date_range.append(date_1);
			let ReturnDate = new Date(map.get(keys[i])[j]["return_date"]);
			let rt = ReturnDate.toLocaleString("en-GB",{
				day:"numeric",
			})
			let date_2 = document.createElement("p");
			date_2.innerHTML = rt + nth(rt);
			date_range.append(date_2);
			date.append(date_range);
			booking.append(date);
			let payment = document.createElement("div");
			payment.setAttribute("id","payment");
			let image4 = document.createElement("img");
			image4.setAttribute("style","width:20px");
			image4.src = "/Atelier/assets/check-round-white.svg";
			payment.append(image4);
			let text_payment = document.createElement("p");
			text_payment.innerHTML = "Paild : $200";
			payment.append(text_payment);
			booking.append(payment);
			booking_tile_content.append(booking);
		}
		bookingTile.append(booking_tile_content);
		booking_List.append(bookingTile);
	}
}
function custom_sort(a, b) {
    return new Date(a).getTime() - new Date(b).getTime();
}
let json;
let jsonSize;
let twoDim;
function getData(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
				data = JSON.parse(xhr.responseText);
				json = data[1];
				jsonSize = data[0];
				console.log(json);
				let arrr = new Array();
				for (let key in json){
					arrr.push(key);
				}
				arrr.sort(custom_sort);
				twoDim = new Array();
				for(let i in arrr){
					twoDim[i] = [arrr[i],json[arrr[i]]];
				}
				console.log(twoDim);
				if(jsonSize == 1){
					let lastDay = new Date(twoDim[0][0]);
					lastDay = lastDay.setDate(lastDay.getDate()+7);
					let numberOfTiles = weeksBetween(new Date(twoDim[0][0]),lastDay);
					if(numberOfTiles == 0){
						//there must be at least one tile
						numberOfTiles = 1;
					}
					generateWeekIntervals(twoDim[0][0],numberOfTiles);
				}else{
					let numberOfTiles = weeksBetween(new Date(twoDim[0][0]),new Date(twoDim[jsonSize-1][0]));
					if(numberOfTiles == 0){
						//there must be at least one tile
						numberOfTiles = 1;
					}
					generateWeekIntervals(twoDim[0][0],numberOfTiles);	
				}
				console.log(weeks);
				sortDatabyWeeks(weeks,twoDim);
				loadData();
		}
	}
	xhr.open("Get","ReservationList?required_action=true");
	xhr.send();
}
getData();
function deleteTag(element){
	element.parentNode.remove();
}
function showTags(){
	let add_tag_list =document.querySelector(".add_tag_list");
	let tab_header = add_tag_list.querySelector("#tab_header");
	let tag_list = add_tag_list.querySelector("#tag_list");
	
	if(add_tag_list.style.display=="none"){
		tab_header.style.display="flex";
		tag_list.style.display="flex";
		add_tag_list.style.display="flex";
	}else{
		tab_header.style.display="none";
		tag_list.style.display="none";
		add_tag_list.style.display="none";
	}
}
function flip(i){
	if(i==1){
		document.querySelector(".card_container").style.transform="rotateY(180deg)";
	}else{
		document.querySelector(".card_container").style.transform="rotateY(0deg)";
	}
}
function showDetails(element){
	let banner = document.querySelector(".details_banner");
	if(banner.classList.contains("active")){
		let xhr = new XMLHttpRequest();
		let reservationId = element.querySelector("#reservationId").value;
		let params = "reservationId="+reservationId;
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState == 4 && xhr.status == 200){
				let data = JSON.parse(xhr.responseText);
				let json = data[0];
				let card = data[1];
				console.log(card);
				document.querySelector(".details_wrapper").style.visibility="visible";
				document.querySelector("#wrapper").style.display="block";
				banner.classList.remove("active");
				let firstDate = new Date(json["pick_up_date"]);
				let secondDate = new Date(json["return_date"]);
				let duration = secondDate.getDate() - firstDate.getDate();
				console.log(duration);
				banner.querySelector("#banner_header").querySelector("#date").innerHTML = json["reservation_date"];
				banner.querySelector("#banner_header").querySelector("#Price").innerHTML ="$ "+ json["payment"]["Total"];
				banner.querySelector("#banner_header").querySelector("#status").innerHTML = json["payment"]["status"];
				let booking = banner.querySelector(".card_container").querySelector(".booking_info");
				booking.querySelector("#location").innerHTML = json["location"];
				booking.querySelector("#pick_up_date").innerHTML = json["pick_up_date"];
				booking.querySelector("#duration").innerHTML = duration + " days";
				booking.querySelector(".car_name").innerHTML = json["vehicule"]["marque"]+" "+json["vehicule"]["modele"];
				booking.querySelector("#per_day").innerHTML ="$ "+ json["vehicule"]["PLJ"];
				booking.querySelector(".total_price").innerHTML ="$ "+ parseInt(json["vehicule"]["PLJ"])*duration;
				booking.querySelector(".insuranceV").innerHTML ="$ "+ json["payment"]["Insurance"];
				if(json["payment"]["Insurance"] == "0"){
					booking.querySelector(".insuranceP").innerHTML = "no insurance";
				}
				if(json["payment"]["Insurance"] == "52"){
					booking.querySelector(".insuranceP").innerHTML = "no Worries about the vehicle";
				}
				if(json["payment"]["Insurance"] == "87"){
					booking.querySelector(".insuranceP").innerHTML = "Full insurance";
				}
				booking.querySelector("#footer").querySelector("#total").innerHTML ="$ "+ json["payment"]["Total"];
				banner.querySelector(".contract_list").querySelector("#contract").href ="/Atelier/"+ json["contrat"];
				let payment = banner.querySelector(".payment_info");
				payment.querySelector(".card_number").querySelector("span").innerHTML = "**** **** **** "+card["CardNumber"];
				payment.querySelector("#card_Expiry_date").querySelector("#card_expiry_date").innerHTML = card["exp_month"]+"/"+card["exp_year"];
			}
		}
		xhr.open("POST","ReservationList");
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send(params);
	}else{
		document.querySelector(".details_wrapper").style.visibility="hidden";
		document.querySelector("#wrapper").style.display="none";
		document.querySelector(".details_banner").classList.add("active");
	}
}
