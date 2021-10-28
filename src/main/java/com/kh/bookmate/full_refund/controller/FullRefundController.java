package com.kh.bookmate.full_refund.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bookmate.full_refund.model.service.FullRefundService;

@Controller
public class FullRefundController {
	
	@Autowired
	private FullRefundService fullRefundService;

}
 