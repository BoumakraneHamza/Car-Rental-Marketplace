package model;

public class CarFilter {
	private String location;
	private String location_LAT;
	private String location_Lon;
	private String pickUp_date; //YYYY-MM-DD
	private String return_date;
	private String typeFilter;
	private int MaxPriceBound;
	private int MinPriceBound;
	private int carRate;
	
	public String getLocation_LAT() {
		return location_LAT;
	}
	public String getLocation_Lon() {
		return location_Lon;
	}
	public void setLocation_LAT(String location_LAT) {
		this.location_LAT = location_LAT;
	}
	public void setLocation_Lon(String location_Lon) {
		this.location_Lon = location_Lon;
	}
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
