package com.kh.bookmate.book.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;

@Repository
public class BookDao {

	public Book selectBook(SqlSession sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.selectBook",bookISBN);
	}
	
	
	

}
