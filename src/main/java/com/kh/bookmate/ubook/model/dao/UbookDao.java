package com.kh.bookmate.ubook.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.ubook.model.vo.Ubook;

@Repository
public class UbookDao {

	public int insertUbook(SqlSession sqlSession, Ubook ubook) {
		System.out.println("dao????????????" + ubook);
		return sqlSession.insert("ubookMapper.insertUbook",ubook);
	}

	public int selectUbook(SqlSession sqlSession, int ubookNo) {
		return sqlSession.selectOne("ubookMapper.selectUbook",ubookNo);
	}

}
