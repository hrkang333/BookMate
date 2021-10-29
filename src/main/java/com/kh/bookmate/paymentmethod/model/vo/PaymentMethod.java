package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentMethod {

	private int paymentMethodNo;
	private String user_Id;
	private int mainPayment;
	private int card;
	private int account;
	private int phone;
	
	public PaymentMethod() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentMethod(int paymentMethodNo, String user_Id, int mainPayment, int card, int account, int phone) {
		super();
		this.paymentMethodNo = paymentMethodNo;
		this.user_Id = user_Id;
		this.mainPayment = mainPayment;
		this.card = card;
		this.account = account;
		this.phone = phone;
	}

	public PaymentMethod(String user_Id, int mainPayment, int card) {
		super();
		this.user_Id = user_Id;
		this.mainPayment = mainPayment;
		this.card = card;
	}

	public int getPaymentMethodNo() {
		return paymentMethodNo;
	}

	public void setPaymentMethodNo(int paymentMethodNo) {
		this.paymentMethodNo = paymentMethodNo;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getMainPayment() {
		return mainPayment;
	}

	public void setMainPayment(int mainPayment) {
		this.mainPayment = mainPayment;
	}

	public int getCard() {
		return card;
	}

	public void setCard(int card) {
		this.card = card;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "PaymentMethodVo [paymentMethodNo=" + paymentMethodNo + ", user_Id=" + user_Id + ", mainPayment="
				+ mainPayment + ", card=" + card + ", account=" + account + ", phone=" + phone + "]";
	}
	
	
}
