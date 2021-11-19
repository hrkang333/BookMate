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


	public PaymentDetail applyExchange(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.applyExchange",paymentDetailNo);
	}

	public Payment selectPaymentNo(SqlSessionTemplate sqlSession, int paymentNo) {			
		return sqlSession.selectOne("paymentMapper.selectPaymentNo" , paymentNo);
	}
	

	public void updateUserExchangeList(SqlSessionTemplate sqlSession, PaymentDetail paymentDetail) {		
		sqlSession.update("paymentMapper.updateUserExchangeList",paymentDetail);
	}

	


	public List<Payment> selectDeliveryList(SqlSessionTemplate sqlSession, PaymentDetail paymentDetail) {
		// TODO Auto-generated method stub
		return(ArrayList) sqlSession.selectList("paymentMapper.selectDeliveryList",paymentDetail);
	}
	
	
	
	
	
	
	//결제정보 등록
	public int insertPayment(SqlSessionTemplate sqlSession, Payment temp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMapper.insertPayment",temp);
	}

	//결제 세부 정보 등록
	public int insertPaymentDetail(SqlSessionTemplate sqlSession, PaymentDetail pd) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMapper.insertPaymentDetail",pd);
	}

	 
	
	

	
	//결제후 장바구니 삭제
	public int deleteBasket(SqlSessionTemplate sqlSession, int basketNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("paymentMapper.deleteBasket",basketNo);
	}

	//결제후 유저 포인트 업데이트
	public int updateUserPoint(SqlSessionTemplate sqlSession, Payment temp) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.updateUserPoint",temp);
	}

	
	
	
	public Payment deliveryListPayment(SqlSessionTemplate sqlSession, int paymentNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.deliveryListPayment",paymentNo);
	}

	public PaymentDetail deliveryListPaymentDetail(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.deliveryListPaymentDetail",paymentDetailNo);
	}



 
	
} 


