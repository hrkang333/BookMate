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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.coupon.model.vo.UseCoupon;
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
	



	//회원의 포인트 조회 
	@RequestMapping("myPoint.me")
	public String selectUserPoint(User user, HttpSession session, Model model ) throws Exception {
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		User userPoint = userService.selectUserPoint(loginUser);
		
		model.addAttribute("userPoint", userPoint);	
	return "myPage/myPoint";

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
	
	//교환/환불 리스트 조회 
	@RequestMapping("refundAndExchangeList.me") // 왜 bookISBN no getter가 뜨는거지..
	public String refundAndExchangeList(Model model) {
	
	List<PaymentDetail> rxList = paymentService.refundAndExchangeList();
	model.addAttribute("rxList",rxList);
	
		return "myPage/refundAndExchangeList";
	}



	//[중고] 주문 리스트 
	@RequestMapping("selectMyOrderList.ub")
	public String selectUbookMyOrderList(Model model, HttpSession session) { 
					
		//주문 내역보기 
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
		List<UbookPayment> ubMyOrderList = ubookPaymentService.selectUbookMyOrderList(loginUser);

			
		model.addAttribute("ubMyOrderList",ubMyOrderList);
		return "myPage/secondaryMarketOrderList";
	}

	
	//[중고] 주문 리스트 내역 상세보기 
	@RequestMapping("selectMyOrderListDetail.ub")
	public String selectUbookMyOrderDetailList (Model model, int paymentNoUb ) {	

		List<UbookPaymentDetail> ubMyOrderListDetail = ubookPaymentService.selectUbookMyOrderDetailList(paymentNoUb);
		model.addAttribute("ubMyOrderListDetail",ubMyOrderListDetail);
		
		return "myPage/secondaryMarketOrderDetailList";
		
	}
	
	//[중고] 배송후 사용자가 주문확정
	@RequestMapping("confirmOrder.ub")
	public String confirmOrderUbook(int paymentNoUb, int paymentDetailNoUb, Model model) {

		ubookPaymentService.confirmOrderUbook(paymentDetailNoUb);
		model.addAttribute("paymentNoUb",paymentNoUb); 
				
		return "redirect:selectMyOrderListDetail.ub";
	}

	
	

	
	//사용한 쿠폰테이블을 조회함 usecoupon  쿠폰 입력할때
	//그 테이블에 찾아서 아이디랑 쿠폰번호가 잇으면 이미 사용한 쿠폰
	//발행된 쿠폰 번호를 입력함 입력한 쿠폰과 발행된 쿠폰이 같을때 
	//1. 유저테이블에 포인트를 업데이트 시킨다. 
	
	//아이디 유효성 검사처럼 하면 될거같은데... 
	
	//받은 쿠폰 번호 확인하기 
	
	@RequestMapping(value="/checkCu.me")
	@ResponseBody														
	public String checkUseCoupon(@RequestParam("couponCode") String couponCode, String user_Id) { 
										//사용자한테 (쿠폰 코드만) 받을 수 있는 값만 적어야됨 
			
		int result = couponService.checkUseCoupon(couponCode);
			if(result > 0) {
				UseCoupon uc = new UseCoupon(user_Id, couponCode);	
//					System.out.println(user_Id+"=============check Cu ====");
				UseCoupon uc1 = couponService.checkAlreadyUsedCoupon(uc); 
				//쿠폰코드랑 매퍼에서 꺼내서 쓸수있음 값 null 아니면 사용한
				if(uc1 != null){
					
					return "usedAlready";
				}
				return "available"; // 이미 코드가 있는경우 (사용가능한..?)쿠폰 
			}else {
				return "nope"; // 코드가 없어서 사용할 수 없음 
			}
		
	}
	
	//만약 쿠폰 중복 체크 했을때 useCoupon에 인서트하기/ 사용자테이블에 포인트 올려주기 
	@RequestMapping("updateCoupon.me")
	public String updateCoupon(String couponCode, String user_Id) { 

		
		UseCoupon uc = new UseCoupon(user_Id, couponCode); //usecoupon에 인서트 해줄려 이거 두개만 찍히니까		
		couponService.selectUseCoupon(uc); 
		
		System.out.println(uc+"----------------uc는 잘들고오니? ");
		
		
		int point = couponService.selectPoint(couponCode);//테이블에서 포인트만 받아온다.(유저업데ㅣ트할때 필요함) 
	//	System.out.println(point + "================point 잘 들고오니 ");
		
		Coupon cu = couponService.selectCoupon(couponCode);
		couponService.updateCoupon(uc,cu); //유저아이디랑, 쿠폰코드 받아옴 
		
		return "redirect:myPoint.me";
	}
	
	
	
		
		
	//	UseCoupon uc = couponService.searchCouponUserId(couponCode);
		
		
//[반품] 신청하기 (반품테이블에 넣기) 
//		@RequestMapping("insertReturn.me")
//		public String insertReturn(ReturnBook returnBook,int paymentNo, Model model ) {
//			returnBookService.insertReturnBook(returnBook);
//			model.addAttribute("paymentNo",paymentNo);
//
//			return "redirect:selectMyOrderListDetail.me";
//		}
		
	
		//usecoupon 검색 해와야 유저아이드를 들고가서 쿠폰 where 절해서 count = 0 했을때만 쿠폰을 사용할수있게
		
		//쓴적이 있을때 없을때 판단 if count가 1이면 ? count가 0이면 쿠폰쓰고 , userCoupon 진행 
		//if else 일때 사용을 못함 
		
		
		//쿠폰테이블에 가서 쿠폰에 따른 포인트를 들고와야됨 쿠폰객체를 들고왔다면
		//쿠폰객체에서 get.point 해서 유저포인트 업데이트 
//		Coupon cu = new Coupon();
//		cu.getCouponPoint(); 
//		
//		Coupon cu = couponService.checkCoupon(couponCode);
	

	
	
	 //1. 입력값 받아오기 
//	
//	@RequestMapping("updateCoupon.me")
//	public String updateCoupon(Model model) {
//		
//		
//		return "redirect:/";
//	}
	
}