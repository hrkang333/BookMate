package com.kh.bookmate.payment.model.service;

import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.user.model.vo.User;

public interface PaymentService {

	PaymentDetail selectMyOrderList(User loginUser);

}
