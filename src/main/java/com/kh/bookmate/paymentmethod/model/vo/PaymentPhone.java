package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentPhone {
	
	private int paymentPhoneNo;
	private int paymentMethodNo;
	private String userPhone;
	private int userRegNo;
	private int mainPayment;
	
	public PaymentPhone() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentPhone(int paymentPhoneNo, int paymentMethodNo, String userPhone, int userRegNo, int mainPayment) {
		super();
		this.paymentPhoneNo = paymentPhoneNo;
		this.paymentMethodNo = paymentMethodNo;
		this.userPhone = userPhone;
		this.userRegNo = userRegNo;
		this.mainPayment = mainPayment;
	}

	public PaymentPhone(int paymentMethodNo, String userPhone, int userRegNo, int mainPayment) {
		super();
		this.paymentMethodNo = paymentMethodNo;
		this.userPhone = userPhone;
		this.userRegNo = userRegNo;
		this.mainPayment = mainPayment;
	}

	public int getPaymentPhoneNo() {
		return paymentPhoneNo;
	}

	public void setPaymentPhoneNo(int paymentPhoneNo) {
		this.paymentPhoneNo = paymentPhoneNo;
	}

	public int getPaymentMethodNo() {
		return paymentMethodNo;
	}

	public void setPaymentMethodNo(int paymentMethodNo) {
		this.paymentMethodNo = paymentMethodNo;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getUserRegNo() {
		return userRegNo;
	}

	public void setUserRegNo(int userRegNo) {
		this.userRegNo = userRegNo;
	}

	public int getMainPayment() {
		return mainPayment;
	}

	public void setMainPayment(int mainPayment) {
		this.mainPayment = mainPayment;
	}

	@Override
	public String toString() {
		return "PaymentPhoneVo [paymentPhoneNo=" + paymentPhoneNo + ", paymentMethodNo=" + paymentMethodNo
				+ ", userPhone=" + userPhone + ", userRegNo=" + userRegNo + ", mainPayment=" + mainPayment + "]";
	}
	
	

}
