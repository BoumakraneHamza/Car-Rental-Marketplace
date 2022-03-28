package model;

public class CreditCards {
	private String CardNumber;
	private String exp;
	private String OwnerName;
	
	public String getCardNumber() {
		return CardNumber;
	}
	public String getExp() {
		return exp;
	}
	public String getOwnerName() {
		return OwnerName;
	}
	public void setCardNumber(String cardNumber) {
		CardNumber = cardNumber;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public void setOwnerName(String ownerName) {
		OwnerName = ownerName;
	}
}
