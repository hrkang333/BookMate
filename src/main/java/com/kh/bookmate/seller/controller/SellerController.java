package com.kh.bookmate.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.service.UbookService;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.user.model.vo.User;

@SessionAttributes("loginSeller") 
@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	@Autowired
	private UbookService ubookService;
	
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request, Model model) {	
		//11.4 - 해결... (원인 : .getUserId() 때문이였음 -> if문으로 비교할 때에는 .getUserId()없이 해야한다)
		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		return "ubook/ubookMain";
	}
	
	@RequestMapping("sellerPage.se")
	public String sellerPage(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);

		return "seller/sellerPage";
	}
	/*
	@RequestMapping("ubookList.ub")
	public String ubookList(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		List<Ubook> list = sellerService.selectMyUbook(userId);
		model.addAttribute("list", list);
		return "ubook/ubookList";
	}
*/
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
		
		return "redirect:/ubookMain.ub";
	}
	
	@RequestMapping(value="deleteSeller.se")
	public String deleteSeller(Seller s, HttpServletRequest request) {
		sellerService.deleteSeller(s);
		return "redirect:/ubookMain.ub";
	}
}
