package com.kh.bookmate.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.user.model.vo.User;

@Repository
public class PaymentDao {

	public Payment selectMyOrderList(SqlSessionTemplate sqlSession, User loginUser, Payment payment) {

		System.out.println("==================" +payment + loginUser );
		
		
		return (Payment) sqlSession.selectOne("paymentMapper.selectMyOrderList", loginUser);
	}



}
