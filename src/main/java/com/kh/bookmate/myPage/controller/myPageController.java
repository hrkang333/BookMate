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

import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Pagination;
import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.exchange_item.model.service.ExchageItemService;
import com.kh.bookmate.exchange_item.model.vo.ExchageItem;
import com.kh.bookmate.payment.model.service.PaymentService;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
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
	private ExchageItemService exchageItemService;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private CouponService couponService;
	



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
	public String selectMyOrderList(Model model, HttpSession session,
									@RequestParam (value="currentPage", required=false, defaultValue="1") int currentPage) { 
					
		//주문 내역보기 
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		List<Payment> myOrderList = paymentService.selectMyOrderList(loginUser);

		//페이징 
		int listCount = paymentService.selectListCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5,5);
		
			
		model.addAttribute("myOrderList",myOrderList);
		model.addAttribute("pi",pi);
		
		
		return "myPage/myPageOrderList";
	
	}
	
	
	//주문 리스트 내역 상세보기 
	@RequestMapping("selectMyOrderListDetail.me")
	public String selectMyOrderListDetail (Model model, int paymentNo ) {	

		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		model.addAttribute("myOrderListDetail",myOrderListDetail);

		return "myPage/myOrderListDetail";
		
	}

	// 배송전 사용자가 주문 취소하기
	@RequestMapping("cancelMyOrder.me")
	public String cancelMyOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.cancelMyOrder(paymentDetailNo);

		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		model.addAttribute("myOrderListDetail", myOrderListDetail);
		return "myPage/myOrderListDetail";
	}

	// 배송후 사용자가 주문확정
	@RequestMapping("confirmOrder.me")
	public String confirmOrder(int paymentNo, int paymentDetailNo, Model model) {

		paymentService.confirmOrder(paymentDetailNo);

		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		model.addAttribute("myOrderListDetail", myOrderListDetail);
		return "myPage/myOrderListDetail";
	}

	
	//교환 신청 페이지로 이동하기 
	@RequestMapping("exchange.me") 
	public String selectExchangeList(int paymentNo, int paymentDetailNo, Model model){
	
//		Payment payNo = paymentService.selectPaymentNo(paymentNo);
//		PaymentDetail exchangeDetail = paymentService.selectExchangeList(paymentDetailNo);
//		
//		System.out.println("==============="+payNo);
//		System.out.println("=============exchangeDetail==" + exchangeDetail);
//	
//		
//		model.addAttribute("exchangeDetail",exchangeDetail);
//		model.addAttribute("payNo",payNo);
		
		paymentService.selectExchangeList(paymentDetailNo);
		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		model.addAttribute("myOrderListDetail", myOrderListDetail);
		
		System.out.println(myOrderListDetail+"============교환으로 보낼거야 너 들어와야됨 ==========");
		
		return "myPage/applyExchangeAndRefund";
	}
	
 
	//교환 신청하기 
	@RequestMapping("insertExchange.me")
	public String insertExchangeItem(HttpSession session, int paymentDetailNo, Model model, @RequestParam("post") String post,
															 @RequestParam("address1") String address1,
															 @RequestParam("address2")String address2, 
															 @RequestParam("phone") String phone,
															 @RequestParam("userName")String userName) {
//		user.setUserName(userName);
//		user.setPhone(phone);												
//		user.setAddress(post+"/"+address1+"/"+address2);
		
		int insertExchangeBook = exchageItemService.insertExchangeItem(paymentDetailNo);
		System.out.println("========으아아아아 ==========="+insertExchangeBook);
		

		
		
		return "redirect:myPage/myOrderListDetail";
	}
	
	
	
	
	
	

}