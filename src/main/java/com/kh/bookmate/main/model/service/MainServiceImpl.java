package com.kh.bookmate.main.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.main.model.dao.MainDao;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainDao mainDao;

	@Override
	public List<Book> selectBestList() {
		// TODO Auto-generated method stub
		return mainDao.selectBestList(sqlSession);
	}

	@Override
	public List<Book> selectTodayList(int category_number) {
		// TODO Auto-generated method stub
		return mainDao.selectTodayList(sqlSession, category_number);
	}

}
