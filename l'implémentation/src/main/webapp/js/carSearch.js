const map_switch = document.querySelector("#map-switch").querySelector("label");
const check = map_switch.querySelector("input");
const map = document.querySelector("#map");

map_switch.addEventListener("click", function(){
		if(map.style.display=="none"){
			map.style.display="block";
		}
		else{
			map.style.display="none"
		}
});
