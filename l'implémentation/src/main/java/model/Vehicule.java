package model;

public class Vehicule {

	private String matricule;
	private String marque;
	private String modele;
	private int PLJ;
	private int PLH;
	private String type;
	private String image;
	private String depot_code;
	private String Agence;
	private String color;
	private int Year;
	private int NumberSeats;
	private int NumberDoors;
	private int NumberSuitCase;
	private String Mileage;
	private double AverageRating;
	private double ComfortRating;
	private double CleanlinessRating;
	private double PickReturnRating;
	private double ValueMoneyRating;
	
	public void setAverageRating(double averageRating) {
		AverageRating = averageRating;
	}
	public void setCleanlinessRating(double cleanlinessRating) {
		CleanlinessRating = cleanlinessRating;
	}
	public void setComfortRating(double comfortRating) {
		ComfortRating = comfortRating;
	}
	public void setPickReturnRating(double pickReturnRating) {
		PickReturnRating = pickReturnRating;
	}
	public void setValueMoneyRating(double valueMoneyRating) {
		ValueMoneyRating = valueMoneyRating;
	}
	public double getAverageRating() {
		return AverageRating;
	}
	public double getCleanlinessRating() {
		return CleanlinessRating;
	}
	public double getComfortRating() {
		return ComfortRating;
	}
	public double getPickReturnRating() {
		return PickReturnRating;
	}
	public double getValueMoneyRating() {
		return ValueMoneyRating;
	}
	public String getMileage() {
		return Mileage;
	}
	public void setMileage(String mileage) {
		Mileage = mileage;
	}
	public void setNumberDoors(int numberDoors) {
		NumberDoors = numberDoors;
	}
	public void setNumberSeats(int numberSeats) {
		NumberSeats = numberSeats;
	}
	public void setNumberSuitCase(int numberSuitCase) {
		NumberSuitCase = numberSuitCase;
	}
	public int getNumberDoors() {
		return NumberDoors;
	}
	public int getNumberSeats() {
		return NumberSeats;
	}
	public int getNumberSuitCase() {
		return NumberSuitCase;
	}
	public int getYear() {
		return Year;
	}
	public void setYear(int year) {
		Year = year;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getAgence() {
		return Agence;
	}
	public void setAgence(String agence) {
		Agence = agence;
	}
	
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getModele() {
		return modele;
	}
	public void setModele(String modele) {
		this.modele = modele;
	}
	public int getPLJ() {
		return PLJ;
	}
	public void setPLJ(int pLJ) {
		PLJ = pLJ;
	}
	public int getPLH() {
		return PLH;
	}
	public void setPLH(int pLH) {
		PLH = pLH;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDepot_code() {
		return depot_code;
	}
	public void setDepot_code(String depot_code) {
		this.depot_code = depot_code;
	}
}
