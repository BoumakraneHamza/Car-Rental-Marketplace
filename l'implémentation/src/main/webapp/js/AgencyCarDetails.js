const cancel = document.querySelector("#cancel");
const car_details = document.querySelector(".CarDetail");
cancel.addEventListener("click",function(e){
	e.preventDefault();
	car_details.style.visibility="hidden";
});
function show_details(element){
	car_details.style.visibility="visible";
	console.log(element);
}