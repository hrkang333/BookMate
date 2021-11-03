package com.kh.bookmate.ubook.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.bookmate.ubook.model.vo.Ubook;

public class UbookDao {

	public int insertUbook(SqlSession sqlSession, Ubook ubook) {
		return sqlSession.insert("ubookMapper.insertUbook",ubook);
	}

	public int selectBook(SqlSession sqlSession, int ubookNo) {
		return sqlSession.insert("ubookMapper.insertUbook",ubookNo);
	}

}
