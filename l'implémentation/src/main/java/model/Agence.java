package model;

public class Agence {
	private String name ; 
	private String phone ; 
	private String Address ; 
	
	public String getAddress() {
		return Address;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
