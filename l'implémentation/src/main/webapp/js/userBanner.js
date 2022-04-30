const list_header = document.querySelector("#list_header");
const list_content = document.querySelector("#list_content");
list_header.addEventListener("click",function(){
	const header_icon =document.querySelector(".header_icon");
	if(list_content.style.display=="none"){
		list_content.style.display="flex";
	}else{
		list_content.style.display="none"
	}
	header_icon.classList.toggle("active");
});
const options = document.querySelector("#options");
options.addEventListener("click",()=>{
	const report_client = document.querySelector("#report_client");
	if(report_client.style.display=="none"){
		report_client.style.display="block";
	}else{
		report_client.style.display="none"
	}
});
const User_Banner = document.querySelector(".User_Banner");
const exit = User_Banner.querySelector("#exit");
const banner_wrapper = document.querySelector(".banner_wrapper");
exit.addEventListener("click",()=>{
	banner_wrapper.style.display="none";
	User_Banner.classList.toggle("active");
});
banner_wrapper.addEventListener("click",()=>{
	banner_wrapper.style.display="none";
	User_Banner.classList.toggle("active");
});
function report(){
	document.querySelector('.report_client').style.display='flex';
	User_Banner.classList.toggle("active");
	banner_wrapper.style.display="none";
}
function showProfile(element){
	const User_Banner = document.querySelector(".User_Banner");
	const banner_wrapper = document.querySelector(".banner_wrapper");
	let email = element.querySelector("#client_email").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			User_Banner.querySelector("#client_image").querySelector("img").src="/Atelier"+json.image;
			User_Banner.querySelector("#client_name").innerHTML = json.nom +" "+json.prenom;
			User_Banner.querySelector("#client_email").innerHTML = json.email;
			User_Banner.querySelector("#client_location").innerHTML = json.address;
			User_Banner.querySelector(".account_created").innerHTML = json.accountCreated;
			User_Banner.querySelector(".booking_count").innerHTML = 10;
			User_Banner.querySelector(".warning_count").innerHTML = json.alert;
			User_Banner.querySelector("#map").remove();
			let map = document.createElement("div");
			map.setAttribute("id","map");
			User_Banner.querySelector(".profile_Banner").append(map);
			createMap(json.lat,json.lon);
			banner_wrapper.style.display="block";
			User_Banner.classList.toggle("active");
		}
	}
	xhr.open("Get","GetProfile?client_email="+email);
	xhr.send();
}
