package com.kh.bookmate.ubook.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.ubook.model.dao.UbookDao;
import com.kh.bookmate.ubook.model.vo.Ubook;

public class UbookServiceImpl implements UbookService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	UbookDao ubookDao;
	
	@Override
	public void insertUbook(Ubook ubook) {
		int reulst = ubookDao.insertUbook(sqlSession,ubook);
		
		if(reulst < 0 ) {
			throw new RuntimeException("중고 도서 등록 오류 발생");
						
		}
	}

	@Override
	public void selectBook(int ubookNo) {
		
		int ubook = ubookDao.selectBook(sqlSession,ubookNo);
		
		if(ubook < 0) {
			throw new RuntimeException("도서 세부정보 불러오기 오류");
		}
	}

}
