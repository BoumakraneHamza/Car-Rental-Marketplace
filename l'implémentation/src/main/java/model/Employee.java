package model;

public class Employee extends User {
	private String workingLocation;
	private String monthlySession;
	private String AgencyName;
	
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
}
