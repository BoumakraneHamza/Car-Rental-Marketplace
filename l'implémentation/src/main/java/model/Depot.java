package model;

public class Depot {
	private String code;
	private String adress;
	private int capacite;
	private int capacite_libre;
	private String agence_nom;
	private String garagiste_email;
	private String lat;
	private String lon;
	private User garagiste;
	private int CapacityPercentile;
	private int bookings;
	
	public void setGaragiste(User garagiste) {
		this.garagiste = garagiste;
	}
	public User getGaragiste() {
		return garagiste;
	}
	public void setBookings(int bookings) {
		this.bookings = bookings;
	}
	public int getBookings() {
		return bookings;
	}
	public void setCapacityPercentile(int capacityPercentile) {
		CapacityPercentile = capacityPercentile;
	}
	public int getCapacityPercentile() {
		return CapacityPercentile;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public int getCapacite() {
		return capacite;
	}
	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}
	public int getCapacite_libre() {
		return capacite_libre;
	}
	public void setCapacite_libre(int capacite_libre) {
		this.capacite_libre = capacite_libre;
	}
	public String getAgence_nom() {
		return agence_nom;
	}
	public void setAgence_nom(String agence_nom) {
		this.agence_nom = agence_nom;
	}
	public String getGaragiste_email() {
		return garagiste_email;
	}
	public void setGaragiste_email(String garagiste_email) {
		this.garagiste_email = garagiste_email;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
}
