package com.kh.bookmate.book.model.service;

import com.kh.bookmate.book.model.vo.Book;

public interface BookService {


	Book selectBook(String bookISBN);

}
