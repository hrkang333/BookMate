package com.kh.bookmate.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.user.model.vo.User;

@Repository
public class PaymentDao {

	public ArrayList<Payment> SelectMyOrderList(SqlSessionTemplate sqlSession, User loginUser) {

		return (ArrayList)sqlSession.selectList("paymentMapper.SelectMyOrderList", loginUser);
	}


}
