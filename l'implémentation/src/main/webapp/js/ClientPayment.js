const summary_header = document.querySelector(".summary_header");
const summary_body = document.querySelector(".summary_body");
const reciever = document.querySelector(".reciever");
const side_bar =document.querySelector(".side_bar");
const agency_image = reciever.querySelector("#agency_image");
const agency = agency_image.querySelector("img");
const summary_header_arrow = document.querySelector(".summary_toggle");
summary_header.addEventListener("click",function(){
	if(summary_body.style.display == "none"){
		summary_body.style.display="block";
		agency_image.style.width="100px";
		agency_image.style.height="100px";
		agency.style.width="100px";
		summary_header_arrow.classList.toggle("active");
	}else{
		summary_body.style.display="none";
		agency_image.style.width="150px";
		agency_image.style.height="150px";
		agency.style.width="150px";
		summary_header_arrow.classList.toggle("active");
	}
});
function ShowDetails(element){
	let paymentId = element.querySelector("#payment_id").value;
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
			side_bar.style.display="flex";
			const payment_content = document.querySelector(".payment-content");
			const main_frame= document.querySelector(".main-frame");
			payment_content.style.width="75%";
			main_frame.style.justifyContent = "flex-start";
	        var json = JSON.parse(this.responseText);
	        const agency_name = side_bar.querySelector("#agency_name").innerHTML = json[paymentId].agence;
			const date_value = side_bar.querySelector("#date_value").innerHTML = json[paymentId].date;
			const amount_value = side_bar.querySelector("#amount_value").innerHTML = json[paymentId].montant;
			const invoice_id = 	side_bar.querySelector("#invoice_id").innerHTML = paymentId; 
			const car_name = summary_body.querySelector(".car_name").innerHTML = json[paymentId].car_name;
			const rate = summary_body.querySelector(".rate").innerHTML = json[paymentId].plj;
			const duration = summary_body.querySelector(".duration").innerHTML = json[paymentId].duration;
		}
	};
	xhr.open("Post", "ClientPayment");
	xhr.send();
}
function addCard(){
	const background = document.querySelector(".wrapper");
	backg.style.display="block";
}