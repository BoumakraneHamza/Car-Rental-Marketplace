package model;

public class Transaction {
	private int Total;
	private int Insurance;
	private String method;
	private String status;
	
	public int getInsurance() {
		return Insurance;
	}
	public String getMethod() {
		return method;
	}
	public String getStatus() {
		return status;
	}
	public int getTotal() {
		return Total;
	}
	public void setInsurance(int insurance) {
		Insurance = insurance;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setTotal(int total) {
		Total = total;
	}

}
