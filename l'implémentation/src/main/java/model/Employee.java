package model;

public class Employee {
	private String email;
	private String firstName;
	private String lastName;
	private String image;
	private String workingLocation;
	private String monthlySession;
	private String AgencyName;
	private String type;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWorkingLocation() {
		return workingLocation;
	}
	public void setWorkingLocation(String workingLocation) {
		this.workingLocation = workingLocation;
	}
	public String getMonthlySession() {
		return monthlySession;
	}
	public void setMonthlySession(String monthlySession) {
		this.monthlySession = monthlySession;
	}
	public String getAgencyName() {
		return AgencyName;
	}
	public void setAgencyName(String agencyName) {
		AgencyName = agencyName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
