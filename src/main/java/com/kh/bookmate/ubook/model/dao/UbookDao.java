package com.kh.bookmate.ubook.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.ubook.model.vo.Ubook;

@Repository
public class UbookDao {

	public int insertUbook(SqlSession sqlSession, Ubook ubook) {
		return sqlSession.insert("ubookMapper.insertUbook",ubook);
	}

	public Ubook selectUbook(SqlSession sqlSession, int ubookNo) {
		return sqlSession.selectOne("ubookMapper.selectUbook",ubookNo);
	}
/*
	public List<Ubook> selectbookListCount(SqlSessionTemplate sqlSession) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookListCount");
		System.out.println("dao----" + list1);
		return list1;
	}

	public List<Ubook> selectbookList(SqlSession sqlSession) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList");
		System.out.println("dao----" + list1);
		return list1;
	}*/
/*
	public List<Ubook> selectbookList(SqlSession sqlSession, String userId) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList", userId);
		System.out.println("dao----" + list1);
		return list1;
	}*/

	public List<Ubook> selectbookList(SqlSession sqlSession, int sellerNo) {
		List list1 =  sqlSession.selectList("ubookMapper.selectbookList", sellerNo);
		System.out.println("dao----" + list1);
		return list1;
	}

	public int deleteMyUbook(SqlSession sqlSession, int ubookNo) {
		return sqlSession.insert("ubookMapper.deleteMyUbook",ubookNo);
	}

}
