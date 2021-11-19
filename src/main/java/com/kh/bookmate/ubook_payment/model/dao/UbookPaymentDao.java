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

	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		return sqlSession.delete("ubookPaymentMapper.deleteCart",cartNo);
	}
	public int updateUbookStock(SqlSessionTemplate sqlSession, int cartUbNo) {
		return sqlSession.update("ubookPaymentMapper.updateUbookStock",cartUbNo);
	}

	public List<UbookPayment> selectMyOrderList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ubookPaymentMapper.selectMyOrderList", loginUser);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ubookPaymentMapper.selectListCount",loginUser);
	}

	public List<UbookPaymentDetail> selectMyOrderListDetail(SqlSessionTemplate sqlSession, int paymentNoUb) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("ubookPaymentMapper.selectMyOrderListDetail", paymentNoUb);

	}

	public int confirmOrder(SqlSessionTemplate sqlSession, int paymentDetailNoUb) {
		return sqlSession.update("ubookPaymentMapper.confirmOrder",paymentDetailNoUb);
	}

	public UbookPayment selectPaymentNo(SqlSessionTemplate sqlSession, int paymentNoUb) {
		return sqlSession.selectOne("ubookPaymentMapper.selectPaymentNo" , paymentNoUb);
	}

	public List<UbookPaymentDetail> selectDeliveryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ubookPaymentMapper.selectDeliveryList");
	}

	public List<UbookPayment> selectDeliveryPaymentNoList(SqlSessionTemplate sqlSession,
			List<Integer> deliveryDetailNoList) {
		ArrayList<UbookPayment> deliList = (ArrayList)sqlSession.selectList("ubookPaymentMapper.selectDeliveryPaymentNoList",deliveryDetailNoList);
		
		List<Integer> Nolist= new ArrayList<>();
			for(UbookPayment p: deliList) {
				Nolist.add(p.getPaymentNoUb());
			}
		return deliList;
	}



	
} 


