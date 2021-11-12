package com.kh.bookmate.coupon.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.coupon.model.dao.CouponDao;
import com.kh.bookmate.coupon.model.vo.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Coupon selectCoupon(String couponCode) {
		// TODO Auto-generated method stub
		return couponDao.selectCoupon(sqlSession,couponCode);
	}

	@Override
	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return couponDao.insertCoupon(sqlSession,coupon);
	}

}
