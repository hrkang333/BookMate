package com.kh.bookmate.exchange_item.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.exchange_item.model.dao.ExchangeItemDao;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
 
@Service
public class ExchangeItemImpl implements ExchangeItemService {
 
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExchangeItemDao exchangeItemDao;

	@Override
	public void insertExchangeItem(ExchangeItem exchangeBook) {
		exchangeItemDao.insertExchangeItem(sqlSession,exchangeBook);
	}
  
//	@Override
//	public int insertExchangeItem(int paymentDetailNo) {
//		
//		return exchageItemDao.insertExchangeItem(sqlSession,paymentDetailNo);
//	}

	
}
 