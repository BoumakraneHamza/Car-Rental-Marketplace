package model;

public class Transaction {
	private int amount;
	private String agence;
	private String method;
	
	public String getAgence() {
		return agence;
	}
	public int getAmount() {
		return amount;
	}
	public String getMethod() {
		return method;
	}
	public void setAgence(String agence) {
		this.agence = agence;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setMethod(String method) {
		this.method = method;
	}

}
