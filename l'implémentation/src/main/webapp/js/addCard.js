const backg = document.querySelector(".wrapper");
const ctaCard = document.querySelector(".card-cta");
const cancelCard = ctaCard.querySelector("#cancel");

cancelCard.addEventListener("click",function(){
	backg.style.display="none";
});