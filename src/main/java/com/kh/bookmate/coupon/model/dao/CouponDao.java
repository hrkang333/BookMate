package com.kh.bookmate.coupon.model.dao;

import java.util.List;

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

	public List<UseCoupon> selectCouponList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("couponMapper.selectCouponList");
	}

	public Coupon checkCoupon(SqlSessionTemplate sqlSession, String couponCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("couponMapper.checkCoupon",couponCode);
	}

}
