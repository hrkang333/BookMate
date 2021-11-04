package com.kh.bookmate.payment.model.service;

import java.util.ArrayList;

import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.user.model.vo.User;

public interface PaymentService {

	Payment selectMyOrderList(User loginUser, Payment payment);

	
}
