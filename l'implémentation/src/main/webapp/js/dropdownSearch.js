const content = document.querySelector(".content")
const search = content.querySelector(".dropdownSearch")
const search_box = search.querySelector(".search_box")
const search_btn = search.getElementsByTagName("a")


search_btn[0].addEventListener("click", function(e) {
		e.preventDefault();
		search_box.classList.toggle('active');
});