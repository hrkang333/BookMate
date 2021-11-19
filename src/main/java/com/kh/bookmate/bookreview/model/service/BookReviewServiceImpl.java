package com.kh.bookmate.bookreview.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookreview.model.dao.BookReviewDao;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.common.Paging;

@Service
public class BookReviewServiceImpl implements BookReviewService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BookReviewDao bookReviewDao;
	
	@Autowired
	BookDao bookDao;

	@Override
	public void insertReview(BookReview bookReview, Book book) {
		
		// TODO Auto-generated method stub
		int result = bookReviewDao.insertReview(sqlSession,bookReview);
		int result2 = bookReviewDao.updateReviewWriter(sqlSession,bookReview);
		int result3 = bookDao.updateBookRating(sqlSession,book);
		if(result*result2*result3 < 0) {
			throw new RuntimeException("리뷰 등록 실패");
		}
	}

	@Override
	public int selectTotalCount(String bookISBN) {
		// TODO Auto-generated method stub
		return bookReviewDao.selectTotalCount(sqlSession,bookISBN);
	}

	@Override
	public List<BookReview> selectReviewList(String bookISBN, Paging reviewPaging, int i) {
		RowBounds rb = new RowBounds(reviewPaging.getStart()-1, reviewPaging.getCntPerPage());
		List<BookReview> temp = null;
		
		if(i == 1) {
			temp = bookReviewDao.selectReviewList(sqlSession,rb,bookISBN);
		}else if(i==2) {
			
		}else {
			
		}
		return temp;
	}

	@Override
	public int insertIdCheck(List<String> list) {
		
		return bookReviewDao.insertIdCheck(sqlSession,list);
	}

}
