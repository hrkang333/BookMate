package com.kh.bookmate.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;
@Repository
public class SellerDao {

	public int insertUser(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.insert("sellerMapper.insertSeller",s);
	}
/*
	public Seller loginSeller(SqlSessionTemplate sqlSession, Seller s) {
		Seller s1 = sqlSession.selectOne("sellerMapper.loginSeller", s);
		return s1;
	}*/

	public Seller loginSeller(SqlSessionTemplate sqlSession, String userId) {
		//Seller s1 = sqlSession.selectOne("sellerMapper.loginSeller", userId);
		return sqlSession.selectOne("sellerMapper.loginSeller", userId);
	}

	public int updateSeller(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.update("sellerMapper.updateSeller", s);
	}

	public int deleteSeller(SqlSessionTemplate sqlSession, Seller s) {
		System.out.println("-------dao -----------s" + s);
		return sqlSession.update("sellerMapper.deleteSeller", s);
	}

	/*
	 * public int insertSeller(SqlSessionTemplate sqlSession, Seller s) { return
	 * sqlSession.insert("sellerMapper.insertSeller", s); }
	 */

}
