package com.kh.bookmate.bookreview.model.service;

import java.util.List;

import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.common.Paging;

public interface BookReviewService {

	void insertReview(BookReview bookReview);

	int selectTotalCount();

	List<BookReview> selectReviewList(Paging reviewPaging, int i);

}
