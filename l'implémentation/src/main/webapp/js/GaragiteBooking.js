$(function() {
  $('input[name="range_picker"]').daterangepicker({
    timePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().endOf('day'),//.add(1, 'hour'),
    locale: {
      format: 'YY/MM/DD HH:MM'
    }
  });
});

function filterByDate(element) {
	var rangeStart = element.split(' - ')[0];
	var rangeEnd = element.split(' - ')[1];
	console.log('pickup = ' + rangeStart + ', rangeEnd = ' + rangeEnd);
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var reservations = JSON.parse(this.responseText);
		
		document.getElementById("reservationsContainer").innerHTML = '';
		for(reservation of reservations) {
			showReservations(reservation);
		}
	}
	xhttp.open("POST","GaragisteBookings");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("rangeStart="+rangeStart+"&rangeEnd="+rangeEnd);
}

function showReservations(reserv) {
	var reservation = document.createElement('div');
	reservation.setAttribute('id','booking');
	
	reservation.innerHTML = '<span>'+reserv.renterName+'</span>\n\
							<span>'+reserv.vehicule.marque+' '+reserv.vehicule.modele+'</span>\n\
							<span>'+reserv.pick_up_date+'</span>\n\
							<span>'+reserv.return_date+'</span>';
	
	const bookingList = document.getElementById("reservationsContainer");
	bookingList.appendChild(reservation);
}
