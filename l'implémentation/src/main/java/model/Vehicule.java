package model;

public class Vehicule {

	private String matricule;
	private String marque;
	private String modele;
	private Double PLJ;
	private Double PLH;
	private String type;
	private String etat;
	private String image;
	private String depot_code;
	private String Agence;
	
	
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
	public Double getPLJ() {
		return PLJ;
	}
	public void setPLJ(Double pLJ) {
		PLJ = pLJ;
	}
	public Double getPLH() {
		return PLH;
	}
	public void setPLH(Double pLH) {
		PLH = pLH;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
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
