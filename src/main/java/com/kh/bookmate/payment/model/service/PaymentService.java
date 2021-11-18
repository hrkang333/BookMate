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

	//(교환) 사용자 화면에서 주문상태 업데이트로 
	void updateUserExchangeList(PaymentDetail paymentDetail);
	
	//(배송상태 업데이트) 사용자 화면에서 배송중으로 업데이트 
	void updateUpdateDelivery(PaymentDetail paymentDetail);

	List<PaymentDetail> selectDeliveryList();

	List<Payment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList);


}
