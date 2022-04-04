package model;

public class Reservation {
	private int Id;
	private String email;
	private String status ;
	private String Agence ; 
	private String Vehicule;
	private String reservation_date;
	private String pick_up_date;
	private String return_date;
	private String pick_up_hour;
	private String return_hour;
	private int TotalAmount;
	private int PLJ;
	private int PLH;
	private String CarImage;
	private int paymentId;
	private String location;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPLH() {
		return PLH;
	}
	public void setPLH(int pLH) {
		PLH = pLH;
	}
	public void setPLJ(int pLJ) {
		PLJ = pLJ;
	}
	public int getPLJ() {
		return PLJ;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public String getCarImage() {
		return CarImage;
	}
	public void setCarImage(String carImage) {
		CarImage = carImage;
	}
	public String getAgence() {
		return Agence;
	}
	public int getTotalAmount() {
		return TotalAmount;
	}
	public int getId() {
		return Id;
	}
	public String getPick_up_date() {
		return pick_up_date;
	}
	public String getPick_up_hour() {
		return pick_up_hour;
	}
	public String getReturn_date() {
		return return_date;
	}
	public String getReturn_hour() {
		return return_hour;
	}
	public String getStatus() {
		return status;
	}
	public String getVehicule() {
		return Vehicule;
	}
	public void setAgence(String agence) {
		Agence = agence;
	}
	public void setTotalAmount(int TotalAmount) {
		this.TotalAmount = TotalAmount;
	}
	public void setId(int id) {
		Id = id;
	}
	public void setPick_up_date(String pick_up_date) {
		this.pick_up_date = pick_up_date;
	}
	public void setPick_up_hour(String pick_up_hour) {
		this.pick_up_hour = pick_up_hour;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public void setReturn_hour(String return_hour) {
		this.return_hour = return_hour;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setVehicule(String vehicule) {
		Vehicule = vehicule;
	}

}
