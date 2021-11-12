package com.kh.bookmate.exchange_item.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.exchange_item.model.dao.ExchageItemDao;
import com.kh.bookmate.exchange_item.model.vo.ExchageItem;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Service
public class ExchageItemImpl implements ExchageItemService {
 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExchageItemDao exchageItemDao;
	
	@Override
	public List<ExchageItem> insertExchangeItem(List<PaymentDetail> myOrderListDetail) {

		List<ExchageItem> list = new ArrayList<>();

		int result = exchageItemDao.insertExchangeItem(sqlSession, myOrderListDetail);

		if (result > 0) {
			
			list.add(result);
			 
		} else {
			throw new RuntimeException("교환신청 실패");
		}

		return list;
	}


	
	
	
	
	
	
//	// 교환 테이블 리스트 먼저 조회..? 
//	@Override
//	public List<ExchageItem> ExchangeItemList(List<PaymentDetail> myOrderListDetail) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
}
 