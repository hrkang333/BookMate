package com.kh.bookmate.exchange_item.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;

@Repository
public class ExchangeItemDao {

	public void insertExchangeItem(SqlSessionTemplate sqlSession, ExchangeItem exchangeBook) {
	
		sqlSession.insert("ExchangeItemMapper.insertExchangeItem",exchangeBook);
	}




	  
 
}
 