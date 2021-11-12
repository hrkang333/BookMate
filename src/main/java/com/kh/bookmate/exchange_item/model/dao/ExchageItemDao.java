package com.kh.bookmate.exchange_item.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Repository
public class ExchageItemDao {

	public int insertExchangeItem(SqlSessionTemplate sqlSession, List<PaymentDetail> myOrderListDetail) {
		// TODO Auto-generated method stub
		return 0;
	}
	 

}
