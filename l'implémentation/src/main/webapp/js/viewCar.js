$(function() {
	$('input[name="range_picker"]').daterangepicker({
	    "startDate": new Date(SearchStartDate),
	    "endDate": new Date(SearchEndDate),
		"minDate": new Date(),
		"opens": "center",
	  });
});
function calculateBill(){
	let price = parseInt(document.querySelector("#bill_content").querySelector("#duration").querySelector(".price").innerHTML);
	let insurance = parseInt(document.querySelector("#bill_content").querySelector("#tile").querySelector(".insurance").innerHTML);
	let total = price + insurance + 10;
	document.querySelector(".total_price").innerHTML = "$ "+ parseInt(total);
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        child.remove();
        child = e.lastElementChild;
    }
}
function selectInsurance(element){
	element = element.parentNode.parentNode;
	let insuranceText = element.querySelector("#title").innerHTML;
	let insurancePrice = element.querySelector("#total").innerHTML;
	insurancePrice = insurancePrice.replace("$","");
	let insurance = document.querySelector(".insurance_tile").querySelector("#price_container");
	clearChild(insurance);
	let dollarSign = document.createElement("p");
	dollarSign.innerHTML = "$ ";
	insurance.append(dollarSign);
	let insuranceValue = document.createElement("p");
	insuranceValue.setAttribute("class","insurance");
	insuranceValue.setAttribute("id","value");
	insuranceValue.innerHTML = insurancePrice;
	insurance.append(insuranceValue);
	document.querySelector(".insurance_tile").querySelector("#title").innerHTML = insuranceText;
	document.querySelector(".bill").querySelector("#insurance").value= insurancePrice;
	calculateBill();
}
calculateBill();
setLoading(false);
document.querySelector(".bill").querySelector("#submit_btn").addEventListener("click",(e)=>{
	e.preventDefault();
	setLoading(true);
	let data = new FormData(document.querySelector(".bill"));
	var param = new URLSearchParams(data).toString();
	let xhr = new XMLHttpRequest();
	xhr.onload = ()=>{
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				document.querySelector(".bill").querySelector("#required_action").value="add";
				document.querySelector(".bill").submit();
				setTimeout(setLoading(false),1000);
			}else if(xhr.status == 300){
				setLoading(false);
				let data = xhr.responseText;
				let warnning = document.createElement("div");
				warnning.setAttribute("class","WarningNotification");
				warnning.innerHTML = data;
				document.querySelector(".content").append(warnning);
			}
		}
	}
	xhr.open("Post","BookingManagement");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(param);
});
function Refresh(){
	location.reload();
}
// Show a spinner on payment submission
function setLoading(isLoading) {
  if (isLoading) {
    // Disable the button and show a spinner
    document.querySelector("#submit_btn").disabled = true;
    document.querySelector("#spinner").classList.remove("hidden");
    document.querySelector("#button-text").classList.add("hidden");
  } else {
    document.querySelector("#submit_btn").disabled = false;
    document.querySelector("#spinner").classList.add("hidden");
    document.querySelector("#button-text").classList.remove("hidden");
  }
}