package com.kh.bookmate.ubook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bookmate.seller.model.service.SellerService;
import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.ubook.model.service.UbookService;
import com.kh.bookmate.ubook.model.vo.Ubook;
import com.kh.bookmate.user.model.vo.User;

@Controller
public class UbookController {

	@Autowired
	UbookService ubookService;

	@Autowired
	private SellerService sellerService;
	
	/*
	//카테고리 리스트 - 소설/시/에세이
	@RequestMapping("ubookCateList1.ub")
	public String ubookCateList1(HttpServletRequest request, Model model) {	
		//11.4 - 해결... (원인 : .getUserId() 때문이였음 -> if문으로 비교할 때에는 .getUserId()없이 해야한다)
		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		List<Ubook> list = ubookService.ubookCateList1();
		model.addAttribute("list", list);
		for(int i=0; i < list.size(); i++) {
			Ubook str = list.get(i);
			System.out.println("셀러 번호 보이려나 모르겠네" + str.getBSellerNo());
		}
		
		return "ubook/ubookCateList1";
	}*/
	
	//판매자 페이지 - 내가 등록한 도서 리스트
	@RequestMapping("ubookList.ub")
	@ResponseBody
	public List<Ubook> selectbookList(HttpServletRequest request, Model model) {
		String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
		Seller s = sellerService.loginSeller(userId);
		int sellerNo = s.getSellerNo();
		List<Ubook> list = ubookService.selectbookList(sellerNo);
		//System.out.println(list.size());
		model.addAttribute("list", list);
		return list;
	}
	
	//판매자 페이지 - 내가 등록한 도서 삭제
	@RequestMapping("deleteMyUbook.ub")
	@ResponseBody
	public int deleteMyUbook(int ubookNo) {
		
		return ubookService.deleteMyUbook(ubookNo);
	}
	
	//판매자 페이지 - 내가 등록한 도서 수정
	@RequestMapping("updateMyUbook.ub")
	public String ubookDetail() {
		return "ubook/ubookList";
	}

	//도서 카테고리
	@RequestMapping("ubookCategory.ub")
	public String selectCategory(@RequestParam("ubCategory") int ubCategory, HttpServletRequest request, Model model) {

		if((User)request.getSession().getAttribute("loginUser") != null) {
			String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
			Seller s = sellerService.loginSeller(userId);
			//System.out.println("셀러?" + s.getSellerNo());
			model.addAttribute("s", s);
		}
		List<Ubook> list = ubookService.selectCategory(ubCategory);
		model.addAttribute("list", list);
		for(int i=0; i < list.size(); i++) {
			Ubook str = list.get(i);
			System.out.println("셀러 번호 보이려나 모르겠네" + str.getBSellerNo());
		}
		
		return "ubook/ubookCategory";
	}
/*
	@RequestMapping("ubookDetail.ub")
	public String ubookDetail() {
		return "ubook/ubookDetail";
	}
*/
	
	//도서 상세
	@RequestMapping("ubookDetailTest.ub")
	public ModelAndView ubookDetail(@RequestParam("ubookNo") int ubookNo, ModelAndView mv) {

		Ubook ubook = ubookService.selectUbook(ubookNo);
		mv.addObject("ubook", ubook).setViewName("ubook/ubookDetailTest");
		return mv;
		/*
		System.out.println("도서야~~ 나와줘~~~~~" + ubook.getUbookName());
		model.addAttribute("ubook", ubook);
		return "ubook/ubookDetailTest";*/
	}
	
	//판매자 페이지 - 도서 등록
	@RequestMapping("ubookEnrollForm.ub")
	public String ubookEnrollForm() {
		return "seller/ubookEnrollForm";
	}

	//판매자 페이지 - 도서 등록 form
	@RequestMapping("ubookEnroll.ub")
	public String ubookEnroll(Ubook ubook,
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date ubookPubDate,
								@RequestParam("UbookImgFile") MultipartFile UbookImgFile,
								HttpServletRequest request,
								Model model) {


		ubook.setUbookPubDate(ubookPubDate);
		ubook.setUbookDetail(ubook.getUbookDetail().replaceAll("\r\n", "<br>"));
		ubook.setUbookContent(ubook.getUbookContent().replaceAll("\r\n", "<br>"));
		//안된다면 이 부분일듯
		String ubookImg = changeFileNameAndSave(request, UbookImgFile);
		System.out.println("ubookImg~~~~~~~~~~~~~~" + ubookImg);
		ubook.setUbookImg(ubookImg);
		
		
			ubookService.insertUbook(ubook);

			System.out.println("ubook~~~~~~~~~~~~~~" + ubook);
			System.out.println("getUbCategory~~~~~~~~~~~~~~" + ubook.getUbCategory());
			
			//Ubook ubookDetail = ubookService.selectUbook(ubook.getUbookNo());
			
			//model.addAttribute("ubook", ubookDetail);
			
			
			//return "redirect:/sellerPage.se";
			//return "seller/ubookEnroll";
			return "redirect:/sellerPage.se";
	}
	
	//이미지 파일 변환 및 업로드
	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file) {

		String originName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"Ubookimg"+File.separator;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String newFileName = currentTime + random + ext;
		
		try {
			file.transferTo(new File(path + newFileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("파일 업로드 에러");
		}
		return newFileName;
	}
}
