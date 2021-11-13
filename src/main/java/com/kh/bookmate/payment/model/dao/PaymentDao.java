package com.kh.bookmate.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

@Repository
public class PaymentDao {

	//나의 주문 리스트 조회 
	public ArrayList<Payment> selectMyOrderList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("paymentMapper.selectMyOrderList", loginUser);
	}
 
	//페이징처리 
	public int selectListCount(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.selectListCount",loginUser);
	}
	
	//나의 주문 리스트 상세 조회 
	public List<PaymentDetail> selectMyOrderListDetail(SqlSessionTemplate sqlSession, int paymentNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("paymentMapper.selectMyOrderListDetail", paymentNo);
	}

	public int cancelMyOrder(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		return sqlSession.update("paymentMapper.cancelMyOrder",paymentDetailNo);
	}

	public int confirmOrder(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.confirmOrder",paymentDetailNo);
	}
} 


