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
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UbookDao ubookDao;
	
	@Override
	public void insertUbook(Ubook ubook) {
		int reulst = ubookDao.insertUbook(sqlSession,ubook);
		
		if(reulst < 0 ) {
			throw new RuntimeException("중고 도서 등록 오류 발생");
						
		}
	}
/*
	@Override
	public Ubook selectUbook(int ubookNo) {		
		Ubook u = null;
		u = ubookDao.selectUbook(sqlSession, ubookNo);
		return u;
		
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
	
	@Override
	public int ubookUpdate(Ubook ubook) {
		return ubookDao.ubookUpdate(sqlSession, ubook);
	}
/*
	@Override
	public List<Ubook> ubookCateList1() {
		return ubookDao.ubookCateList1(sqlSession);
	}*/

	@Override
	public List<Ubook> selectCategory(int ubCategory) {
		return ubookDao.selectCategory(sqlSession, ubCategory);
	}

	@Override
	public Ubook selectUbook(Ubook ub) {
		Ubook u = null;
		u = ubookDao.selectUbook(sqlSession, ub);
		return u;
	}

	
	/*@Override
	public List<Ubook> selectbookList(String userId) {
		return ubookDao.selectbookList(sqlSession,userId);
	}*/
	

}
