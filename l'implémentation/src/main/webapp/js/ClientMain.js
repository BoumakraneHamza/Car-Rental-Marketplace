let menuBtns = document.querySelector(".menu").querySelectorAll(".menu-tab");
console.log(menuBtns);
let menu = document.querySelector(".menu");
let logo = document.querySelector(".logo");

console.log(menuBtns.length);
menu.addEventListener("mouseenter",()=>{
	menu.classList.toggle("active");
	for(let key= 0; key < menuBtns.length ; key++){
		console.log(key);
		menuBtns.item(key).classList.toggle("active");
		logo.classList.toggle("active");
	}
});
menu.addEventListener("mouseleave",()=>{
	menu.classList.toggle("active");
	for(let key= 0; key < menuBtns.length ; key++){
		console.log(key);
		menuBtns.item(key).classList.toggle("active");
		logo.classList.toggle("active");
	}
});