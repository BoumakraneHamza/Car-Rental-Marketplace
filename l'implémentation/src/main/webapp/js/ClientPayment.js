function show_details(element){
	const button = element;
	const transaction = element.parentNode;
	const details = transaction.parentNode.querySelector(".details");
	transaction.classList.toggle("active");
	details.classList.toggle("active");
}