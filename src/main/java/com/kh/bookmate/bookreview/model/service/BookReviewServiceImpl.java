package com.kh.bookmate.bookreview.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.bookreview.model.dao.BookReviewDao;
import com.kh.bookmate.bookreview.model.vo.BookReview;
import com.kh.bookmate.bookreview.model.vo.BookReviewReply;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.common.Paging;
import com.kh.bookmate.user.model.dao.UserDao;
import com.kh.bookmate.user.model.vo.User;

@Service
public class BookReviewServiceImpl implements BookReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BookReviewDao bookReviewDao;
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private UserDao userDao;

	@Override
	public void insertReview(BookReview bookReview, Book book,User user) {
		
		// TODO Auto-generated method stub
		int result = bookReviewDao.insertReview(sqlSession,bookReview);
		int result2 = bookReviewDao.updateReviewWriter(sqlSession,bookReview);
		int result3 = bookDao.updateBookRating(sqlSession,book);
		int result4 = userDao.updatePoint(sqlSession,user);
		if(result*result2*result3*result4 < 0) {
			throw new RuntimeException("리뷰 등록 실패");
		}
	}

	@Override
	public int selectTotalCount(String bookISBN) {
		// TODO Auto-generated method stub
		return bookReviewDao.selectTotalCount(sqlSession,bookISBN);
	}

	@Override
	public List<BookReview> selectReviewList(String bookISBN, Paging reviewPaging, int reviewKind) {
		RowBounds rb = new RowBounds(reviewPaging.getStart()-1, reviewPaging.getCntPerPage());
		List<BookReview> temp = null;
		List<Object> list=new ArrayList<Object>();
		list.add(bookISBN);
		list.add(reviewKind);
		temp = bookReviewDao.selectReviewList(sqlSession,rb,list);
	
		return temp;
	}

	@Override
	public int insertIdCheck(List<String> list) {
		
		return bookReviewDao.insertIdCheck(sqlSession,list);
	}

	@Override
	public List<BookReviewReply> selectReviewReply(int reviewNo) {
		
		return bookReviewDao.selectReviewReply(sqlSession,reviewNo);
	}

	@Override
	public void updateReview(BookReview review) {
		int result = bookReviewDao.updateReview(sqlSession,review);
		if(result < 0) {
			throw new RuntimeException("리뷰 업데이트중 db 오류");
		}
		
	}

	@Override
	public void insertReviewReply(BookReviewReply reviewReply) {
		// TODO Auto-generated method stub
		BookReview temp = new BookReview();
		BookReviewReply tempReply = reviewReply;
		temp.setReviewNo(reviewReply.getReviewNo());
		int result = bookReviewDao.updateReviewReplyInsert(sqlSession,temp);
		tempReply.setReviewReplyIndex(temp.getReviewStatus());
		int result2 = bookReviewDao.insertReviewReply(sqlSession,tempReply);
		
		if(result*result2 < 0) {
			throw new RuntimeException("리뷰 댓글 등록 db 오류");
		}
		
	}

	@Override
	public void deleteReply(BookReviewReply reviewReply) {
		int result = bookReviewDao.deleteReply(sqlSession,reviewReply);
		int result2 = bookReviewDao.updateDeleteReply(sqlSession,reviewReply);
		if(result * result2 <0) {
			throw new RuntimeException("댓글 삭제 db 오류");
		}
	}

	@Override
	public void updateReply(BookReviewReply reviewReply) {
		int result = bookReviewDao.updateReply(sqlSession,reviewReply);
		if(result < 0) {
			throw new RuntimeException("리뷰 업데이트중 db 오류");
		}
		
		
	}

	@Override
	public void insertAnswer(BookReviewReply reviewReply) {
		int result = bookReviewDao.insertAnswer(sqlSession,reviewReply);
		int result2 = bookReviewDao.updateReplyAnswerInsert(sqlSession,reviewReply);
		
		if(result*result2 <0 ) {
			throw new RuntimeException("리뷰 답글 등록중 db오류");
		}
		
	}

	@Override
	public void deleteAnswer(BookReviewReply reviewReply) {
		int result = bookReviewDao.deleteAnswer(sqlSession,reviewReply);
		int result2 = bookReviewDao.updateReplyDeleteAnswer(sqlSession,reviewReply);
		if(result * result2 <0) {
			throw new RuntimeException("댓글 삭제 db 오류");
		}
	}

	//마이페이지 북 리뷰 리스트 
	@Override
	public List<BookReview> selectReviewListMine(String loginUser, PageInfo pi) {

		List<BookReview> list = bookReviewDao.selectReviewListMine(sqlSession, loginUser,pi);

		return list;
	}

}
