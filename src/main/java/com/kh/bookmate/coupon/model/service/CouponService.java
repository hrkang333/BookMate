package com.kh.bookmate.coupon.model.service;

import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

public interface CouponService {

	Coupon selectCoupon(String couponCode);

	int insertCoupon(Coupon coupon);

	
	int checkUseCoupon(String couponCode);

	
//	//쿠폰리스트 조회하기 
//	List<UseCoupon> selectCouponList();
//
//	Coupon checkCoupon(String couponCode);

	
}
