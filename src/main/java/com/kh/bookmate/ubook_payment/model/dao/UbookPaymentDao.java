package com.kh.bookmate.ubook_payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;

@Repository
public class UbookPaymentDao {

	//결제정보 등록
	public int insertUbookPayment(SqlSessionTemplate sqlSession, UbookPayment temp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ubookPaymentMapper.insertUbookPayment",temp);
	}

	public int insertUbookPaymentDetail(SqlSessionTemplate sqlSession, UbookPaymentDetail upd) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ubookPaymentMapper.insertUbookPaymentDetailUb",upd);
	}


	
} 


