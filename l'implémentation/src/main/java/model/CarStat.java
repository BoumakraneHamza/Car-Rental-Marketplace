package model;

import java.util.ArrayList;

public class CarStat {
	private String matricule;
	private int Comfort;
	private int Cleanliness;
	private int Pick_upReturn;
	private ArrayList<Review> reviews;
	
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public int getComfort() {
		return Comfort;
	}
	public void setComfort(int comfort) {
		Comfort = comfort;
	}
	public int getCleanliness() {
		return Cleanliness;
	}
	public void setCleanliness(int cleanliness) {
		Cleanliness = cleanliness;
	}
	public int getPick_upReturn() {
		return Pick_upReturn;
	}
	public void setPick_upReturn(int pick_upReturn) {
		Pick_upReturn = pick_upReturn;
	}
	public ArrayList<Review> getReviews() {
		return reviews;
	}
	public void setReviews(ArrayList<Review> reviews) {
		this.reviews = reviews;
	}
}
