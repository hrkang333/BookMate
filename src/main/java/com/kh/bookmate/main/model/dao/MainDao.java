package com.kh.bookmate.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;

@Repository
public class MainDao {

	public List<Book> selectBestList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainMapper.selectBestList");
	}

	public List<Book> selectTodayList(SqlSessionTemplate sqlSession, int category_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainMapper.selectTodayList", category_number);
	}

}
