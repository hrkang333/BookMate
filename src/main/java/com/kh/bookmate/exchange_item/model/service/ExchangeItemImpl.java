package com.kh.bookmate.exchange_item.model.service;

import java.util.List;

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

	//교환대상 인서트 
	@Override
	public void insertExchangeItem(ExchangeItem exchangeBook) {
		exchangeItemDao.insertExchangeItem(sqlSession,exchangeBook);
	}

	//관리자 교환 페이지 조회 
	@Override
	public List<ExchangeItem> selectExchangeList() {
	
		List<ExchangeItem> list = exchangeItemDao.selectExchangeList(sqlSession);
		return list;
		
	}

	@Override
	public List<ExchangeItem> selectOrderDetailNoList(List<Integer> exchangeDetailNoList) {
		List<ExchangeItem> OrderDetailList = exchangeItemDao.selectOrderDetailList(sqlSession,exchangeDetailNoList);
		return OrderDetailList;
	}
  
//	@Override
//	public int insertExchangeItem(int paymentDetailNo) {
//		
//		return exchageItemDao.insertExchangeItem(sqlSession,paymentDetailNo);
//	}

	
}
 