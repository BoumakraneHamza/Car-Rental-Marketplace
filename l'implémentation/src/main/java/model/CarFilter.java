package model;

public class CarFilter {
	private String location;
	private String pickUp_date; //YYYY-MM-DD
	private String return_date;
	private String pickUp_hour; //HH:MM
	private String return_hour;
	private String typeFilter;
	private int MaxPriceBound;
	private int MinPriceBound;
	private int carRate;
	
	
	public int getMaxPriceBound() {
		return MaxPriceBound;
	}
	public int getMinPriceBound() {
		return MinPriceBound;
	}
	public void setMaxPriceBound(int maxPriceBound) {
		MaxPriceBound = maxPriceBound;
	}
	public void setMinPriceBound(int minPriceBound) {
		MinPriceBound = minPriceBound;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPickUp_date() {
		return pickUp_date;
	}
	public void setPickUp_date(String pickUp_date) {
		this.pickUp_date = pickUp_date;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	public String getPickUp_hour() {
		return pickUp_hour;
	}
	public void setPickUp_hour(String pickUp_hour) {
		this.pickUp_hour = pickUp_hour;
	}
	public String getReturn_hour() {
		return return_hour;
	}
	public void setReturn_hour(String return_hour) {
		this.return_hour = return_hour;
	}
	public String getTypeFilter() {
		return typeFilter;
	}
	public void setTypeFilter(String typeFilter) {
		this.typeFilter = typeFilter;
	}
	public int getCarRate() {
		return carRate;
	}
	public void setCarRate(int carRate) {
		this.carRate = carRate;
	}
}
