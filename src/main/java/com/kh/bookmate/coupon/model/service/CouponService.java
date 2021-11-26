package com.kh.bookmate.coupon.model.service;

import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

public interface CouponService {

	Coupon selectCoupon(String couponCode);

	int insertCoupon(Coupon coupon);

	
	int checkUseCoupon(String couponCode);

	

	UseCoupon checkAlreadyUsedCoupon(UseCoupon uc);

	
	
	//테이블에서 포인트만 알아서 받아온다 
	void updateCoupon(UseCoupon uc, Coupon cu);

	//테이블에서 couponcode로 포인트만 알아낼려고 받아옴 
	int selectPoint(String couponCode);

	
	void selectUseCoupon(UseCoupon uc);

	
	
}
