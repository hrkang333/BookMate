package com.kh.bookmate.seller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginSeller") 
@Controller
public class SellerController {
	/*
	 * @Autowired private UserService userService;
	 */
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);
		System.out.println(userId);
		System.out.println("=======================s" + s);
		return "ubook/ubookMain";
	}
	/*
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request) {

			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			sellerService.loginSeller(userId);
			System.out.println(userId);
		return "ubook/ubookMain";
	}
	
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request, Model model) {
		
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller loginSeller = sellerService.loginSeller(userId);		
		
		model.addAttribute("loginSeller", loginSeller);

		return "ubook/ubookMain";
	}*/
	
	@RequestMapping("sellerPage.se")
	public String sellerPage(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);
		System.out.println(userId);
		System.out.println("=======================s" + s);
		return "seller/sellerPage";
	}
	@RequestMapping("sellerInsertForm.se")
	public String sellerInsertForm() {
		return "seller/sellerInsertForm";
	}
	
	@RequestMapping(value="insertSeller.se")
	public String insertSeller(@ModelAttribute Seller s,
					 @RequestParam("detailaddress1") String detailaddress1,
					 @RequestParam("detailaddress2") String detailaddress2,
					 			HttpSession session){
		
		s.setSellerAddress(detailaddress1+"/"+detailaddress2); 

		sellerService.insertSeller(s);
		
		//model.addAttribute("loginSeller", sellerInfo); 
		
		
		return "ubook/ubookMain";
	}
	
	
	/*
	@RequestMapping("insertSeller.se")
	public String insertSeller(@ModelAttribute User u,
					 @RequestParam("post") String post,
					 @RequestParam("detailaddress1") String detailaddress1,
					 @RequestParam("detailaddress2") String detailaddress2,
					 			HttpSession session, Model model ) throws Exception{
		
		u.setSellerAddress(post+"/"+detailaddress1+"/"+detailaddress2); 
		
		User sellerInfo = userService.insertSeller(u);
		model.addAttribute("loginUser", sellerInfo); 
		
		System.out.println("====================user Seller정보 넘어오니? " +sellerInfo.getSellerNickN());


		session.setAttribute("msg", "판매자 가입 성공");
		
		return "ubook/ubookMain";
	}*/

}
