package com.kh.bookmate.payment.model.vo;

import java.util.Date;

public class Payment {

	private int paymentNo;
	private String user_Id;
	private String shippingName;
	private String shippingAddress;
	private String shippingPhone;
	private String deliveryRequest;
	private Date shipDate;
	private int usePoint;
	private int totalCost;
	private String paymentMethod;
	private int getPoint;
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int paymentNo, String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, Date shipDate, int usePoint, int totalCost, String paymentMethod, int getPoint) {
		super();
		this.paymentNo = paymentNo;
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.shipDate = shipDate;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.getPoint = getPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone, int totalCost,
			String paymentMethod, int getPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.getPoint = getPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			int usePoint, int totalCost, String paymentMethod, int getPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.getPoint = getPoint;
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, int totalCost, String paymentMethod, int getPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.getPoint = getPoint;		
	}

	public Payment(String user_Id, String shippingName, String shippingAddress, String shippingPhone,
			String deliveryRequest, int usePoint, int totalCost, String paymentMethod, int getPoint) {
		super();
		this.user_Id = user_Id;
		this.shippingName = shippingName;
		this.shippingAddress = shippingAddress;
		this.shippingPhone = shippingPhone;
		this.deliveryRequest = deliveryRequest;
		this.usePoint = usePoint;
		this.totalCost = totalCost;
		this.paymentMethod = paymentMethod;
		this.getPoint = getPoint;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getShippingPhone() {
		return shippingPhone;
	}

	public void setShippingPhone(String shippingPhone) {
		this.shippingPhone = shippingPhone;
	}

	public String getDeliveryRequest() {
		return deliveryRequest;
	}

	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}

	public Date getShipDate() {
		return shipDate;
	}

	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

	@Override
	public String toString() {
		return "PaymentVo [paymentNo=" + paymentNo + ", user_Id=" + user_Id + ", shippingName=" + shippingName
				+ ", shippingAddress=" + shippingAddress + ", shippingPhone=" + shippingPhone + ", deliveryRequest="
				+ deliveryRequest + ", shipDate=" + shipDate + ", usePoint=" + usePoint + ", totalCost=" + totalCost
				+ ", paymentMethod=" + paymentMethod + ", getPoint=" + getPoint + "]";
	}
	
	
	
	
}
