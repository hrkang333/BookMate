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
		//11.4 - 해결... (원인 : .getUserId() 때문이였음 -> if문으로 비교할 때에는 .getUserId()없이 해야한다)
		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			model.addAttribute("s", s);
			/* System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~" + s); */
		}
		return "ubook/ubookMain";
	}
	
	@RequestMapping("sellerPage.se")
	public String sellerPage(HttpServletRequest request, Model model) {
		//1. 판매자 정보 조회
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);
		/*
		 * System.out.println(userId); System.out.println("=======================s" +
		 * s);
		 */

		return "seller/sellerPage";
	}
	

	@RequestMapping(value="sellerUpdate.se")
	public String updateSeller(@ModelAttribute Seller seller,
								HttpServletRequest request,
								@RequestParam("sellerEmail") String sellerEmail,
								@RequestParam("sellerPhone") String sellerPhone,
								@RequestParam("sellerDel") String sellerDel,
								@RequestParam("post") String post,
								 @RequestParam("address1") String address1,
								 @RequestParam("address2") String address2,
								 HttpSession session, Model model) {
		Seller s = new Seller();
		s.setSellerId(request.getParameter("sellerId"));
		s.setSellerEmail(sellerEmail);
		s.setSellerPhone(sellerPhone);
		s.setSellerDel(sellerDel);
		s.setSellerAddress(post+"/"+address1+"/"+address2); 
		
		int result = sellerService.updateSeller(s);
		/*
		 * System.out.println("++++++++++++++++++" + s.getSellerId());
		 * System.out.println("*****************************" + result);
		 * System.out.println("===========test" + s);
		 * System.out.println("===========test" + s.getSellerNickN());
		 */
		
		//return "seller/sellerPage";
		return "redirect:/sellerPage.se";
	}
	
	
	@RequestMapping("sellerInsertForm.se")
	public String sellerInsertForm() {
		return "seller/sellerInsertForm";
	}
	
	@RequestMapping(value="insertSeller.se")
	public String insertSeller(@ModelAttribute Seller s,
			@RequestParam("post") String post,
			 @RequestParam("address1") String address1,
			 @RequestParam("address2") String address2,
					 			HttpSession session){
		
		s.setSellerAddress(post+"/"+address1+"/"+address2); 

		sellerService.insertSeller(s);
		
		//model.addAttribute("loginSeller", sellerInfo); 
		
		
		//return "ubook/ubookMain";
		return "redirect:/ubookMain.ub";
	}
	
	@RequestMapping(value="deleteSeller.se")
	public String deleteSeller(Seller s, HttpServletRequest request) {
		//String userPwd = ((User)request.getSession().getAttribute("loginUser")).getUserPwd();
		sellerService.deleteSeller(s);
		return "redirect:/ubookMain.ub";
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
