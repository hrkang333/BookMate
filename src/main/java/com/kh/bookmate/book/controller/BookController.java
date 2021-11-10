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
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;

@Controller
public class BookController {

	@Autowired
	BookService bookService;

	@RequestMapping("bookTemp.book")
	public String bookTemp() {
		return "book/bookTemp";
	}
	
	@RequestMapping("selectBook.book")
	public String selectBook(String bookISBN, Model mo) {
		List<Book> bestBookList;
		List<Book> newBookList;
		List<Book> bestList;
		Book book;
		int allBestRank;
		int categoryBestRank;
		
		
		book = bookService.selectBook(bookISBN);
		allBestRank = bookService.selectAllBestRank(bookISBN);
		categoryBestRank = bookService.selectCategoryBestRank(book);
		book.setAllBestRank(allBestRank);
		book.setCategoryBestRank(categoryBestRank);
		newBookList = bookService.selectNewBookList(book.getBookSubCategory());
		bestBookList = bookService.selectBestBookList(book.getBookSubCategory());
		bestList = new ArrayList<Book>(bestBookList.subList(0, 5));
		

//		book.setBookContents(book.getBookContents().replaceAll("<br>", "\r\n"));
//		book.setBookIntro(book.getBookIntro().replaceAll("<br>", "\r\n"));
		System.out.println(book);

		mo.addAttribute("newBookList", newBookList);
		mo.addAttribute("bestList", bestList);
		mo.addAttribute("book", book);
		mo.addAttribute("categoryName", "취미");
		mo.addAttribute("bestListIndex", 0);

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

//		return "book/bookEnrollForm";

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
		
		bookList = bookService.selectCategoryBookList(8);
		
		
		System.out.println(bookList.size());
		
		bookService.sellDateInsert(bookList);
		
		
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
	@RequestMapping("bookKor.book")
	public String bookKor() {
		return "book/bookKor";
	}
}
