package com.kh.bookmate.payment.model.service;

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

	



	
	
	
}
