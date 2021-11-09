package com.kh.bookmate.book.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;

public interface BookService {


	Book selectBook(String bookISBN);

	void insertBook(Book book);


	List<Book> selectCategoryBookList(int i);

	void sellDateInsert(List<Book> bookList);

	List<Book> selectBestBookList(int bookSubCategory);

	List<Book> selectNewBookList(int bookSubCategory);

	int selectAllBestRank(String bookISBN);

	int selectCategoryBestRank(Book book);

	Book selectCheckISBN(String bookISBN);

}
