package model;

public class CarFilter {
	private String location;
	private String pickUp_date; //YYYY-MM-DD
	private String return_date;
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
