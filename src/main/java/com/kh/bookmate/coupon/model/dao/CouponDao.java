package com.kh.bookmate.coupon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;

@Repository
public class CouponDao {

	public Coupon selectCoupon(SqlSessionTemplate sqlSession, String couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.selectCoupon",couponCode);
	}

	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSession.insert("couponMapper.insertCoupon",coupon);
	}

	
	
	// 중복 쿠폰 번호 있는지 확인하기 
	public int checkUseCoupon(SqlSessionTemplate sqlSession, String couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.checkUseCoupon",couponCode);
	}

	//테이블에서 couponcode로 포인트만 알아낼려고 받아옴 
	public int selectPoint(SqlSessionTemplate sqlSession, String couponCode) {
		return sqlSession.selectOne("couponMapper.selectPoint",couponCode);
	}

	//유즈쿠폰 보내서 아이디랑 쿠폰코드 조회해옴 
	public void selectUseCoupon(SqlSessionTemplate sqlSession, UseCoupon uc) {
		sqlSession.selectOne("couponMapper.selectUseCoupon", uc);
		
	}


}
