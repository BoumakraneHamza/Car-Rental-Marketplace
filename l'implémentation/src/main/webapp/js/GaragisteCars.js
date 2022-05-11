const stat1 = document.querySelector("#stat1").getContext("2d");
const sidebar = document.querySelector(".sidebar");

let char1 = new Chart(stat1 ,{
	type:'radar',
	data:{
		labels:['Comfort','Cleanliness','Pick_up&Return'],
		datasets:[{
			label:'Reviews',
			data:[],
			backgroundColor:'rgba(177, 150, 234, 0.2)',
			borderColor:'rgb(177, 150, 234)',
			pointBorderColor: '#fff',
   			pointHoverBackgroundColor: '#fff',
    		pointHoverBorderColor: 'rgb(177, 150, 234)',
    	}]
    },
    options:{
		fill:true,
	    responsive:true,
		maintainAspectRatio: false,
	}
});

function showStat(matricule){
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var carStat = JSON.parse(this.responseText);
		
		var data1 = [carStat.comfort, carStat.cleanliness, carStat.pick_upReturn];
		char1.data.datasets[0].data = data1;
		char1.update();
		
		showReviews(carStat.reviews);
	}
	xhttp.open("GET","AjaxCarStat?matricule="+matricule);
	xhttp.send();
	
	sidebar.style.display="flex";
}
function hideStat(){
	sidebar.style.display="none";
}

function showReviews(reviews) {
	const reviewList = document.getElementById("review_list");
	reviewList.innerHTML = '';
	
	for(rev of reviews) {
		var review = document.createElement('div');
		review.setAttribute('id','review');
		
		review.innerHTML = '<div id="renter">\n\
								<div id="renter_image">\n\
									<img style="width:40px" src="'+contextPath+'/assets/profile_pics/1email.png">\n\
								</div>\n\
								<div id="verticatl_line"></div>\n\
							</div>\n\
							<div id="content">\n\
								<p id="renter_name">'+rev.renterName+'</p>\n\
								<p id="review_content">'+rev.reviewText+'</p>\n\
								<p id="date">'+rev.date+'</p>\n\
							</div>';
		
		reviewList.appendChild(review);
	}
}
