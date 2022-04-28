function deleteUnBlur(){
	const content = document.querySelector(".content");
	const target = document.querySelector("#booking_completed");
	target.remove();
	content.style.filter="none";
}