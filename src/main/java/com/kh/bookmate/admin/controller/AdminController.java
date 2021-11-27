package com.kh.bookmate.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.admin.model.service.AdminService;
import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookqna.model.service.BookQnaService;
import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;
import com.kh.bookmate.club.model.vo.Club;
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
	
	@Autowired
	private BookQnaService bookQnaService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping(value = "checkCouponCode.cp", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String insertCouponCheck(String couponCode) {
		
		Coupon coupon = couponService.selectCoupon(couponCode);
		
		if(coupon!=null) {
			
			return coupon.getCouponPoint()+"";
			
		}
		
		return "pass";
		
	}
	
	@RequestMapping("insertCouponForm.ad")
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
	public String selectNoticeList(Model mo,String keyword,@RequestParam(name="nowPage",defaultValue = "1")int nowPage, @RequestParam(name = "isUser",defaultValue = "0")int isUser) {
		String temp;
		int noticeListCount=0;
		if(keyword==null||keyword.trim().isEmpty()) {
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
		if(isUser==1) {
			return "notice/userNoticeList";
		}
		return "notice/noticeList";
	}
	
	@RequestMapping("selectNoticeDetail.no")
	public String selectNoticeDetail(Model mo, int noticeNo, @RequestParam(name = "isUser",defaultValue = "0")int isUser) {
		
		Notice notice = null;
		notice = noticeService.selectNoticeDetail(noticeNo);
		mo.addAttribute("notice", notice);
		if(isUser==1) {
			return "notice/userNoticeDetail";
		}
		
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
	
	
		
		mo.addAttribute("notice", notice);
		
		return "notice/noticeUpdateForm";
		
	}
	@RequestMapping("updateNotice.no")
	public String updateNotice(Model mo,Notice notice,int deleteImg, MultipartFile noticeImg, HttpServletRequest request) {
		String directoryPath = null;
		String path = null;
		String deletePath = null;
		String newNoticeImgName = null;
		if(notice.getNoticeCategory().equals("0")) {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"notice"+File.separator;
		}else {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"event"+File.separator;
		}
		deletePath = directoryPath+notice.getNoticeImgName();
		
		if(noticeImg.getOriginalFilename().length() > 0) {
			newNoticeImgName = changeFileNameAndSave(request, noticeImg,notice.getNoticeCategory(),directoryPath);
			
			path = directoryPath+newNoticeImgName;
		}
		
		notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
		noticeService.updateNotice(notice,path,deleteImg,deletePath,newNoticeImgName);
		Notice temp = null;
		temp = noticeService.selectNoticeDetail(notice.getNoticeNo());
		mo.addAttribute("notice", temp);
		
		return "notice/noticeDetail";
		
	}
	@RequestMapping("deleteNotice.no")
	public String deleteNotice(Model mo, int noticeNo, HttpServletRequest request) {
		Notice notice = noticeService.selectNoticeDetail(noticeNo);
		int fileStatus = notice.getNoticeImgStatus();
		String path = null;
		
		if(notice.getNoticeCategory().equals("0")) {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"notice"+File.separator+notice.getNoticeImgName();
		}else {
			path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"event"+File.separator+notice.getNoticeImgName();
		}
		noticeService.deleteNotice(noticeNo,path,fileStatus);
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

	@RequestMapping("insertNotice.no")
	public String bookEnroll(Model mo, Notice notice, MultipartFile noticeImg, HttpServletRequest request) {
		
		String directoryPath = null;
		String path = null;
		String noticeImgName = null;
		if(notice.getNoticeCategory().equals("0")) {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"notice"+File.separator;
		}else {
			directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"event"+File.separator;
		}
			notice.setNoticeContent(notice.getNoticeContent().replaceAll("\r\n", "<br>"));
			
			
		if(noticeImg.getOriginalFilename().length() > 0) {
			noticeImgName = changeFileNameAndSave(request, noticeImg,notice.getNoticeCategory(),directoryPath);
			notice.setNoticeImgStatus(1);
			notice.setNoticeImgName(noticeImgName);
		}else {
			notice.setNoticeImgStatus(0);
		}
		path = directoryPath+noticeImgName;
		noticeService.insertNotice(notice,path);
		
		mo.addAttribute("notice", notice);
		return "notice/noticeDetail";

	}

	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file, String noticeCategory, String directoryPath) {
		String originName = file.getOriginalFilename();
		new File(directoryPath).mkdirs();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String newFileName = currentTime + random + ext;
		
		try {
			file.transferTo(new File(directoryPath + newFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException("파일 저장 에러");
		}
		return newFileName;
	}

	@RequestMapping("adminQnaList.qa")
	public String selectQnaList(Model mo,@RequestParam(name="searchKind", defaultValue = "1") int searchKind,@RequestParam(name="searchKeyword", required = false) String searchKeyword,
								@RequestParam(name="nowPage", defaultValue = "1") int nowPage,@RequestParam(name="isAnswer", defaultValue = "0") int isAnswer) {
		int qnaListCount = 0;
		Paging A_QnaPaging = null;
		String keyword = null;
		List<BookQna> B_QnaList = null;
		RowBounds rb = null;
		if(searchKeyword==null||searchKeyword.trim().isEmpty()) {
			keyword = "%%";
		}else {
			keyword = "%"+searchKeyword+"%";
		}
		qnaListCount = bookQnaService.selectA_QnaListCount(searchKind,keyword,isAnswer);
		A_QnaPaging = new Paging(qnaListCount, nowPage, 10, 10);
		rb = new RowBounds(A_QnaPaging.getStart()-1, A_QnaPaging.getEnd());
		B_QnaList = bookQnaService.selectB_QnaList(searchKind,keyword,isAnswer,rb);
		mo.addAttribute("searchKind", searchKind);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("isAnswer", isAnswer);
		mo.addAttribute("A_QnaPaging", A_QnaPaging);
		mo.addAttribute("B_QnaList", B_QnaList);
		return "bookQna/bookQnaList";
		
	}
	
	@RequestMapping("selectQnaDetail.no")
	public String selectQnaDetail(Model mo,int qnaNo){
		
		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail=null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		if(qnaDetail.getQnaAnswer()==1) {
			qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaNo);
			mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		}
		mo.addAttribute("qnaDetail", qnaDetail);
		return "bookQna/bookQnaDetail";
		
	}
	@RequestMapping("intsertQnaAnswerForm.qa")
	public String intsertQnaAnswer(Model mo, int qnaNo) {
		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		mo.addAttribute("qnaDetail", qnaDetail);
		return "bookQna/bookQnaAnswerEnrollForm";
	}
	@RequestMapping("intsertQnaAnswer.qa")
	public String intsertQnaAnswer(Model mo, BookQnaAnswer qnaAnswer) {
		qnaAnswer.setQnaAnswerContent(qnaAnswer.getQnaAnswerContent().replaceAll("\r\n", "<br>"));
		BookQnaAnswer qnaAnswerDetail=null;
		bookQnaService.intsertQnaAnswer(qnaAnswer);
		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaAnswer.getQnaNo());
		if(qnaDetail.getQnaAnswer()==1) {
			qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
			mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		}
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("isJob", 1);
		return "bookQna/bookQnaDetail";
		
	}
	
	@RequestMapping("updateQnaAnswerForm.qa")
	public String updateQnaAnswerForm(Model mo, int qnaNo) {
		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail=null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
		qnaAnswerDetail.setQnaAnswerContent(qnaAnswerDetail.getQnaAnswerContent().replaceAll("<br>","\r\n"));
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		return "bookQna/bookQnaAnswerUpdateForm";
	}
	
	@RequestMapping("updateQnaAnswer.qa")
	public String updateQnaAnswer(Model mo, BookQnaAnswer qnaAnswer) {
		qnaAnswer.setQnaAnswerContent(qnaAnswer.getQnaAnswerContent().replaceAll("\r\n", "<br>"));
		bookQnaService.updateQnaAnswer(qnaAnswer);
		BookQna qnaDetail = null;
		BookQnaAnswer qnaAnswerDetail=null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaAnswer.getQnaNo());
		qnaAnswerDetail = bookQnaService.selectA_QnaAnswerDetail(qnaDetail.getQnaNo());
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("qnaAnswerDetail", qnaAnswerDetail);
		mo.addAttribute("isJob", "1");
		return "bookQna/bookQnaDetail";
	}
	@RequestMapping("deleteQnaAnswer.qa")
	public String deleteQnaAnswer(Model mo , int qnaNo ) {
		
		bookQnaService.deleteQnaAnswer(qnaNo);
		
		
		
		BookQna qnaDetail = null;
		qnaDetail = bookQnaService.selectA_QnaDetail(qnaNo);
		mo.addAttribute("qnaDetail", qnaDetail);
		mo.addAttribute("isJob", "1");
		return "bookQna/bookQnaDetail";
		
	}
	
	@RequestMapping("selectClubConfirmList.cl")
	public String selectClubConfirmList(Model mo,@RequestParam(name = "nowPage",defaultValue = "1") int nowPage,@RequestParam(name = "searchKeyword",defaultValue = "") String searchKeyword) {
		String keyword = null;
		Paging clubPaging = null;
		List<Club> selectClubConfirmList = null;
		RowBounds rb = null;
		int clubListCount = 0;
		if(searchKeyword==null||searchKeyword.trim().isEmpty()) {
			keyword="%%";
		}else {
			keyword="%"+searchKeyword+"%";
		}
		
		clubListCount = adminService.clubListCount(keyword);
		clubPaging = new Paging(clubListCount, nowPage, 10, 10);
		rb = new RowBounds(clubPaging.getStart()-1, clubPaging.getCntPerPage());
		selectClubConfirmList = adminService.selectClubConfirmList(keyword,rb);
		
		mo.addAttribute("clubPaging", clubPaging);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("searchKeyword", searchKeyword);
		mo.addAttribute("selectClubConfirmList", selectClubConfirmList);
		
		return "admin/adminClubConfirm";
	}
	
	@RequestMapping("updateClubConfirm.cl")
	public String updateClubConfirm(int clubNo,int confirmStatus) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("confirmStatus",confirmStatus);
		map.put("clubNo",clubNo);
		adminService.updateClubConfirm(map);
		return "forward:/selectClubConfirmList.cl";

	}
	
	@RequestMapping("adminMainBookStock.st")
	public String adminMainBookStock(Model mo, @RequestParam(name = "nowPage" ,defaultValue = "1") int nowPage) {
		List<Book> list = null;
		Paging bookStockPaging = null;
		int lessStockBookCount = 0;
		RowBounds rb =null;
		int checkStock = 50;
		lessStockBookCount = adminService.selectLessStockCount(checkStock+1);
		bookStockPaging = new Paging(lessStockBookCount, nowPage, 5	, 10);
		rb = new RowBounds(bookStockPaging.getStart()-1, bookStockPaging.getCntPerPage());
		list = adminService.selectLessStockBook(rb,checkStock+1);
		System.out.println("-----------------------------------------------------------------");
		System.out.println(bookStockPaging);
		System.out.println(list.size());
		mo.addAttribute("bookStockPaging", bookStockPaging);
		mo.addAttribute("nowPage", nowPage);
		mo.addAttribute("bookStockList", list);
		return "admin/adminBookStockCheck";
		
	}
	
	@RequestMapping("selectISBNStock")
	@ResponseBody
	public Map<String, Object> selectISBNStock(String bookISBN){
		Book book = null;
		Map<String, Object> map = new HashMap<String, Object>();
		book = bookService.selectBookStock(bookISBN);
		if(book==null) {
			map.put("str", "fail");
			return map;
		}
		map.put("str", "pass");
		map.put("book",book);
		System.out.println(map);
		return map;
		
	}
	
	@RequestMapping("updateBookPlusStock")
	@ResponseBody
	public String updateBookPlusStock(String bookISBN, int plusStock) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bookISBN", bookISBN);
		map.put("plusStock",plusStock);
		
		bookService.updateBookPlusStock(map);
		
		return "pass";
	}
	
	@RequestMapping("adminMainPage.ad")
	public String adminMainPage() {

		
		return "forward:/adminMainBookStock.st";
		
	}
}
