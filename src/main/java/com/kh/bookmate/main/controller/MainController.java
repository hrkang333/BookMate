package com.kh.bookmate.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/")
	public String selectMainBest(Model model) {
		
		//1.이벤트
		
		//2.오늘의 책 
		System.out.println("오늘의책 테스트 시작");
		int category_kor = 0;
		int category_ebook = 2;
		List<Book> todayList_K = mainService.selectTodayList(category_kor);
		List<Book> todayList_E = mainService.selectTodayList(category_ebook);
		
		model.addAttribute("todayList_K", todayList_K);
		model.addAttribute("todayList_E", todayList_E);
		
		int count=1;
		for(Book b : todayList_K) {
			System.out.println(count +" 오늘의책 테스트 : " + b.toString());
		}
		
		//3.베스트 도서
		List<Book> bestList = mainService.selectBestList();
		model.addAttribute("bestList", bestList);
		
		//4.화제의 신간
//		ArrayList<Book> hotBook = bookService.selectHotTopicBook();
//	    model.addAttribute("hotBook", hotBook);
		
		//5.최근본상품
		
		for(Book b : todayList_K) {
			System.out.println(count +" 오늘의책 테스트 : " + b.toString());
		}
	
		return "index";
	}
}
