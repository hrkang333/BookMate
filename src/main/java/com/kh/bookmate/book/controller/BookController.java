package com.kh.bookmate.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		Book book = bookService.selectBook(bookISBN);

//		book.setBookContents(book.getBookContents().replaceAll("<br>", "\r\n"));
//		book.setBookIntro(book.getBookIntro().replaceAll("<br>", "\r\n"));
		System.out.println(book);
		
		mo.addAttribute("book", book);

		return "book/bookDetail";

	}

	@RequestMapping("bookEnrollForm.book")
	public String bookEnrollForm() {

		return "book/bookEnrollForm";

	}

	@RequestMapping("bookEnroll.book")
	public String bookEnroll(Book book,@DateTimeFormat(pattern = "yyyy-MM-dd") Date publicheDate,
			@RequestParam("bookMainImgFile") MultipartFile bookMainImgFile, MultipartFile bookDetailImgFile, HttpServletRequest request) {
		
		String bookMainImg = changeFileNameAndSave(request, bookMainImgFile);
		String bookDetailImg = changeFileNameAndSave(request, bookDetailImgFile);
		book.setBookContents(book.getBookContents().replaceAll("\r\n", "<br>"));
		book.setBookIntro(book.getBookIntro().replaceAll("\r\n", "<br>"));
		book.setBookMainImg(bookMainImg);
		book.setBookDetailImg(bookDetailImg);
		book.setBookPublicheDate(publicheDate);
	
		bookService.insertBook(book);

		return "book/bookEnrollForm";

	}

	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file) {

		String originName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("resources") + "\\images\\book_img\\";
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
