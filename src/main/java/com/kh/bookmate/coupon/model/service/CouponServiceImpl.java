package com.kh.bookmate.coupon.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.coupon.model.dao.CouponDao;
import com.kh.bookmate.coupon.model.dao.UseCouponDao;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private UseCouponDao useCouponDao;
	
	@Autowired
	private UserDao userDao;
	
	
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


	//쿠폰코드 중복체크 
	@Override
	public int checkUseCoupon(String couponCode) {
		return couponDao.checkUseCoupon(sqlSession, couponCode);
	}
	

	
	//coupon -> usecoupon 으로 인서트 
	// user테이블의 point 컬럼 업데이트  
	@Override
	public void updateCoupon(UseCoupon uc, Coupon cu) {
		// TODO Auto-generated method stub
		useCouponDao.insertUsedCouponCode(sqlSession, uc);
		//기존에 coupon 에 있던 couponcode와 user_id를 userCoupon은 다 쓴걸 넣어준다
		
		List<Object> redeem = new ArrayList<Object>();
		redeem.add(cu.getCouponPoint());
		redeem.add(uc.getUser_Id());
		
		int result = userDao.updateGetUserPoint(sqlSession,redeem);
			if(result < 0) {
				throw new RuntimeException("유저 포인트 업데이트 오류");
			}
			
		//user 테이블 포인트를 업데이트 시켜준다 
	//	userDao.updateUserPoint1(sqlSession, uc);

	}




	//사용된 쿠폰 테이블에서 체크조회 
	@Override
	public UseCoupon checkAlreadyUsedCoupon(UseCoupon uc) {
		return useCouponDao.checkAlreadyUsedCoupon(sqlSession, uc);
	}

	//테이블에서 couponcode로 포인트만 알아낼려고  받아옴 
	@Override
	public int selectPoint(String couponCode) {
		int point = couponDao.selectPoint(sqlSession,couponCode);
		return point;
	}

	
	@Override
	public void selectUseCoupon(UseCoupon uc) {
		couponDao.selectUseCoupon(sqlSession, uc);
		
	}

	

	


}
