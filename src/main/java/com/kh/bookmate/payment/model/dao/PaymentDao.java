package com.kh.bookmate.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;

@Repository
public class PaymentDao {

	//나의 주문 리스트 조회 
	public ArrayList<Payment> selectMyOrderList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("paymentMapper.selectMyOrderList", loginUser);
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

	
	


	public void updateUserExList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		// TODO Auto-generated method stub
		sqlSession.update("paymentMapper.updateUserExList",paymentDetailNo);
	}

	public List<PaymentDetail> selectDeliveryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("paymentMapper.selectDeliveryList");
	}

	public void updateDeliveryList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.updateDeliveryList",paymentDetailNo);
	}

	public void exchangeWait(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.exchangeWait",paymentDetailNo);
		
	}

	public void updateUserReList(SqlSessionTemplate sqlSession, int paymentDetailNo) {
		sqlSession.update("paymentMapper.updateUserReList",paymentDetailNo);		
	}

	public List<PaymentDetail> cancelList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList) sqlSession.selectList("paymentMapper.cancelList");
	}

	//셀렉트 페이먼트디테일 객체 가져옴 
	public PaymentDetail selectPaymentDetail(SqlSessionTemplate sqlSession,int paymentDetailNo) {
		return sqlSession.selectOne("paymentMapper.selectPaymentDetail",paymentDetailNo);
	}

	//셀렉트 페이먼트 객체 가져옴 
	public Payment selectPayment(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.selectOne("paymentMapper.selectPayment", p);
	}



//	//환불 후 유저 적립한 포인트와, 사용포인트 반환 
//	public void updateUserReturnPoint(SqlSessionTemplate sqlSession, Payment p) {
//		sqlSession.selectOne("paymentMapper.updateUserReturnPoint", p);
//	}	
	public int updateBookStock(SqlSessionTemplate sqlSession, ShoppingBasket basket) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.updateBookStock",basket);
	}

	public int checkStock(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.checkStock",bookISBN);
	}


 
	
} 


