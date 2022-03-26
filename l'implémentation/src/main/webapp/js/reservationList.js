const filters = document.querySelector("#filters")
const all = filters.querySelector("#All")
const progress= filters.querySelector("#progress")
const completed = filters.querySelector("#Completed")
const allBookings= document.getElementsByClassName("full")
const bookings = all
console.log(bookings)


function deactivate(element){
	element.style.background="none";
	element.style.border="2px solid #EFEFEF";
	element.style.fontWeight="500";
	element.style.color="#000";
}
function activate(element){
	element.style.background="#F6AA1C";
	element.style.color="#fff";
	element.style.fontWeight="600";
	element.style.border="none";
}

all.addEventListener('click',function(e){
	e.preventDefault();
	activate(all);
	deactivate(progress);
	deactivate(completed);
});

progress.addEventListener('click',function(e){
	e.preventDefault();
	activate(progress);
	deactivate(all);
	deactivate(completed);
});

completed.addEventListener('click',function(e){
	e.preventDefault();
	activate(completed);
	deactivate(progress);
	deactivate(all);
});

function show_details(element){
	const Booking = element;
	const details = Booking.parentNode.querySelector(".details");
	Booking.classList.toggle("active");
	details.classList.toggle("active");
}