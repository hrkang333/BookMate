package com.kh.bookmate.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;

@Repository
public class AdminDao {

	public int clubListCount(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.clubListCount",keyword);
	}

	public List<Club> selectClubConfirmList(SqlSessionTemplate sqlSession, String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectClubConfirmList",keyword,rb);
	}

	public int updateClubConfirm(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateClubConfirm",map);
	}

	public int selectLessStockCount(SqlSessionTemplate sqlSession, int checkStock) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectLessStockCount",checkStock);
	}

	public List<Book> selectLessStockBook(SqlSessionTemplate sqlSession, RowBounds rb, int checkStock) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectLessStockBook",checkStock,rb);
	}

}
