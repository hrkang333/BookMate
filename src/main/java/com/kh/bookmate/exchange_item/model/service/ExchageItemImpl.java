package com.kh.bookmate.exchange_item.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.exchange_item.model.dao.ExchageItemDao;

@Service
public class ExchageItemImpl implements ExchageItemService {
 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExchageItemDao exchageItemDao;

	@Override
	public int insertExchangeItem(int paymentDetailNo) {
		
		return exchageItemDao.insertExchangeItem(sqlSession,paymentDetailNo);
	}

//	// 상세넘버부터  목록 먼저 조회하기 
//	@Override
//	public void selectMyOrderListDetail(int paymentDetailNo) {
//		exchageItemDao.selectMyOrderListDetail(sqlSession,paymentDetailNo);
//	}
	
	
}
 