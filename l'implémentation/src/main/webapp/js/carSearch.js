const map_switch = document.querySelector("#map-switch").querySelector("label");
const check = map_switch.querySelector("input");
const map = document.querySelector("#map");
const cancel = document.querySelector("#cancel");
const view = document.querySelector(".view");

map_switch.addEventListener("click", function(){
		if(map.style.display=="none"){
			map.style.display="block";
		}
		else{
			map.style.display="none"
		}
});
cancel.addEventListener("click",function(){
	view.style.display="none";
});

function show_details(element){
	const name = element.parentNode.parentNode.querySelector("#carName");
	const ViewName = view.querySelector("#modele");
	ViewName.innerHTML = name.innerHTML;
	const imageSrc = element.parentNode.parentNode.querySelector("#car_image").querySelector("img").src;
	const imageView = view.querySelector(".images").getElementsByTagName("img");

	for (let i = 0; i < imageView.length; i++){
		imageView[i].src = imageSrc;
	}
	const price = element.parentNode.parentNode.querySelector("#price").querySelector("#amount");
	const priceView = view.querySelector("#daily_price").innerHTML = price.innerHTML;
	
	let duration = parseInt(view.querySelector("#V_duration").innerHTML);
	let total_rate = duration * parseInt(price.innerHTML);
	const total = view.querySelector("#total_rate").innerHTML = total_rate;
	const totalinput = view.querySelector("#total_rate").parentNode.querySelector("input");
	console.log(totalinput);
	totalinput.value=total_rate;
	
	const agence = view.querySelector("#agence").value=element.parentNode.parentNode.querySelector("#AgencyName").innerHTML;
	const matricule = view.querySelector("#matricule_vehicule").value=element.parentNode.parentNode.querySelector("#matricule").value;
	view.style.display="flex";
}