$(function() {
	$('input[name="range_picker"]').daterangepicker({
	    "startDate": new Date(SearchStartDate),
	    "endDate": new Date(SearchEndDate),
		"minDate": new Date(),
		"opens": "center",
	  });
});
document.querySelector(".bill").querySelector("#cta").addEventListener("click",(e)=>{
	e.preventDefault();
	let data = new FormData(document.querySelector(".bill"));
	var param = new URLSearchParams(data).toString();
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				document.querySelector(".bill").querySelector("#required_action").value="add";
				document.querySelector(".bill").submit();
			}else if(xhr.status == 300){
				let data = xhr.responseText;
				console.log(data);
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