package com.kh.bookmate.payment.model.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.dao.PaymentDao;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.user.model.dao.UserDao;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired 
	private PaymentDao paymentDao;
 
	//주문 리스트 조회 
	@Override 
	public List<Payment> selectMyOrderList(String loginUser) {
		List<Payment> list = paymentDao.selectMyOrderList(sqlSession, loginUser);
		return list;
	}  
 
	//페이지 처리 
	@Override
	public int selectListCount(String loginUser) {
		// TODO Auto-generated method stub
		return paymentDao.selectListCount(sqlSession,loginUser);
	}
	
	//주문리스트 상세조회 
	@Override
	public List<PaymentDetail> selectMyOrderListDetail(int paymentNo) {
		List<PaymentDetail> list = paymentDao.selectMyOrderListDetail(sqlSession,paymentNo);
		return list;
	}

	//사용자 배송준비중 구매취소
	@Override
	public int cancelMyOrder(int paymentDetailNo) {
		int list = paymentDao.cancelMyOrder(sqlSession,paymentDetailNo);
		return list;
	}

	//사용자 배송완료 후 구매확정 
	@Override
	public int confirmOrder(int paymentDetailNo) {
		int list = paymentDao.confirmOrder(sqlSession,paymentDetailNo);
		return list;
	}



 
	// 교환 환불 페이지로 이동하기 
	@Override
	public PaymentDetail applyExchange(int paymentDetailNo) {
		PaymentDetail applyExchange = paymentDao.applyExchange(sqlSession,paymentDetailNo);
		return applyExchange;
	}

	@Override
	public Payment selectPaymentNo(int paymentNo) {
		Payment list = paymentDao.selectPaymentNo(sqlSession,paymentNo);
		return list;
	}

	
	

	
	

	@Override
	public void insertPayment(Payment temp, List<PaymentDetail> list) {
		
		int result = paymentDao.insertPayment(sqlSession,temp);
		if(result < 0) {
			throw new RuntimeException("결제 정보 저장 오류");
		}
		int paymentNo = temp.getPaymentNo();
		for(PaymentDetail pd : list) {
			pd.setPaymentNo(paymentNo);
			int result2 = paymentDao.insertPaymentDetail(sqlSession,pd);
			if(result2 < 0) {
				throw new RuntimeException("세부 결제 정보 저장 오류");
			}
		}
	}

	
	
	//교환대기중 리스트 업데이트 
	@Override
	public void updateUserExchangeList(PaymentDetail paymentDetail) {
		paymentDao.updateUserExchangeList(sqlSession, paymentDetail);
		
	}

	
		//[관리자]배송리스트 볼라고..
		@Override
		public List<PaymentDetail> selectDeliveryList() {
			List<PaymentDetail> list = paymentDao.selectDeliveryList(sqlSession);
			return list;
		}

		// 페이먼트랑 페이먼트 디테일테이블쓰고싶어서 
		@Override
		public List<Payment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList) {
			List<Payment> paymentNoList = paymentDao.selectDeliveryPaymentNoList(sqlSession,deliveryDetailNoList);
			return paymentNoList;
		}

	 
	//배송리스트 업데이트 
	@Override
	public void updateUpdateDelivery(PaymentDetail paymentDetail) {
		// TODO Auto-generated method stub
		
	}

	
	
	

 

	



	
	
	
}
