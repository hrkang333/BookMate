package com.kh.bookmate.paymentmethod.model.vo;

public class PaymentCard {
	
	private int paymentCardNo;
	private int paymentMethodNo;
	private String userCardNo;
	private int userCardCVC;
	private String userCardDate;
	private int mainPayment;
	
	public PaymentCard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentCard(int paymentCardNo, int paymentMethodNo, String userCardNo, int userCardCVC,
			String userCardDate, int mainPayment) {
		super();
		this.paymentCardNo = paymentCardNo;
		this.paymentMethodNo = paymentMethodNo;
		this.userCardNo = userCardNo;
		this.userCardCVC = userCardCVC;
		this.userCardDate = userCardDate;
		this.mainPayment = mainPayment;
	}

	public PaymentCard(int paymentMethodNo, String userCardNo, int userCardCVC, String userCardDate,
			int mainPayment) {
		super();
		this.paymentMethodNo = paymentMethodNo;
		this.userCardNo = userCardNo;
		this.userCardCVC = userCardCVC;
		this.userCardDate = userCardDate;
		this.mainPayment = mainPayment;
	}

	public int getPaymentCardNo() {
		return paymentCardNo;
	}

	public void setPaymentCardNo(int paymentCardNo) {
		this.paymentCardNo = paymentCardNo;
	}

	public int getPaymentMethodNo() {
		return paymentMethodNo;
	}

	public void setPaymentMethodNo(int paymentMethodNo) {
		this.paymentMethodNo = paymentMethodNo;
	}

	public String getUserCardNo() {
		return userCardNo;
	}

	public void setUserCardNo(String userCardNo) {
		this.userCardNo = userCardNo;
	}

	public int getUserCardCVC() {
		return userCardCVC;
	}

	public void setUserCardCVC(int userCardCVC) {
		this.userCardCVC = userCardCVC;
	}

	public String getUserCardDate() {
		return userCardDate;
	}

	public void setUserCardDate(String userCardDate) {
		this.userCardDate = userCardDate;
	}

	public int getMainPayment() {
		return mainPayment;
	}

	public void setMainPayment(int mainPayment) {
		this.mainPayment = mainPayment;
	}

	@Override
	public String toString() {
		return "PaymentCardVo [paymentCardNo=" + paymentCardNo + ", paymentMethodNo=" + paymentMethodNo
				+ ", userCardNo=" + userCardNo + ", userCardCVC=" + userCardCVC + ", userCardDate=" + userCardDate
				+ ", mainPayment=" + mainPayment + "]";
	}
	
	

}
