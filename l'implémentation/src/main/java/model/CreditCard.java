package model;

import com.stripe.model.PaymentMethod;

public class CreditCard {
	private String CardNumber;
	private String exp_month;
	private String exp_year;
	private String cvc;
	private PaymentMethod methodInfo;
	
	public PaymentMethod getMethod() {
		return methodInfo;
	}
	public void setMethodInfo(PaymentMethod methodInfo) {
		this.methodInfo = methodInfo;
	}
	public String getCardNumber() {
		return CardNumber;
	}
	public String getCvc() {
		return cvc;
	}
	public String getExp_month() {
		return exp_month;
	}
	public String getExp_year() {
		return exp_year;
	}
	public void setCardNumber(String cardNumber) {
		CardNumber = cardNumber;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public void setExp_month(String exp_month) {
		this.exp_month = exp_month;
	}
	public void setExp_year(String exp_year) {
		this.exp_year = exp_year;
	}
	
}
