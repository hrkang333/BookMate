package com.kh.bookmate.ubook_payment.model.service;

import java.util.List;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.vo.User;

public interface UbookPaymentService {

	void insertUbookPayment(UbookPayment temp, List<UbookPaymentDetail> list);


}
