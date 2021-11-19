package com.kh.bookmate.ubook_payment.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_cart.model.vo.UbookCart;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.vo.User;

public interface UbookPaymentService {

	List<UbookPayment> selectMyOrderList(String loginUser);

	int selectListCount(String loginUser);
 
	List<UbookPaymentDetail> selectMyOrderListDetail(int paymentNoUb);

	int confirmOrder(int paymentDetailNoUb);
 
	UbookPayment selectPaymentNo(int paymentNoUb);

	//내꺼
	//void insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList, List<UbookCart> updateUbookStock);
	
	int insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list, List<UbookCart> deleteCartList);
	
	//(배송상태 업데이트) 사용자 화면에서 배송중으로 업데이트 
	void updateUpdateDelivery(UbookPaymentDetail ubookPaymentDeatil);

	List<UbookPaymentDetail> selectDeliveryList();

	List<UbookPayment> selectDeliveryPaymentNoList(List<Integer> deliveryDetailNoList);

	int updateUbookStock(int cartUbNo);
 
}
