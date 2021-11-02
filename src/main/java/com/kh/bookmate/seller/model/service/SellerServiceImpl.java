package com.kh.bookmate.seller.model.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.bookmate.seller.model.dao.SellerDao;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SellerDao sellerDao;

	@Override
	public Seller loginSeller(BCryptPasswordEncoder bCryptPasswordEncoder, User u, Seller s) {
		Seller loginSeller = sellerDao.loginSeller(sqlSession, u, s);
		
		return loginSeller;
	}
	/*
	@Override
	public Seller loginSeller(User u, Seller s) {
		Seller loginSeller = sellerDao.loginSeller(sqlSession, u, s);
		
		return loginSeller;
	}*/
	
	@Override
	public void insertSeller(Seller s) {
		int result = sellerDao.insertSeller(sqlSession,s);
		if(result < 0 ) {
			throw new RuntimeException("판매자 가입 실패");
		}
	}

	
}
