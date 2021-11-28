package com.kh.bookmate.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.bookmate.addressBook.model.vo.AddressBook;
import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookqna.model.service.BookQnaService;
import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookreview.model.service.BookReviewService;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.bookreview.model.vo.BookReviewReply;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.payment.model.vo.Payment;
import com.kh.bookmate.payment.model.vo.PaymentDetail;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethod;
import com.kh.bookmate.paymentmethod.model.vo.PaymentMethodDetail;
import com.kh.bookmate.shoppingbasket.model.vo.ShoppingBasket;
import com.kh.bookmate.user.model.vo.User;
import com.kh.bookmate.wishlist.model.service.WishListService;
import com.kh.bookmate.wishlist.model.vo.WishList;


@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private BookReviewService bookReviewService;
	
	@Autowired
	private BookQnaService bookQnaService;
	
	@Autowired
	private WishListService wishListService;
	

	private String[] categoryNameArr = {"소설/시/에세이" , "경제/경영" , "과학" , "인문",  "컴퓨터/IT", "자기계발" ,  "정치/사회", "역사/문화", "취미" ,  "가정/육아" };
	         
	@RequestMapping("bookTemp.book")
	public String bookTemp() {
		return "book/bookTemp";
	}
	
	@RequestMapping("selectBook.book")
	public String selectBook(String bookISBN, Model mo,@RequestParam(name="reviewKind",defaultValue = "1") int reviewKind, 
								@RequestParam(name="reviewNowPage",defaultValue = "1") int reviewNowPage, @RequestParam(name="questionNowPage",defaultValue = "1") int questionNowPage,
								@RequestParam(name="questionKind",defaultValue = "5") int questionKind,@RequestParam(name="pagePosition",defaultValue = "0") int pagePosition,@SessionAttribute(name = "loginUser",required = false ) User loginUser) {
		Paging reviewPaging; 
		Paging qnaPaging; 
		List<Book> bestBookList;
		List<Book> newBookList;
		List<Book> bestList;
		List<BookReview> reviewList;
		List<BookQna> qnaList;
		Book book;
		int allBestRank;
		int categoryBestRank;
		int reviewCount;
		int qnaCount;
		String user_Id = null;
		if(loginUser!=null) {
			user_Id = loginUser.getUserId();
			bookService.insertRecentView(loginUser.getUserId(),bookISBN);			
		}
		
		qnaCount = bookQnaService.selectTotalCount(bookISBN,questionKind,user_Id);
		reviewCount = bookReviewService.selectTotalCount(bookISBN);
		book = bookService.selectBook(bookISBN);
		book.setBookReviewCount(reviewCount);
		allBestRank = bookService.selectAllBestRank(bookISBN);
		categoryBestRank = bookService.selectCategoryBestRank(book);
		book.setAllBestRank(allBestRank);
		book.setCategoryBestRank(categoryBestRank);
		newBookList = bookService.selectNewBookList(book.getBookSubCategory());
		bestBookList = bookService.selectBestBookList(book.getBookSubCategory());
		bestList = new ArrayList<Book>(bestBookList.subList(0, 5));
		reviewPaging = new Paging(reviewCount, reviewNowPage, 5, 10);
		reviewList = bookReviewService.selectReviewList(bookISBN,reviewPaging,reviewKind);
		qnaPaging = new Paging(qnaCount, questionNowPage, 10, 10);
		qnaList = bookQnaService.selectList(bookISBN,qnaPaging,questionKind,user_Id);
	

		mo.addAttribute("pagePosition", pagePosition);
		mo.addAttribute("questionKind", questionKind);
		mo.addAttribute("qnaPaging", qnaPaging);
		mo.addAttribute("qnaList", qnaList);
		mo.addAttribute("reviewPaging", reviewPaging);
		mo.addAttribute("reviewKind", reviewKind);
		mo.addAttribute("reviewList", reviewList);
		mo.addAttribute("newBookList", newBookList);
		mo.addAttribute("bestList", bestList);
		mo.addAttribute("book", book);
		mo.addAttribute("categoryName", categoryNameArr[book.getBookSubCategory()]);
		mo.addAttribute("bestListIndex", 0);
		mo.addAttribute("checkWishList", checkWishList(user_Id, bookISBN));
		
		return "book/bookDetail";

	}

	@RequestMapping("bookEnrollForm.book")
	public String bookEnrollForm() {

		return "book/bookEnrollForm";

	}

	@RequestMapping("bookEnroll.book")
	public String bookEnroll(Book book,@DateTimeFormat(pattern = "yyyy-MM-dd") Date publicheDate,
			@RequestParam("bookMainImgFile") MultipartFile bookMainImgFile, MultipartFile bookDetailImgFile, HttpServletRequest request, Model mo) {
		
		String bookMainImg = changeFileNameAndSave(request, bookMainImgFile);
		String bookDetailImg = changeFileNameAndSave(request, bookDetailImgFile);
		book.setBookContents(book.getBookContents().replaceAll("\r\n", "<br>"));
		book.setBookIntro(book.getBookIntro().replaceAll("\r\n", "<br>"));
		book.setBookMainImg(bookMainImg);
		book.setBookDetailImg(bookDetailImg);
		book.setBookPublicheDate(publicheDate);
	
		bookService.insertBook(book);
		
		Book bookDetail = bookService.selectBook(book.getBookISBN());
		
		mo.addAttribute("book", bookDetail);
		

		return "book/bookDetail";

	}
	
	@RequestMapping("bookUpdate.book")
	public String bookUpdate(Book book,@DateTimeFormat(pattern = "yyyy-MM-dd") Date publicheDate,@RequestParam("bookMainImgFile") MultipartFile bookMainImgFile, 
							MultipartFile bookDetailImgFile, HttpServletRequest request,String exBookISBN,RedirectAttributes ra) {
		String bookDetailImg;
		String bookMainImg;
		int imgDeleteCheck = 0;
		String directoryPath = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"book_img"+File.separator;
		Book temp = bookService.selectBook(exBookISBN);
		if(bookMainImgFile.getOriginalFilename().length() > 0) {
			bookMainImg = changeFileNameAndSave(request, bookMainImgFile);
			book.setBookMainImg(bookMainImg);
			imgDeleteCheck += 1;
		}else {
			book.setBookMainImg(temp.getBookMainImg());
		}
		if(bookDetailImgFile.getOriginalFilename().length() > 0) {
			bookDetailImg = changeFileNameAndSave(request, bookDetailImgFile);
			book.setBookDetailImg(bookDetailImg);
			imgDeleteCheck += 2;
		}else {
			book.setBookDetailImg(temp.getBookDetailImg());
		}
		
		
		book.setBookContents(book.getBookContents().replaceAll("\r\n", "<br>"));
		book.setBookIntro(book.getBookIntro().replaceAll("\r\n", "<br>"));
		
		
		book.setBookPublicheDate(publicheDate);
	
		bookService.updateBook(book,temp,imgDeleteCheck,directoryPath);
		
		Book bookDetail = bookService.selectBook(book.getBookISBN());
		
		ra.addAttribute("bookISBN", bookDetail.getBookISBN());
		

		return "redirect:/selectBook.book";
		
	}
	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file) {

		String originName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"book_img"+File.separator;
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
	
	@RequestMapping("tempBook.book")
	public String tempBook() {
		List<Book> bookList = new ArrayList<Book>();
		
		for(int i = 0 ;i<10;i++) {
			bookList = bookService.selectCategoryBookList(i);
			
			
			bookService.sellDateInsert(bookList);
		}
		
		
		
		
		return "book/bookTemp";	
		
	}

	
	@RequestMapping(value = "bestListMove")
	@ResponseBody
	public List<Book> bestListMove(int listIndex, int bookSubCategory) {
		List<Book> bestBookList;
		
		List<Book> bestList;
	
		bestBookList = bookService.selectBestBookList(bookSubCategory);
		if(listIndex<5) {
			bestList = new ArrayList<Book>(bestBookList.subList(listIndex, listIndex+5));			
		}else {
			List<Book> joinBestList = new ArrayList<Book>();
			joinBestList.addAll(bestBookList);
			joinBestList.addAll(bestBookList);
			bestList = new ArrayList<Book>(joinBestList.subList(listIndex, listIndex+5));
			
		}
		
    
	        
		return bestList;
	}
	
	@RequestMapping(value = "checkISBN", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String checkISBN(String bookISBN) {

		Book book = bookService.selectCheckISBN(bookISBN);

		if(book!=null) {
			return book.getBookTitle();
		}

		return "pass";

	}
	
	@RequestMapping("insertReview.re")
	@ResponseBody
	public String insertReview(BookReview bookReview) {
		User user = new User();
		BookReview temp = bookReview;
		Book book = bookService.selectBook(bookReview.getBookISBN());
		double bookRating = ((book.getBookRating()*book.getBookRatingCount())+bookReview.getBookRating())/(book.getBookRatingCount()+1);
		bookRating = Math.round(bookRating*10)/10.0;
		book.setBookRatingCount(book.getBookRatingCount()+1);
		book.setBookRating(bookRating);
		user.setUserId(bookReview.getReviewWriter());
		user.setPoint((int)Math.round(book.getBookPrice()*0.02));
		bookReviewService.insertReview(bookReview,book, user);
		
		return "success";
	}

	@RequestMapping("reviewIdCheck.re")
	@ResponseBody
	public String selectReviewIdCheck(String user_Id,String bookISBN) {
		
		List<String> list = new ArrayList<String>();
		list.add(user_Id);
		list.add(bookISBN);
		
		int status = bookReviewService.insertIdCheck(list);
		System.out.println(status);
		return status+"";		
	}
	
	@RequestMapping("selectReviewReply.re")
	@ResponseBody
	public List<BookReviewReply> selectReviewReply(int reviewNo) {
		
		List<BookReviewReply> list = bookReviewService.selectReviewReply(reviewNo);
		
		System.out.println(list.get(0).getReviewReplyDate());
		
		return list;
		
	}
	
	@RequestMapping("updateReview.re")
	@ResponseBody
	public String updateReview(BookReview review) {
		
		bookReviewService.updateReview(review);
		
		return "pass";
		
	}

	
	@RequestMapping("insertReviewReply.re")
	@ResponseBody
	public String insertReviewReply(BookReviewReply reviewReply) {
		
		bookReviewService.insertReviewReply(reviewReply);
		
		return "pass";
		
	}
	@RequestMapping("deleteReply.re")
	@ResponseBody
	public String deleteReply(BookReviewReply reviewReply) {
		
		bookReviewService.deleteReply(reviewReply);
				
		
		return "pass";
				
	}
	
	@RequestMapping("updateReply.re")
	@ResponseBody
	public String updateReply(BookReviewReply reviewReply) {
		
		bookReviewService.updateReply(reviewReply);
		
		return "pass";
		
	}
	
	@RequestMapping("insertAnswer.re")
	@ResponseBody
	public String insertAnswer(BookReviewReply reviewReply) {
		
		bookReviewService.insertAnswer(reviewReply);
		
		
		return "pass";
		
	}
	
	@RequestMapping("deleteAnswer.re")
	@ResponseBody
	public String deleteAnswer(BookReviewReply reviewReply) {
		
		bookReviewService.deleteAnswer(reviewReply);
		
		return "pass";
				
	}
	
	@RequestMapping("selectQnaDetail.qa")
	@ResponseBody
	public List<String> selectQnaDetail(@RequestParam(name = "qnaNo") int qnaNo){
		
		List<String> strList = null;
		
		strList = bookQnaService.selectQnaDetail(qnaNo);
		
		return strList;
		
	}
	
	@RequestMapping("qnaUpdate.qa")
	@ResponseBody
	public String qnaUpdate(BookQna bookQna) {
		
		
		bookQnaService.qnaUpdate(bookQna);
		
		return "pass";
		
		
		
	}
	
	@RequestMapping("qnaInsert.qa")
	@ResponseBody
	public String qnaInsert(BookQna bookQna) {
		
		bookQnaService.qnaInsert(bookQna);
		
		return "pass";
		
	}
	@RequestMapping("qnaDelete.qa")
	@ResponseBody
	public String qnaDelete(int qnaNo) {
		
		bookQnaService.qnaDelete(qnaNo);
		return "pass";
		
		
	}
	
	
	public String checkWishList(String user_Id,String bookISBN) {
		if(user_Id==null) {
			return "pass";
		}
		WishList wish = new WishList(user_Id, bookISBN);
		WishList temp = null; 
		temp = wishListService.selectWish(wish);
		if(temp!=null) {
			return "already";
		}
		return "pass";
		
	}
	
	@RequestMapping("updateWishList.wl")
	@ResponseBody
	public String updateWishList(String bookISBN,int wishListStatus,@SessionAttribute("loginUser") User loginUser) {
		
		WishList wish = new WishList(loginUser.getUserId(), bookISBN);
		
		wishListService.updateWishList(wish,wishListStatus);
		
		return "pass";
		
	}
	
	@RequestMapping("updateBook.book")
	public String updateBook(String bookISBN, Model mo) {
		Book book = bookService.selectBook(bookISBN);
		book.setBookContents(book.getBookContents().replaceAll("<br>","\r\n"));
		book.setBookIntro(book.getBookIntro().replaceAll("<br>","\r\n" ));
		mo.addAttribute("book", book);
		
		return "book/bookUpdateForm";
	}
	
}
