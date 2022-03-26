package model;

public class search {
	private String location;
	private String date_1;
	private String date_2;
	private String hour_1;
	private String hour_2;
	
	public String getDate_1() {
		return date_1;
	}
	public String getDate_2() {
		return date_2;
	}
	public String getLocation() {
		return location;
	}
	public void setDate_1(String date_1) {
		this.date_1 = date_1;
	}
	public void setDate_2(String date_2) {
		this.date_2 = date_2;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getHour_1() {
		return hour_1;
	}
	public String getHour_2() {
		return hour_2;
	}
	public void setHour_1(String hour_1) {
		this.hour_1 = hour_1;
	}
	public void setHour_2(String hour_2) {
		this.hour_2 = hour_2;
	}
}
