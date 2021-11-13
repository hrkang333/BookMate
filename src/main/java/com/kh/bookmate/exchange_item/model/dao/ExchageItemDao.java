package com.kh.bookmate.exchange_item.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ExchageItemDao {

	public int insertExchangeItem(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		return sqlSession.insert("exchageItem.insertExchangeItem",paymentDetailNo);
	}

//	public void selectMyOrderListDetail(SqlSessionTemplate sqlSession, int paymentDetailNo) {
//
//			sqlSession.selectList("exchangeItem.selectMyOrderListDetail", paymentDetailNo);
//	}
//	

	
	 
 
}
 