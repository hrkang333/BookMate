package com.kh.bookmate.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.user.model.vo.User;

@Repository
public class PaymentDao {

	public PaymentDetail selectMyOrderList(SqlSessionTemplate sqlSession, User loginUser) {
		// TODO Auto-generated method stub
		return(PaymentDetail) sqlSession.selectOne("paymentMapper.selectMyOrderList", loginUser);
	}




}
