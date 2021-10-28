package com.kh.bookmate.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.bookmate.book.model.service.BookService;
import com.kh.bookmate.book.model.vo.Book;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@RequestMapping("selectBook.book")
	public Model selectBook(String bookISBN, Model mo) {
		
		Book book = bookService.selectBook(bookISBN);
		
		
		
		System.out.println(book);
		
		
		return mo;
		
		
	}

}
