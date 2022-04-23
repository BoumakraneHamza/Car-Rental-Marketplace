package model;

public class Garagiste {
	private String working_location;
	private String Agency_name;
	private String Monthly_session;
	
	public String getAgency_name() {
		return Agency_name;
	}
	public String getMonthly_session() {
		return Monthly_session;
	}
	public String getWorking_location() {
		return working_location;
	}
	public void setAgency_name(String agency_name) {
		Agency_name = agency_name;
	}
	public void setMonthly_session(String monthly_session) {
		Monthly_session = monthly_session;
	}
	public void setWorking_location(String working_location) {
		this.working_location = working_location;
	}
}
