package com.kh.bookmate.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//책장메이트 메인 - 로그인 안함/로그인했지만 판매자 가입 안함/둘 다 함/판매자 휴면 비교 가능
	@RequestMapping("ubookMain.ub")
	public String ubookMain(HttpServletRequest request, Model model) {	
		//11.4 - 해결... (원인 : .getUserId() 때문이였음 -> if문으로 비교할 때에는 .getUserId()없이 해야한다)
		if((User)request.getSession().getAttribute("loginUser") == null) {
			String userId = "dlatluserId";
			Seller s = sellerService.loginSeller(userId);
			model.addAttribute("s", s);
		}else {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		return "ubook/ubookMain";
	}
	
	//판매자 닉네임 중복 확인
	@ResponseBody
	@RequestMapping(value="/chkNickN.se", method=RequestMethod.POST)
	public String chkNickN(String sellerNickN) {

		int result = sellerService.chkNickN(sellerNickN);
		if(result > 0) {  //이미 이름 있는 경우
			return "no";
		}else {
			return "use";
		}
	}
	
	//현재 로그인한 판매자 페이지 정보
	@RequestMapping("sellerPage.se")
	public String sellerPage(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		model.addAttribute("s", s);

		return "seller/sellerPage";
	}
	
	//판매자 정보 수정
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
	
	//판매자 가입 화면
	@RequestMapping("sellerInsertForm.se")
	public String sellerInsertForm() {
		return "seller/sellerInsertForm";
	}
	
	//판매자 가입
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
	
	//판매자 휴면 전환
	@RequestMapping(value="deleteSeller.se")
	public String deleteSeller(Seller s, HttpServletRequest request) {
		sellerService.deleteSeller(s);
		return "redirect:/ubookMain.ub";
	}
}
