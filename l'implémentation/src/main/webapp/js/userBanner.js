const list_header = document.querySelector("#list_header");
const list_content = document.querySelector("#list_content");
list_header.addEventListener("click",function(){
	const header_icon =document.querySelector(".header_icon");
	if(list_content.style.display=="none"){
		list_content.style.display="flex";
	}else{
		list_content.style.display="none"
	}
	header_icon.classList.toggle("active");
});
const options = document.querySelector("#options");
options.addEventListener("click",()=>{
	const report_client = document.querySelector("#report_client");
	if(report_client.style.display=="none"){
		report_client.style.display="block";
	}else{
		report_client.style.display="none"
	}
});
const User_Banner = document.querySelector(".User_Banner");
const exit = User_Banner.querySelector("#exit");
const banner_wrapper = document.querySelector(".banner_wrapper");
exit.addEventListener("click",()=>{
	banner_wrapper.style.display="none";
	User_Banner.classList.toggle("active");
});
banner_wrapper.addEventListener("click",()=>{
	banner_wrapper.style.display="none";
	User_Banner.classList.toggle("active");
})