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

	public Ubook selectUbook(SqlSessionTemplate sqlSession, int ubookNo) {
		System.out.println("dao----" + ubookNo);
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
		return list1;
	}

	public int deleteMyUbook(SqlSession sqlSession, int ubookNo) {
		System.out.println("dao의 결과: " + ubookNo);
		return sqlSession.delete("ubookMapper.deleteMyUbook",ubookNo);
	}
	
/*
	public List<Ubook> ubookCateList1(SqlSession sqlSession) {
		return sqlSession.selectList("ubookMapper.ubookCateList1");
	}*/

	public List<Ubook> selectCategory(SqlSessionTemplate sqlSession, int ubCategory) {
		System.out.println("dao----" + ubCategory);
		return sqlSession.selectList("ubookMapper.selectCategory",ubCategory);
	}

	public int ubookUpdate(SqlSessionTemplate sqlSession, Ubook ubook) {
	return sqlSession.update("ubookMapper.updateUbook", ubook);
	}

}
