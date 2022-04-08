const list = document.querySelector(".dropdownList");
const btn = document.querySelector("#dropdownlist");

btn.addEventListener("click",function(){
	if(list.style.display == "none"){
		list.style.display="block";
	}else{
		list.style.display = "none";
	}
});