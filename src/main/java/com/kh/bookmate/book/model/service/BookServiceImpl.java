package com.kh.bookmate.book.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	BookDao bookDao;

	@Override
	public Book selectBook(String bookISBN) {
		
		Book book = null;
		
		book = bookDao.selectBook(sqlSession,bookISBN);
		
		if(book==null) {
			throw new RuntimeException("도서 세부정보 불러오기 오류");
		}
		
		return book;
	}

}
