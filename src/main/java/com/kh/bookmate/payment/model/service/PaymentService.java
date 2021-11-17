package com.kh.bookmate.payment.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.user.model.vo.User;

public interface PaymentService {

	List<Payment> selectMyOrderList(String loginUser);

	int selectListCount(String loginUser);
 
	List<PaymentDetail> selectMyOrderListDetail(int paymentNo);

	int cancelMyOrder(int paymentDetailNo);

	int confirmOrder(int paymentDetailNo);
 
	PaymentDetail applyExchange(int paymentDetailNo);

	Payment selectPaymentNo(int paymentNo);

	void insertPayment(Payment temp, List<PaymentDetail> list);


}
