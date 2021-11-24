package com.kh.bookmate.coupon.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.coupon.model.dao.CouponDao;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

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

	@Override
	public List<UseCoupon> selectCouponList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Coupon checkCoupon(String couponCode) {
		
		return couponDao.checkCoupon(sqlSession,couponCode);
	}



}
