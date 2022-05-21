package model;

public class PaymentMethods {
	private String CardOwner;
	private String paymentMethods;
	
	public String getCardOwner() {
		return CardOwner;
	}
	public void setCardOwner(String cardOwner) {
		CardOwner = cardOwner;
	}
	public String getPaymentMethods() {
		return paymentMethods;
	}
	public void setPaymentMethods(String paymentMethods) {
		this.paymentMethods = paymentMethods;
	}
}
