package com.kh.bookmate.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.coupon.model.service.CouponService;
import com.kh.bookmate.coupon.model.vo.Coupon;
import com.kh.bookmate.notice.model.service.NoticeService;
import com.kh.bookmate.notice.model.vo.Notice;

@Controller
public class AdminController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "checkCouponCode.cp", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String insertCouponCheck(String couponCode) {
		
		Coupon coupon = couponService.selectCoupon(couponCode);
		
		if(coupon!=null) {
			
			return coupon.getCouponPoint()+"";
			
		}
		
		return "pass";
		
	}
	
	@RequestMapping("adminPageOpen.ad")
	public String adminPageOpen() {
		return "admin/adminInsertCoupon";
	}

	
	@RequestMapping("insertCoupon.cp")
	@ResponseBody
	public String insertCoupon(Coupon coupon) {
		int result = couponService.insertCoupon(coupon);
		if(result > 0 )
		return "success";
		return "fail";
		
	}
	
	@RequestMapping("noticeList.no")
	public String selectNoticeList(Model mo,String keyword,@RequestParam(name="nowPage",defaultValue = "1")int nowPage) {
		String temp;
		int noticeListCount=0;
		if(keyword==null||keyword=="") {
			temp = "%%";
		}else {
			temp = "%"+keyword+"%";
		}
		noticeListCount = noticeService.selectNoticeCount(temp);
		Paging noticePaging = new Paging(noticeListCount, nowPage, 10, 10);
		List<Notice> noticeList = null; 
		RowBounds rb = new RowBounds(noticePaging.getStart()-1, noticePaging.getCntPerPage());
		noticeList = noticeService.selectNoticeList(temp,rb);
		
		mo.addAttribute("keyword", keyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("noticeList", noticeList);
		mo.addAttribute("noticePaging", noticePaging);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("selectNoticeDetail.no")
	public String selectNoticeDetail(Model mo, int noticeNo) {
		
		Notice notice = null;
		notice = noticeService.selectNoticeDetail(noticeNo);
		mo.addAttribute("notice", notice);
		
		return "notice/noticeDetail";
		
		
		
	}
	@RequestMapping("noticeEnrollForm.no")
	public String asfs() {
		
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("updateNoticeForm.no")
	public String updateNoticeForm(Model mo, int noticeNo) {
		Notice notice = null;
		notice = noticeService.selectNoticeDetail(noticeNo);
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("<br>","\r\n"));
	
		noticeService.updateNotice(notice);
		
		mo.addAttribute("notice", notice);
		
		return "notice/noticeUpdateForm";
		
	}
	@RequestMapping("updateNotice.no")
	public String updateNotice(Model mo,Notice notice) {
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
		System.out.println(notice);
		noticeService.updateNotice(notice);
		Notice temp = null;
		temp = noticeService.selectNoticeDetail(notice.getNoticeNo());
		mo.addAttribute("notice", temp);
		
		return "notice/noticeDetail";
		
	}
	@RequestMapping("deleteNotice.no")
	public String deleteNotice(Model mo, int noticeNo) {
		noticeService.deleteNotice(noticeNo);
		int nowPage = 1;
		String keyword = null;
		String temp= "%%";
		int noticeListCount=0;
		
		noticeListCount = noticeService.selectNoticeCount(temp);
		Paging noticePaging = new Paging(noticeListCount, nowPage, 10, 10);
		List<Notice> noticeList = null; 
		RowBounds rb = new RowBounds(noticePaging.getStart()-1, noticePaging.getCntPerPage());
		noticeList = noticeService.selectNoticeList(temp,rb);
		
		mo.addAttribute("keyword", keyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("noticeList", noticeList);
		mo.addAttribute("noticePaging", noticePaging);
		
		return "notice/noticeList";
		
	}
//	@RequestMapping("insertNotice.no")
//	public String insertNotice(Model mo, Notice notice) {
//		notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
//		noticeService.insertNotice(notice);
//		
//		mo.addAttribute("notice", notice);
//		
//		return "notice/noticeDetail";
//		
//	}
	@RequestMapping("insertNotice.no")
	public String bookEnroll(Model mo, Notice notice, MultipartFile noticeImg, HttpServletRequest request) {
		
			notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
			
			
		if(noticeImg.getOriginalFilename().length() > 0) {
			String noticeImgName = changeFileNameAndSave(request, noticeImg,notice.getNoticeCategory());
			notice.setNoticeImgStatus(1);
			notice.setNoticeImgName(noticeImgName);
		}else {
			notice.setNoticeImgStatus(0);
		}
			
		noticeService.insertNotice(notice);
		
		mo.addAttribute("notice", notice);
		return "notice/noticeDetail";

	}

	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file, String noticeCategory) {
		String path = null;
		String originName = file.getOriginalFilename();
		if(noticeCategory.equals("0")) {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"notice"+File.separator;
			new File(path).mkdirs();
		}else {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"event"+File.separator;
			new File(path).mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String newFileName = currentTime + random + ext;
		
		try {
			file.transferTo(new File(path + newFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException("파일 업로드 에러");
		}
		return newFileName;
	}
	
}
