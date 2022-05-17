let menuBtns = document.querySelector(".menu").querySelectorAll(".menu-tab");
let menu = document.querySelector(".menu");
let logo = document.querySelector(".logo");

menu.addEventListener("mouseenter",()=>{
	if(!menu.classList.contains("active")){
		menu.classList.add("active");
	}
	for(let key= 0; key < menuBtns.length ; key++){
		menuBtns.item(key).classList.add("active");
	}
	if(!logo.classList.contains("active")){
		logo.classList.add("active");
	}
});
menu.addEventListener("mouseleave",()=>{
	if(menu.classList.contains("active")){
		menu.classList.remove("active");
	}
	for(let key= 0; key < menuBtns.length ; key++){
		menuBtns.item(key).classList.remove("active");
	}
	if(logo.classList.contains("active")){
		logo.classList.remove("active");
	}
});