package model;

public class Reservation {
	private int Id;
	private String email;
	private String status ; 
	private String reservation_date;
	private String pick_up_date;
	private String return_date;
	private int TotalAmount;
	private int paymentId;
	private String location;
	private String contrat;
	private String facture;
	private String timeLeft;
	private String renterName;
	private String renterImage;
	private Vehicule vehicule;
	
	public Vehicule getVehicule() {
		return vehicule;
	}
	public void setVehicule(Vehicule vehicule) {
		this.vehicule = vehicule;
	}
	
	public String getContrat() {
		return contrat;
	}
	public void setContrat(String contrat) {
		this.contrat = contrat;
	}
	public String getFacture() {
		return facture;
	}
	public void setFacture(String facture) {
		this.facture = facture;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getTotalAmount() {
		return TotalAmount;
	}
	public int getId() {
		return Id;
	}
	public String getPick_up_date() {
		return pick_up_date;
	}
	public String getReturn_date() {
		return return_date;
	}
	public String getStatus() {
		return status;
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
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTimeLeft() {
		return timeLeft;
	}
	public void setTimeLeft(String timeLeft) {
		this.timeLeft = timeLeft;
	}
	public String getRenterName() {
		return renterName;
	}
	public void setRenterName(String renterName) {
		this.renterName = renterName;
	}
	public String getRenterImage() {
		return renterImage;
	}
	public void setRenterImage(String renterImage) {
		this.renterImage = renterImage;
	}
}
