const content = document.querySelector(".content")
console.log(content)
const search = content.querySelector(".dropdownSearch")
console.log(search)
const search_box = search.querySelector(".search_box")
console.log(search_box)
const search_btn = search.getElementsByTagName("a")
console.log(search_btn)

search_btn[0].addEventListener("click", function(e) {
		e.preventDefault();
		search_box.classList.toggle('active');
});