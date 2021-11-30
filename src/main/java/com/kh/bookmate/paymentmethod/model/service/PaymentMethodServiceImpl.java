package com.kh.bookmate.paymentmethod.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.paymentmethod.model.dao.PaymentMethodDao;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PaymentMethodDao paymentMethodDao; 

	@Override
	public PaymentMethod selectPaymentMethod(String user_Id) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPaymentMethod(sqlSession,user_Id);
	}

	@Override
	public void insertPaymentMethod(String user_Id) {
		paymentMethodDao.insertPaymentMethod(sqlSession,user_Id);
		
		
	}

	

	@Override
	public List<PaymentMethodDetail> selectPMDetailList(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPMDetailList(sqlSession,paymentMethod);
	}

	@Override
	public int insertPMDetail(PaymentMethod paymentMethod, PaymentMethodDetail PMDetail) {
		int result2 = 1;
		int paymentMethodDetailNo = paymentMethodDao.insertPMDetail(sqlSession,PMDetail);
		
		if(paymentMethod.getMainPayment()==0) {
			result2 = paymentMethodDao.updateMainMethod(sqlSession,PMDetail.getUser_Id());
		}
		if(paymentMethodDetailNo*result2 < 1) {
			throw new RuntimeException("결제 저장수단 등록 실패");
		}
		return paymentMethodDetailNo;
		
	}

	@Override
	public PaymentMethodDetail selectPaymentMethodDetail(int paymentMethodDetailNo) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPaymentMethodDetail(sqlSession,paymentMethodDetailNo);
	}

}
