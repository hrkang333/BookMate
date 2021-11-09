package com.kh.bookmate.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	



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
	public String selectMyOrderListDetail(Model model, HttpSession session, HttpServletRequest request) {
		
		
		int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
		
		System.out.println(paymentNo + "=============이거 페이먼트 넘버 네임값으로 가져온거야 ");
		
		List<PaymentDetail> myOrderListDetail = paymentService.selectMyOrderListDetail(paymentNo);
		System.out.println( paymentNo +"=============상세보기 페이먼트 넘버  ==========" + myOrderListDetail );
		
		model.addAttribute("myOrderListDetail",myOrderListDetail);
		
		return "myPage/myOrderListDetail";
	}
	
	
	
	//배송 전 주문 취소하기 
	@RequestMapping("cancelMyOrder.me")
	public String cancelMyOrder(@RequestParam User user,HttpSession session, Model model)	{
		
		
		String loginUser = ((User) session.getAttribute("loginUser")).getUserId(); 
//		ModelAndView mv = new ModelAndView();
//		PaymentDetail myOrderList = paymentService.cancelMyOrder(loginUser);
//		
		
		return "redirect:myPage/myPageOrderList.me";
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