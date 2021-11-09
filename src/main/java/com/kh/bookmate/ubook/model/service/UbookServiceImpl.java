package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.dao.BookDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.ubook.model.dao.UbookDao;
import com.kh.bookmate.ubook.model.vo.Ubook;

@Service
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
	public Ubook selectUbook(int ubookNo) {
		Ubook ubook = null;
		ubook = ubookDao.selectUbook(sqlSession,ubookNo);
		
		if(ubook ==null) {
			throw new RuntimeException("도서 세부정보 불러오기 오류");
		}
		return ubook;
	}

	/*
	 * @Override public List<Ubook> selectbookList() { return
	 * ubookDao.selectbookList(sqlSession); }
	 */

	@Override
	public List<Ubook> selectbookList(int sellerNo) {
		return ubookDao.selectbookList(sqlSession, sellerNo);
	}

	@Override
	public int deleteMyUbook(int ubookNo) {
		return ubookDao.deleteMyUbook(sqlSession, ubookNo);
		
	}

	/*@Override
	public List<Ubook> selectbookList(String userId) {
		return ubookDao.selectbookList(sqlSession,userId);
	}*/
	

}
