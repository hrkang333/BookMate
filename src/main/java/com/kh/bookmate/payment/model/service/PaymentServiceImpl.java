package com.kh.bookmate.payment.model.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.dao.PaymentDao;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
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

 
	// 교환
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

	//교환대기중 리스트 업데이트 
	@Override
	public void updateUserExchangeList(PaymentDetail paymentDetail) {
		paymentDao.updateUserExchangeList(sqlSession, paymentDetail);
		
	}
	

	//배송리스트 업데이트 
	@Override
	public void updateUpdateDelivery(PaymentDetail paymentDetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Payment> selectDeliveryList(PaymentDetail paymentDetail) {
		List<Payment> list = paymentDao.selectDeliveryList(sqlSession, paymentDetail);
		return list;
	}
	
	
	
//	//[관리자]배송리스트 볼라고..
//	@Override
//	public List<PaymentDetail> selectDeliveryList() {
//		List<PaymentDetail> list = paymentDao.selectDeliveryList(sqlSession);
//		return list;
//	}
//
//	// 페이먼트랑 페이먼트 디테일테이블쓰고싶어서 
//	@Override
//	public List<Payment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList) {
//		List<Payment> paymentNoList = paymentDao.selectDeliveryPaymentNoList(sqlSession,deliveryDetailNoList);
//		return paymentNoList;
//	}
	
	
	
	
	

	@Override
	public void insertPayment(Payment temp, List<PaymentDetail> list, List<ShoppingBasket> deleteBasketList) {
		
		//결제 정보 등록, 결제 세부(도서)정보 등록, 결제후 장바구니 삭제, 결제후 유저 포인트 업데이트
		
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
		
		for(ShoppingBasket basket : deleteBasketList) {
			int result3 = paymentDao.deleteBasket(sqlSession,basket.getBasketNo());
			if(result3 < 0) {
				throw new RuntimeException("결제후 장바구니 삭제 오류");
			}
		}
		
			temp.setUsePoint(temp.getTotalGetPoint()-temp.getUsePoint());
			int result4 = paymentDao.updateUserPoint(sqlSession,temp);
			if(result4 < 0) {
				throw new RuntimeException("유저 포인트 업데이트 오류");
			}
		
	}

	
	
	
	
	
	@Override
	public Payment deliveryListPayment(int paymentNo) {
		Payment pList = paymentDao.deliveryListPayment(sqlSession,paymentNo);
		return pList;
	}

	@Override
	public PaymentDetail deliveryListPaymentDetail(int paymentDetailNo) {
		PaymentDetail pdList = paymentDao.deliveryListPaymentDetail(sqlSession,paymentDetailNo);
		return pdList;
	}

	
	


	


	 

	
	
	

 

	



	
	
	
}
