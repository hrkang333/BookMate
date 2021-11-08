package com.kh.bookmate.ubook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.ubook.model.vo.Ubook;

@Repository
public class UbookDao {

	public int insertUbook(SqlSession sqlSession, Ubook ubook) {
		return sqlSession.insert("ubookMapper.insertUbook",ubook);
	}

	public Ubook selectUbook(SqlSession sqlSession, int ubookNo) {
		return sqlSession.selectOne("ubookMapper.selectUbook",ubookNo);
	}


	public ArrayList<Ubook> selectList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*(pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("dao-currentPage: "+ pi.getCurrentPage());
		System.out.println("dao-getBoardLimit " + pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ubookMapper.selectList", null, rowBounds);
	}

	public int selectbookListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("ubookMapper.selectbookListCount");
	}

}
