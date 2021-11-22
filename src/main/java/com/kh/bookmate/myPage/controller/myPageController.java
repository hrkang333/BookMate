package com.kh.bookmate.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.exchange_item.model.service.ExchangeItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchangeItem;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.returnBook.model.service.ReturnBookService;
import com.kh.bookmate.returnBook.model.vo.ReturnBook;
import com.kh.bookmate.ubook_payment.model.service.UbookPaymentService;
import com.kh.bookmate.ubook_payment.model.vo.UbookPayment;
import com.kh.bookmate.ubook_payment.model.vo.UbookPaymentDetail;
import com.kh.bookmate.user.model.service.UserService;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginUser") // 로그인 유저 세션 유지 
@Controller
public class myPageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PaymentService paymentService;
	
	
	@Autowired 
	private ExchangeItemService exchangeItemService;
	
	@Autowired
	private ReturnBookService returnBookService;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UbookPaymentService ubookPaymentService;
	



	//나의 포인트 조회화면 띄우기  
	@RequestMapping("myPoint.me")
	public String myPoint() {
		return "myPage/myPoint";
	}

	//회원의 포인트 조회 
	@RequestMapping("selectUserPoint.me")
	public String selectUserPoint(@ModelAttribute User user, HttpSession session, Model model ) throws Exception {
		
		User userPoint = userService.selectUserPoint(user);
		model.addAttribute("loginUser", userPoint);	
	return "myPage/myPoint";

	}
	
	//쿠폰 등록하기 
	@RequestMapping("addCoupon.me")
	public String addCoupon(String couponCode, Model model, @RequestParam("@addCoupon") String addCoupon ) {
		
		Coupon cu = couponService.selectCoupon(couponCode); //쿠폰 리스트를 가져온다.
		
		return "myPage/mayPoint";
	}


	//마이페이지 이동 
	@RequestMapping("myPage.me")
	public String updateUser() {
		return "myPage/updateMyPage";
	}
	

	//회원정보 수정 
	@RequestMapping("update.me") 
	public String updateUser(@ModelAttribute User user, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2")String address2, 
														 HttpSession session, Model model ) throws Exception  {
					
		user.setAddress(post+"/"+address1+"/"+address2);
		System.out.println("암호화전 : " + user.getUserPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(user.getUserPwd());
		System.out.println("암호화 후  : " + encPwd);
		user.setUserPwd(encPwd);
		
		
		User userInfo = userService.updateUser(user);
		model.addAttribute("loginUser", userInfo); 


		session.setAttribute("msg", "회원정보 수정 성공");
				return "myPage/updateMyPage"; 
	}
	
	//회원 탈퇴 
	@RequestMapping("delete.me")
	public String deleteUser (String userId) {
		
			userService.deleteUser(userId);
		return "redirect:logout.us";
	}

	
	//주문리스트 화면 띄우기 
	@RequestMapping("myPageMain.me")
	public String myOrderList() {
		return "myPage/myPageMain";
	}
	
	
	//주문리스트 조회 
	@RequestMapping("selectMyOrderList.me")
	public String selectMyOrderList(Model model, HttpSession session) { 
					
		//주문 내역보기 
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		List<Payment> myOrderList = paymentService.selectMyOrderList(loginUser);

			
		model.addAttribute("myOrderList",myOrderList);
		return "myPage/myPageOrderList";
	
	}
	
	
	//주문 리스트 내역 상세보기 
	@RequestMapping("selectMyOrderListDetail.me")
	public String selectMyOrderListDetail (Model model, int paymentNo ) {	

		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		model.addAttribute("myOrderListDetail",myOrderListDetail);
		//System.out.println("myOrderListDetail=확인 =================" + myOrderListDetail.toString());
		
		return "myPage/myOrderListDetail";
		
	}

	// 배송전 사용자가 주문 취소하기
	@RequestMapping("cancelMyOrder.me")
	public String cancelMyOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.cancelMyOrder(paymentDetailNo); // 업데이트로 deliveryStatus 바꿔줌 
		model.addAttribute("paymentNo",paymentNo); //모델은 다음 화면에 필요한 파라미터를 주는 값 
		
		return "redirect:selectMyOrderListDetail.me";
	}

	// 배송후 사용자가 주문확정
	@RequestMapping("confirmOrder.me")
	public String confirmOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.confirmOrder(paymentDetailNo);
		model.addAttribute("paymentNo",paymentNo); 
		
		
		return "redirect:selectMyOrderListDetail.me";
	}

	
	//[교환] 신청 페이지로 이동하기 
	@RequestMapping("exchange.me") 
	public String applyExchange(int paymentNo, int paymentDetailNo, Model model){
	
		Payment payNo = paymentService.selectPaymentNo(paymentNo);
		PaymentDetail exchangeDetail = paymentService.applyExchange(paymentDetailNo);
		
		paymentService.exchangeWait(paymentDetailNo); //교환 버튼을 누르는 순간 교환 대기중으로 상태 변경하기 
		
		model.addAttribute("exchangeDetail",exchangeDetail);
		model.addAttribute("payNo",payNo);

		return "myPage/applyExchange";
	}
	
	//[교환] 신청하기 (교환테이블에 넣기) 
	@RequestMapping("insertExchange.me")
	public String insertExchangeItem(ExchangeItem exchangeBook,int paymentNo, Model model ) {
		exchangeItemService.insertExchangeItem(exchangeBook);
		model.addAttribute("paymentNo",paymentNo);

		return "redirect:selectMyOrderListDetail.me";
	}
	
	
	
	//[반품] 신청 페이지로 이동하기 
	@RequestMapping("return.me")
	public String applyReturn(int paymentNo, int paymentDetailNo, Model model){
		
		Payment payNo = paymentService.selectPaymentNo(paymentNo);
		PaymentDetail returnDetail = paymentService.applyExchange(paymentDetailNo);

		paymentService.exchangeWait(paymentDetailNo); //교환 버튼을 누르는 순간 교환 대기중으로 상태 변경하기 
		
		model.addAttribute("returnDetail",returnDetail);
		model.addAttribute("payNo",payNo);

		
		return "myPage/applyReturn";
	}
	
	
	//[반품] 신청하기 (반품테이블에 넣기) 
	@RequestMapping("insertReturn.me")
	public String insertReturn(ReturnBook returnBook,int paymentNo, Model model ) {
		returnBookService.insertReturnBook(returnBook);
		model.addAttribute("paymentNo",paymentNo);

		return "redirect:selectMyOrderListDetail.me";
	}
	

	//구매취소 리스트 
	@RequestMapping("cancelList.me")
	public String cancelList(Model model) {
		
		List<PaymentDetail> cList = paymentService.cancelList();
		model.addAttribute("cList",cList);
		System.out.println("cList=확인 =================" + cList.toString());

		return "myPage/cancelList";
	}
	


//	
//	//[중고] 주문 리스트 
//	@RequestMapping("selectMyOrderList.ub")
//	public String selectUbookMyOrderList(Model model, HttpSession session) { 
//					
//		//주문 내역보기 
//		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
//		List<UbookPayment> ubMyOrderList = ubookPaymentService.selectUbookMyOrderList(loginUser);
//
//			
//		model.addAttribute("ubMyOrderList",ubMyOrderList);
//		return "myPage/myPageOrderList";
//	}
//
//	
//	//[중고] 주문 리스트 내역 상세보기 
//	@RequestMapping("selectMyOrderListDetail.me")
//	public String selectUbookMyOrderDetailList (Model model, int paymentNoUb ) {	
//
//		List<UbookPaymentDetail> myOrderListDetail = paymentService.selectUbookMyOrderDetailList(paymentNoUb);
//		model.addAttribute("myOrderListDetail",myOrderListDetail);
//		//System.out.println("myOrderListDetail=확인 =================" + myOrderListDetail.toString());
//		
//		return "myPage/myOrderListDetail";
//		
//	}
	
}