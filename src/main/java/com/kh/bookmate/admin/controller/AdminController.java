package com.kh.bookmate.admin.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println(notice);
		
		return null;
		
		
		
	}
	@RequestMapping("noticeEnrollForm.no")
	public String asfs() {
		
		return "notice/noticeEnrollForm";
	}
	@RequestMapping("insertNotice.no")
	public String insertNotice(Notice notice) {
		return null;
		
	}
}
