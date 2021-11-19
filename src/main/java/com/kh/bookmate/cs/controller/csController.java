package com.kh.bookmate.cs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
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
	
	
	
	//[관리자]교환 리스트 가져오기 
	@RequestMapping("selectExchangeList.cs")
	public String selectExchangeList(ExchangeItem exchangeBook, Model model){
		
		
		List <ExchangeItem> exchangeList = exchangeItemService.selectExchangeList();
	//	System.out.println(exchangeList.toString()+"============익스체인지리스트 ==========");
		//위에서 교환신청이 들어 온 건에 대해서 조회하기 
		
		//디테일 넘버만 따로 뽑아 파라미터로 보낸다 
		List<Integer> exchangeDetailNoList = new ArrayList<>();
	      for(ExchangeItem e : exchangeList) {
	    	  exchangeDetailNoList.add(e.getPaymentDetailNo());
	      }
	//	System.out.println(exchangeDetailNoList+"----------------------exchangeDetailNoList");
	
		//디테일 넘버 뽑아낸 파라미터를 페이먼트 디테일로 보내면 페이먼트 디테일에 있는 열 값을 쓸수있음 
		List <PaymentDetail> orderDetailList = exchangeItemService.selectOrderDetailNoList(exchangeDetailNoList);
	//  	System.out.println(orderDetailList+"=======exchange_item에서 detailNo만 뽑은거임 ===널..? ========");
	  	
		model.addAttribute("exchangeList", exchangeList);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "cs/adminExchange";

	}
	
	
	//[관리자] 교환 상태값 업데이트 
	@RequestMapping("updateExchangeList.cs")
	public String updateExchangeList(int paymentDetailNo, Model model ) {

		
		exchangeItemService.updateExchangeList(paymentDetailNo); // 관리자화면 교환 승인시 교환완료로 업데이트 
//		paymentService.updateUserExchangeList(paymentDetail); //사용자 화면 교환 교환완료로 업데이트  
		
		System.out.println(paymentDetailNo+"============ㅠ첫번째꺼만 업데이트 되네  ======");
		
		return "redirect:selectExchangeList.cs";
	}
	 
	
	//배송전인 애들을 배송 
	@RequestMapping("deliveryList.cs")
		public String selectDeliveryList(int paymentNo, int paymentDetailNo, Model model) {
		
//		List<PaymentDetail> deliveryList = paymentService.selectDeliveryList();
//		System.out.println("===================deli============"+deliveryList.toString());
//		
//		//페이먼트 넘버만 보내기 
//		List<Integer> deliveryDetailNoList = new ArrayList<>();
//			for(PaymentDetail p :deliveryList) {
//				deliveryDetailNoList.add(p.getPaymentNo());
//			}
//		
//		List<Payment> deliveryDetailList = paymentService.selectDeliveryPaymentNoList(deliveryDetailNoList);
//
//		System.out.println("===============으아아아아아========" + deliveryDetailList);
//		model.addAttribute("deliveryList",deliveryList);
//		model.addAttribute("deliveryDetailList",deliveryDetailList);
		
		System.out.println();
		
		Payment pno = paymentService.deliveryListPayment(paymentNo);
		PaymentDetail pdno = paymentService.deliveryListPaymentDetail(paymentDetailNo);
		
		System.out.println(pno+"=======================");
		System.out.println(pdno+"=======================");

		model.addAttribute("pno",pno);
		model.addAttribute("pdno",pdno);
		
		return "cs/adminDelivery";
	}
	
	
	
	//[관리자] 배송중으로 업데이트 하기 
	@RequestMapping("updateDelivery.cs")
	public String updateUpdateDelivery(PaymentDetail paymentDetail, Model model) {
		
		paymentService.updateUpdateDelivery(paymentDetail);
	
		return "redirect:cs/selectDeliveryList";
	}
	

}
