package com.kh.bookmate.bookreview.model.service;

import java.util.List;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.common.Paging;

public interface BookReviewService {

	void insertReview(BookReview bookReview, Book book);

	int selectTotalCount(String bookISBN);

	List<BookReview> selectReviewList(String bookISBN, Paging reviewPaging, int i);

	int insertIdCheck(List<String> list);

}
