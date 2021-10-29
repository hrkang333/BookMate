package com.kh.bookmate.coupon.model.vo;

public class UseCoupon {

	private String user_Id;
	private int couponNo;
	
	public UseCoupon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UseCoupon(String user_Id, int couponNo) {
		super();
		this.user_Id = user_Id;
		this.couponNo = couponNo;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	@Override
	public String toString() {
		return "UseCouponVo [user_Id=" + user_Id + ", couponNo=" + couponNo + "]";
	}
	
	
	
}
