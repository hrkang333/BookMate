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
import com.kh.bookmate.payment.model.vo.Payment;
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
	

	//주문리스트 화면 띄우기 
	@RequestMapping("myPageOrderList.me")
	public String myOrderList() {
		return "myPage/myPageOrderList";
	}

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

	
	//주문리스트  조회
	//주문번호, 주문금액, 상품정보, 수량, 주문상태 값 조회하기 
	@RequestMapping("SelectMyOrderList.me")
	public String SelectMyOrderList(@ModelAttribute User user,
									@ModelAttribute Payment payment,
														@RequestParam("paymentNo") String paymentNo,
														@RequestParam("totalCost") int totalCost,
														@RequestParam("bookMainImg") String bookMainImg,
														@RequestParam("quantity") int quantity,
														@RequestParam("deliveryStatus") int deliveryStatus,
														HttpSession session, Model model ) { 
		
		User loginUser = (User) session.getAttribute("loginUser"); 
		ArrayList <Payment> myOrderList = paymentService.SelectMyOrderList(loginUser);
		
		model.addAttribute("myOrderList",myOrderList);
		
		return "myPage/myPageOrderList";
	}
	

	
}