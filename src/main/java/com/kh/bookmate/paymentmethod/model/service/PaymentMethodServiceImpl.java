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
		int result = paymentMethodDao.insertPaymentMethod(sqlSession,user_Id);
		if(result < 0) {
			throw new RuntimeException("저장된 결제수단 최초 생성 실패"); 
		}
		
	}

	

	@Override
	public List<PaymentMethodDetail> selectPMDetailList(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		return paymentMethodDao.selectPMDetailList(sqlSession,paymentMethod);
	}

	@Override
	public void insertPMDetail(PaymentMethod paymentMethod, PaymentMethodDetail PMDetail) {
		int result2 = 1;
		int result = paymentMethodDao.insertPMDetail(sqlSession,PMDetail);
		
		if(paymentMethod.getMainPayment()==0) {
			result2 = paymentMethodDao.updateMainMethod(sqlSession,PMDetail.getUser_Id());
		}
		if(result*result2 < 0) {
			throw new RuntimeException("결제 저장수단 등록 실패");
		}
		
	}

}
