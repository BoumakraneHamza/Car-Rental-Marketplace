package model;

import java.util.ArrayList;

public class Depot extends Building{
	private int capacite;
	private int capacite_libre;
	private int CapacityPercentile;
	private ArrayList<Vehicule> storedCars = new ArrayList<Vehicule>();
	
	public Depot() {
		super();
		setType("depot");
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
	public Employee getGaragiste() {
		return this.getEmployee();
	}
	public void setGaragiste(Employee garagiste) {
		setEmployee(garagiste);
	}
	public int getCapacityPercentile() {
		return CapacityPercentile;
	}
	public void setCapacityPercentile(int capacityPercentile) {
		CapacityPercentile = capacityPercentile;
	}
	public String getGaragiste_email() {
		return super.getEmployee_email();
	}
	public void setGaragiste_email(String garagiste_email) {
		super.setEmployee_email(garagiste_email);
	}
	public void setStoredCars(ArrayList<Vehicule> storedCars) {
		this.storedCars = storedCars;
	}
	public ArrayList<Vehicule> getStoredCars() {
		return storedCars;
	}
}
