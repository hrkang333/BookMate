package com.kh.bookmate.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.payment.model.dao.PaymentDao;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.user.model.dao.UserDao;
import com.kh.bookmate.user.model.vo.User;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PaymentDao paymentDao;

	//회원 주문 주회 
	@Override
	public ArrayList<Payment> SelectMyOrderList(User loginUser) {

		ArrayList<Payment> list = paymentDao.SelectMyOrderList(sqlSession, loginUser);
		
		return list;
	}


	
	
	
}
