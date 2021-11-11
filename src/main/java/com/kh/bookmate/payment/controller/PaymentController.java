package com.kh.bookmate.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.payment.model.service.PaymentService;

public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	
	

}
