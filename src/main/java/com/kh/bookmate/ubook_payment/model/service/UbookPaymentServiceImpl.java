package com.kh.bookmate.ubook_payment.model.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_payment.model.dao.UbookPaymentDao;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class UbookPaymentServiceImpl implements UbookPaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Autowired 
	private UbookPaymentDao ubookPaymentDao;
 

	@Override
	public void insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list) {
		
		int result = ubookPaymentDao.insertUbookPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNoUb = temp.getPaymentNoUb();
		for(UbookPaymentDetail upd : list) {
			upd.setPaymentNoUb(paymentNoUb);
			int result2 = ubookPaymentDao.insertUbookPaymentDetail(sqlSession,upd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
	}

	
}
