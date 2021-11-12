package com.kh.bookmate.coupon.model.service;

import com.kh.bookmate.coupon.model.vo.Coupon;

public interface CouponService {

	Coupon selectCoupon(String couponCode);

	int insertCoupon(Coupon coupon);

}
