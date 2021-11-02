package com.kh.bookmate.seller.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

@Repository
public class SellerDao {
/*
	public Seller loginSeller(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}*/

	public int insertSeller(SqlSession sqlSession, Seller s) {
		return sqlSession.insert("sellerMapper.insertSeller",s);
	}

	public Seller loginSeller(SqlSessionTemplate sqlSession, User u, Seller s) {

		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}

}
