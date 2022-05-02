let complete_registration = document.querySelector(".complete_registration");
let GettingStarted = document.querySelector(".GettingStarted");
let next = GettingStarted.querySelector("#next");
let exit_form = complete_registration.querySelector(".exit_form");

next.addEventListener("click",()=>{
	if(complete_registration.style.display == "none"){
		complete_registration.style.display = "flex";	
	}else{
		complete_registration.style.display = "none";
	}
});

exit_form.addEventListener("click",()=>{
	complete_registration.style.display = "none";
})