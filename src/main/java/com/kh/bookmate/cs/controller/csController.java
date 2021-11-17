package com.kh.bookmate.cs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.PaymentDetail;

// 교환과 반품 승인버튼 값 업데이트 해주는 cs 페이지 


@SessionAttributes("loginUser") // 로그인 유저 세션 유지 
@Controller
public class csController {
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired 
	private ExchangeItemService exchangeItemService;
	
	
	@RequestMapping("goAdminMain.cs")
	public String adminExchange() {
		
		return "cs/adminCsMain";
	}
	

	@RequestMapping("selectExchangeList.cs")
	public String selectExchangeList(int paymentDetailNo, ExchangeItem exchangeBook, Model model){
		
		
		List <ExchangeItem> exchangeList = exchangeItemService.selectExchangeList();
		System.out.println(exchangeList+"======================");
		//위에서 교환신청이 들어 온 건에 대해서 조회하기 
		
		//디테일 넘버만 따로 뽑아 파라미터로 보낸다 
		List<Integer> exchangeDetailNoList = new ArrayList<>();
	      for(ExchangeItem e : exchangeList) {
	    	  exchangeDetailNoList.add(e.getPaymentDetailNo());
	      }

		List <ExchangeItem> orderDetailList = exchangeItemService.selectOrderDetailNoList(exchangeDetailNoList);
		
		System.out.println(orderDetailList+"=======exchange_item에서 detailNo만 뽑은거임 ===널..? ========");
		System.out.println(exchangeDetailNoList+"----------------------exchangeDetailNoList");
	
		
		model.addAttribute("exchangeList", exchangeList);
		
		//model.addAttribute("orderDetailList", orderDetailList);
		return "cs/adminExchange";

	}

}
