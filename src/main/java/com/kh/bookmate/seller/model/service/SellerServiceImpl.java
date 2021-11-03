package com.kh.bookmate.seller.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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
	public void insertSeller(Seller s) {
		int result = sellerDao.insertUser(sqlSession, s);
	}

	@Override
	public Seller loginSeller(String userId) {
		Seller loginSeller = sellerDao.loginSeller(sqlSession, userId);
		return loginSeller;
	}


	/*
	 * @Override public void inserSeller(Seller s) { int result =
	 * sellerDao.insertSeller(sqlSession, s);
	 * 
	 * }
	 */


}
