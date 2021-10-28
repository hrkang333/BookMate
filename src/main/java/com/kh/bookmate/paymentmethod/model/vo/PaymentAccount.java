package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentAccount {
	
	private int paymentAccountNo;
	private int paymentMethodNo;
	private int userAccountNo;
	private String userBank;
	private int userRegNo;
	private int mainPayment;
	
	public PaymentAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentAccount(int paymentAccountNo, int paymentMethodNo, int userAccountNo, String userBank,
			int userRegNo, int mainPayment) {
		super();
		this.paymentAccountNo = paymentAccountNo;
		this.paymentMethodNo = paymentMethodNo;
		this.userAccountNo = userAccountNo;
		this.userBank = userBank;
		this.userRegNo = userRegNo;
		this.mainPayment = mainPayment;
	}

	public PaymentAccount(int paymentMethodNo, int userAccountNo, String userBank, int userRegNo, int mainPayment) {
		super();
		this.paymentMethodNo = paymentMethodNo;
		this.userAccountNo = userAccountNo;
		this.userBank = userBank;
		this.userRegNo = userRegNo;
		this.mainPayment = mainPayment;
	}

	public int getPaymentAccountNo() {
		return paymentAccountNo;
	}

	public void setPaymentAccountNo(int paymentAccountNo) {
		this.paymentAccountNo = paymentAccountNo;
	}

	public int getPaymentMethodNo() {
		return paymentMethodNo;
	}

	public void setPaymentMethodNo(int paymentMethodNo) {
		this.paymentMethodNo = paymentMethodNo;
	}

	public int getUserAccountNo() {
		return userAccountNo;
	}

	public void setUserAccountNo(int userAccountNo) {
		this.userAccountNo = userAccountNo;
	}

	public String getUserBank() {
		return userBank;
	}

	public void setUserBank(String userBank) {
		this.userBank = userBank;
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
		return "PaymentAccountVo [paymentAccountNo=" + paymentAccountNo + ", paymentMethodNo=" + paymentMethodNo
				+ ", userAccountNo=" + userAccountNo + ", userBank=" + userBank + ", userRegNo=" + userRegNo
				+ ", mainPayment=" + mainPayment + "]";
	}
	
	
	
	
	

}
