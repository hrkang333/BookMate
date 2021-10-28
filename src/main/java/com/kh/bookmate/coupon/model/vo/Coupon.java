package com.kh.bookmate.coupon.model.vo;

import java.util.Date;

public class Coupon {
	
	private int couponNo;
	private String couponCode;
	private int couponPoint;
	private Date couponStartDate;
	private Date couponEndDate;
	
	public Coupon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Coupon(int couponNo, String couponCode, int couponPoint, Date couponStartDate, Date couponEndDate) {
		super();
		this.couponNo = couponNo;
		this.couponCode = couponCode;
		this.couponPoint = couponPoint;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
	}

	public Coupon(String couponCode, int couponPoint) {
		super();
		this.couponCode = couponCode;
		this.couponPoint = couponPoint;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public int getCouponPoint() {
		return couponPoint;
	}

	public void setCouponPoint(int couponPoint) {
		this.couponPoint = couponPoint;
	}

	public Date getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(Date couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public Date getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(Date couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	@Override
	public String toString() {
		return "CouponVo [couponNo=" + couponNo + ", couponCode=" + couponCode + ", couponPoint=" + couponPoint
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + "]";
	}
	
	
	
}
