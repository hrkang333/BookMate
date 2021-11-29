package com.kh.bookmate.payment.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.vo.User;

public interface PaymentService {

	List<Payment> selectMyOrderList(String loginUser);
 
	List<PaymentDetail> selectMyOrderListDetail(int paymentNo);

	int cancelMyOrder(int paymentDetailNo);

	void confirmOrder(int paymentDetailNo, int paymentNo);
 
	PaymentDetail applyExchange(int paymentDetailNo);

	Payment selectPaymentNo(int paymentNo);

	void insertPayment(Payment temp, List<PaymentDetail> list, List<ShoppingBasket> deleteBasketList, String latelyAddress);

	
	//사용자 화면 deliveryStatus 상태값 업데이트 
	void updateUserExList(int paymentDetailNo);

	List<PaymentDetail> selectDeliveryList();

	void updateDeliveryList(int paymentDetailNo);

	void exchangeWait(int paymentDetailNo);

	void updateUserReList(int paymentDetailNo);

	List<PaymentDetail> cancelList(String loginUser);

	boolean checkStock(ShoppingBasket basket);



	


	void updateReturn(int paymentDetailNo, Payment p);

//	List<PaymentDetail> refundAndExchangeList();

	List<PaymentDetail> selectReAndExList(String loginUser);

	void insertSinglePayment(Payment temp, PaymentDetail paymentDetail, String latelyAddress);

	


	
	
	
}
