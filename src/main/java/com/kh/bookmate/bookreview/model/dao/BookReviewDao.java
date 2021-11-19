package com.kh.bookmate.bookreview.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.bookreview.model.vo.BookReview;

@Repository
public class BookReviewDao {

	public int insertReview(SqlSessionTemplate sqlSession, BookReview bookReview) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertReview",bookReview);
	}

	public int updateReviewWriter(SqlSessionTemplate sqlSession, BookReview bookReview) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReviewWriter",bookReview);
	}

	public int selectTotalCount(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.selectTotalCount",bookISBN);
	}

	public List<BookReview> selectReviewList(SqlSessionTemplate sqlSession, RowBounds rb, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reviewMapper.selectReviewList", bookISBN, rb);
	}

	public int insertIdCheck(SqlSessionTemplate sqlSession, List<String> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.insertIdCheck",list);
	}

}
