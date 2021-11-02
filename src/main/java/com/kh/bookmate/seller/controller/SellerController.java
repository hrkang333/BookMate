package com.kh.bookmate.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginSeller")
@Controller
public class SellerController {
	@Autowired 
	private SellerService sellerService;
	/*@Autowired
	private User u;
	/*
	@RequestMapping("ubookMain.ub")
	public String ubookMain(Seller s, Model model) {
		Seller loginSeller;
		loginSeller = sellerService.loginSeller(u, s);

		model.addAttribute("loginSeller", loginSeller);
		return "ubook/ubookMain";
	}*/

	@RequestMapping("ubookMain.ub")
	public String ubookMain() {
		return "ubook/ubookMain";
	}
	
	@RequestMapping("sellerPage.se")
	public String sellerPage() {
		return "seller/sellerPage";
	}
	@RequestMapping("sellerInsertForm.se")
	public String sellerInsertForm() {
		return "seller/sellerInsertForm";
	}
	
	@RequestMapping(value="insertSeller.se")
	public String sellerInsertForm(@ModelAttribute Seller s,
					 @RequestParam("detailaddress1") String detailaddress1,
					 @RequestParam("detailaddress2") String detailaddress2,
					 			HttpSession session	){
		s.setSellerAddress(detailaddress1+" "+detailaddress2); 
		
		sellerService.insertSeller(s);
		
		return "ubook/ubookMain";
	}

	@RequestMapping("ubookList.ub")
	public String ubookList() {
		return "ubook/ubookList";
	}

	@RequestMapping("ubookDetail.ub")
	public String ubookDetail() {
		return "ubook/ubookDetail";
	}
}
