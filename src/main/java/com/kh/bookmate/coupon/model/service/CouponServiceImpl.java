package com.kh.bookmate.coupon.model.service;

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

//	@Override
//	public List<UseCoupon> selectCouponList() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Coupon checkCoupon(String couponCode) {
//		
//		return couponDao.checkCoupon(sqlSession,couponCode);
//	}

	
//	//쿠폰 중복 찾기..? 
//	@Override // 이 객체에 맞는 유저아이디가 있는지 
//	public UseCoupon searchCouponUserId(String couponCode) {
//		return couponDao.searchCouponUserId(sqlSession,couponCode);
//	}

	
	
	
	
	//쿠폰코드 중복체크 
	@Override
	public int checkUseCoupon(String couponCode) {
		return couponDao.checkUseCoupon(sqlSession, couponCode);
	}

	


}
