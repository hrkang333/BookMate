package com.kh.bookmate.main.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;

public interface MainService {

	List<Book> selectBestList();

	List<Book> selectTodayList(int category_number);

}
