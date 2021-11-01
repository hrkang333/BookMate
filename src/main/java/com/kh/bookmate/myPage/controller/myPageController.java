package com.kh.bookmate.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bookmate.user.model.service.UserService;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class myPageController {
	
//	@Autowired
//	private UserService userService;

	//주문리스트 화면 
	@RequestMapping("myPageOrderList.me")
	public String myOrderList() {
		return "myPage/myPageOrderList";
	}

	//내포인트 조회 화면 
	@RequestMapping("myPoint.me")
	public String myPoint() {
		return "myPage/myPoint";
	}

	
//	@RequestMapping("selectMyPoint.me")
//	public String updateMember(@ModelAttribute User u, @RequestParam("post") String post,
//			@RequestParam("address1") String address1, @RequestParam("address2") String address2, HttpSession session,
//			Model model) throws Exception {
//
//	return "redirect:/";
//
//	}
	

	
	@RequestMapping("update.me")
	public String updateUser() {
		return "myPage/updateMyPage";
	}
	
	/*
	//회원정보 수정 
	@RequestMapping("update.me") 
	public String updateMember(@ModelAttribute User user, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2")String address2, 
														 HttpSession session, Model model ) throws Exception  {
					
	//	m.setAddress( post + "/" + address1 + "/" + address2);
	
		user.setAddress(post+"/"+address1+"/"+address2);
		System.out.println("암호화전 : " + user.getUserPwd());
		
//		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
//		System.out.println("암호화 후  : " + encPwd);
//		m.setUserPwd(encPwd);
		
		
//		User userInfo = userService.updateUser(user); // 걍 정보 수정할떄 업뎃되게 해놓음 ㅜ 
//		
//		model.addAttribute("loginUser", userInfo); 

		
		session.setAttribute("msg", "회원정보 수정 성공");
		//return "redirect:/"; 
				return "myPage/updateMyPage"; //업데이트를 하고 재조회를 해서 다시 띄워준다 
	}
	*/
	
}