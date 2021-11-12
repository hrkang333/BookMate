package com.kh.bookmate.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;

@Controller
public class AdminController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping(value = "checkCouponCode.cp", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String insertCouponCheck(String couponCode) {
		
		Coupon coupon = couponService.selectCoupon(couponCode);
		
		if(coupon!=null) {
			
			return coupon.getCouponPoint()+"";
			
		}
		
		return "pass";
		
	}
	
	@RequestMapping("adminPageOpen.ad")
	public String adminPageOpen() {
		return "admin/adminInsertCoupon";
	}

	
	@RequestMapping("insertCoupon.cp")
	@ResponseBody
	public String insertCoupon(Coupon coupon) {
		int result = couponService.insertCoupon(coupon);
		if(result > 0 )
		return "success";
		return "fail";
		
	}
}
