let menuBtns = document.querySelector(".menu").querySelectorAll(".menu-tab");
let menu = document.querySelector(".menu");
let logo = document.querySelector(".logo");

menu.addEventListener("mouseenter",()=>{
	menu.classList.toggle("active");
	for(let key= 0; key < menuBtns.length ; key++){
		menuBtns.item(key).classList.toggle("active");
		logo.classList.toggle("active");
	}
});
menu.addEventListener("mouseleave",()=>{
	menu.classList.toggle("active");
	for(let key= 0; key < menuBtns.length ; key++){
		menuBtns.item(key).classList.toggle("active");
		logo.classList.toggle("active");
	}
});