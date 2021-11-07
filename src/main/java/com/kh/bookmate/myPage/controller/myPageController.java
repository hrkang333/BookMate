package com.kh.bookmate.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.payment.model.service.PaymentService;
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
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	



	//나의 포인트 조회화면 띄우기  
	@RequestMapping("myPoint.me")
	public String myPoint() {
		return "myPage/myPoint";
	}

	//회원의 포인트 조회 
	@RequestMapping("selectUserPoint.me")
	public String selectUserPoint(@ModelAttribute User user, 
								@RequestParam("point") int point,
								HttpSession session, Model model ) throws Exception {
		
		User userPoint = userService.selectUserPoint(user);
		model.addAttribute("loginUser", userPoint);
		
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
	
	
	//주문리스트  조회
	//주문번호, 주문금액, 상품정보, 수량, 주문상태 값 조회하기 
	@RequestMapping("selectMyOrderList.me")
	public String selectMyOrderList(@ModelAttribute User user, 
									@ModelAttribute PaymentDetail paymentDetail,
													//	@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
														@RequestParam(value="paymentNo", required = false, defaultValue="0") int paymentNo,														
														@RequestParam(value="bookTitle",required = false ,defaultValue="0" ) String bookTitle,
														@RequestParam(value="bookMainImg",required=false, defaultValue="0") String bookMainImg,
														@RequestParam(value="quantity",required=false,defaultValue="0" ) int quantity,
														@RequestParam(value="deliveryStatus",required=false,defaultValue="0") int deliveryStatus,
													//	@RequestParam(value="currentPage",defaultValue="1")
														HttpSession session, Model model ) { 
		
		User loginUser = (User) session.getAttribute("loginUser"); 
		PaymentDetail myOrderList = paymentService.selectMyOrderList(loginUser);
		
		//PageInfo pi = Pagination.getPageInfo(myOrderList, currentPage, 5,5);
		
		model.addAttribute("myOrderList",myOrderList);
		System.out.println("=================주문리스트 값은 찍히는지 ========="+myOrderList + paymentDetail);
		return "myPage/myPageOrderList";
	
	}
	
	
	//주문내역 상세보기 
	@RequestMapping("selectMyOrderList/selectOrderListDetail.me")
	public String selectOrderListDetail() {
		
		return "myPage/myOderListDetail";
	}
	
	//일주일 
//		private String getCurrentDate() {
//			Date dateNow = (Date) Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
//	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
//	        return formatter.format(dateNow);
//	}
//	
//	// 한달 
//	private String getMonthAgoDate() {
//	     Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
//	     cal.add(Calendar.MONTH ,-1); // 한달전 날짜 가져오기
//	     Date monthago = (Date) cal.getTime();
//	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
//	     return formatter.format(monthago);
//	}
//	
//	// 삼개월  
//	private String getThreeMonthAgoDate() {
//	     Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
//	     cal.add(Calendar.MONTH ,-3); // 세달전 날짜 가져오기
//	     Date monthago = (Date) cal.getTime();
//	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
//	     return formatter.format(monthago);
//	}
	

}