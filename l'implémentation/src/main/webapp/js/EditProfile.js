const form = document.querySelector("form");
console.log(form);
const btn = document.querySelector("#save");
console.log(btn);
btn.addEventListener("click",function(){
	form.submit();
});