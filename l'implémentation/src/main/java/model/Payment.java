package model;

public class Payment {
	private int payment_id;
	private int reservationID;
	private int montant;
	private String agence;
	private String method;
	private String date;
	private String car_name;
	private String reservation_date;
	private String pick_up_date;
	private String return_date;
	private int PLJ;
	private long duration;
	
	public int getPLJ() {
		return PLJ;
	}
	public void setPLJ(int pLJ) {
		PLJ = pLJ;
	}
	public long getDuration() {
		return duration;
	}
	public String getPick_up_date() {
		return pick_up_date;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setDuration(long duration) {
		this.duration = duration;
	}
	public void setPick_up_date(String pick_up_date) {
		this.pick_up_date = pick_up_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getReservationID() {
		return reservationID;
	}
	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;
	}
	public int getMontant() {
		return montant;
	}
	public void setMontant(int montant) {
		this.montant = montant;
	}
	public String getAgence() {
		return agence;
	}
	public void setAgence(String agence) {
		this.agence = agence;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}	
}