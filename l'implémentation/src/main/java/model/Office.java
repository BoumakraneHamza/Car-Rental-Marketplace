package model;


public class Office extends Building{
	private String AvailableTime;
	
	public Office() {
		super();
		setType("office");
	}
	
	public String getAvailableTime() {
		return AvailableTime;
	}
	public void setAvailableTime(String availableTime) {
		AvailableTime = availableTime;
	}
	public String getSecretary_email() {
		return this.getEmployee_email();
	}
	public void setSecretary_email(String garagiste_email) {
		this.setEmployee_email(garagiste_email);
	}
	public Employee getSecretary() {
		return this.getEmployee();
	}
	public void setSecretary(Employee secretary) {
		this.setEmployee(secretary);
	}
}
