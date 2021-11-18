package com.kh.bookmate.bookreview.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.bookreview.model.dao.BookReviewDao;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.common.Paging;

@Service
public class BookReviewServiceImpl implements BookReviewService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BookReviewDao bookReviewDao;

	@Override
	public void insertReview(BookReview bookReview) {
		// TODO Auto-generated method stub
		int result = bookReviewDao.insertReview(sqlSession,bookReview);
		int result2 = bookReviewDao.updateReviewWriter(sqlSession,bookReview);
		if(result*result2 < 0) {
			throw new RuntimeException("리뷰 등록 실패");
		}
	}

	@Override
	public int selectTotalCount() {
		// TODO Auto-generated method stub
		return bookReviewDao.selectTotalCount(sqlSession);
	}

	@Override
	public List<BookReview> selectReviewList(Paging reviewPaging, int i) {
		RowBounds rb = new RowBounds(reviewPaging.getStart(), reviewPaging.getCntPerPage());
		List<BookReview> temp = null;
		
		if(i == 1) {
			temp = bookReviewDao.selectReviewList(sqlSession,rb);
		}else if(i==2) {
			
		}else {
			
		}
		return temp;
	}

}
