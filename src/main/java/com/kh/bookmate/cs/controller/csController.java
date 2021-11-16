package com.kh.bookmate.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;

// 교환과 반품 승인버튼 값 업데이트 해주는 cs 페이지 
public class csController {
	

	@Autowired 
	private ExchangeItemService exchangeItemService;
	
	
	@RequestMapping("goAdminMain.cs")
	public String adminExchange() {
		
		return "cs/adminCsMain";
	}

}
