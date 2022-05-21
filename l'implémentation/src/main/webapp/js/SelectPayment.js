window.addEventListener('load', function () {
  document.getElementsByTagName("body")[0].style.display="block";
})
function selectTab(element){
	let tabs = document.querySelector("#tabs").querySelectorAll(".tab");
	tabs.forEach((tab)=>{
		if(tab.classList.contains("active")){
			tab.classList.remove("active");
		}
	});
	element.classList.toggle("active");
	if(element.innerHTML == "Pay Now"){
		document.querySelector(".tabs_content").querySelector("#payment-form").style.visibility="visible";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="hidden";
	}else{
		document.querySelector(".tabs_content").querySelector("#payment-form").style.visibility="hidden";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="visible";
	}
}
function createSelectMap(mapWrapper,lat,lon){
	map = L.map(mapWrapper, {
	    center: [lat, lon],
		zoom: 8,
		attributionControl:false,
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	var marker = L.icon({
	    iconUrl: contextPath+'/assets/map-marker.svg',
	    iconSize: [17, 40],
	});
	L.marker([lat, lon],{icon: marker}).addTo(map);
	map.on('click', function(e) {
		map.eachLayer((layer) => {
		     if(layer['_latlng']!=undefined)
		         layer.remove();
		 });
		L.marker([e.latlng.lat, e.latlng.lng],{icon: marker}).addTo(map);
		$.getJSON("https://nominatim.openstreetmap.org/reverse?format=json&lat="+e.latlng.lat+"&lon="+e.latlng.lng,(data)=>{
			let inputs_wrapper = mapWrapper.parentNode.querySelector("#inputs_wrapper");
			let location ;
			if (data.address.state != undefined){
				location = data.address.state + " "+ data.address.country;
			}else{
				location = data.address.state_district + " "+ data.address.country;
			}
			
			var arabic = /[\u0600-\u06FF]/;
			if(data.address.county != undefined){
				if (arabic.test(data.address.county)){
					inputs_wrapper.value = location;
				}else{
					location = data.address.county +" "+ location; 
				}
			}
			inputs_wrapper.value = location;
			if(mapWrapper == document.querySelector(".view_Location").querySelector("#select_map_wrapper")){
				edit_asset.querySelector("#lat").value = data.lat;
				edit_asset.querySelector("#lon").value = data.lon;
			}else{
				lat_input.value = data.lat;
				lon_input.value = data.lon;
			}
		});
	});
}
function show_select_location(){
	document.querySelector(".view_Location").style.display="block";
	createSelectMap(document.querySelector(".view_Location").querySelector("#select_map_wrapper"),35,5);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}
let newElements;
async function Re_initialize(paymentMethod,customer_id) {
  const response = await fetch("PaymentManager", {
    method: "POST",
    headers: { 'Content-Type': 'application/x-www-form-urlencoded',  },
    body: "required_action=useSaved_Method&paymentMethod="+paymentMethod+"&customer_id="+customer_id,
  });
  const { clientSecret } = await response.json();
	console.log(clientSecret);
  const appearance = {
    theme: 'stripe',
  };
  newElements = stripe.elements({ appearance, clientSecret });
}
async function PayWithSaved(element){
	let payment_method_id=element.querySelector("#payment_method_id").value;
	let customer_id = element.querySelector("#customer_id").value;
	console.log(payment_method_id);
	console.log(customer_id);
	Re_initialize(payment_method_id,customer_id);
	setLoading(true);
	const { error } = await stripe.confirmPayment({
	    newElements,
	    confirmParams: {
	      // Make sure to change this to your payment completion page
	      return_url: "http://localhost:12409/Atelier/jsp/ContractConfirmation.jsp",
	    },
	});
	if (error.type === "card_error" || error.type === "validation_error") {
  		showMessage(error.message);
  	} else{
    	showMessage("An unexpected error occured.");
  	}
  	setLoading(false);
}