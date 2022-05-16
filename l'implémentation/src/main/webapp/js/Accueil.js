var swiper = new Swiper(".mySwiper", {
        slidesPerView: 2,
        spaceBetween: 30,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
});
$(function() {
	const today = new Date();
	let secondDate = new Date();
	secondDate.setDate(today.getDate() + 3);
  $('input[name="range_picker"]').daterangepicker({
    startDate: today,
    endDate: secondDate,
	"minDate": new Date(),
  });
$('input[name="range_picker"]').on('apply.daterangepicker', function() {
	  let startDate = new Date($('input[name="range_picker"]').data('daterangepicker').startDate.format('YYYY-MM-DD hh:mm'));
	  let endDate = new Date($('input[name="range_picker"]').data('daterangepicker').endDate.format('YYYY-MM-DD hh:mm'));
	  let pickupdate = startDate.toLocaleString("en-GB",{
		day:"numeric",
		month:"numeric",
		year:"numeric",	
	});
	let returndate = endDate.toLocaleString("en-GB",{
		day:"numeric",
		month:"numeric",
		year:"numeric",
	});
	document.querySelector(".inputs").querySelector("#pick_up_date").value = pickupdate;
	document.querySelector(".inputs").querySelector("#return_date").value = returndate;
	});
});
