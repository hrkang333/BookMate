package com.kh.bookmate.bookqna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;

@Repository
public class BookQnaDao {

	public int selectTotalCount(SqlSessionTemplate sqlSession, String bookISBN) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectTotalCount",bookISBN);
	}

	public List<BookQna> selectList(SqlSessionTemplate sqlSession, List<Object> list, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectList",list,rb);
	}

	public BookQna selectQnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectQnaDetail",qnaNo);
	}

	public BookQnaAnswer selectAnswerDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookQnaMapper.selectAnswerDetail",qnaNo);
	}

	public List<BookQna> selectListAll(SqlSessionTemplate sqlSession, String bookISBN, RowBounds rb) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookQnaMapper.selectListAll",bookISBN,rb);
	}

	public int selectKindCount(SqlSessionTemplate sqlSession, List<Object> list) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("bookQnaMapper.selectKindCount",list);
	}

	public int qnaInsert(SqlSessionTemplate sqlSession, BookQna bookQna) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookQnaMapper.qnaInsert",bookQna);
	}

	public int qnaUpdate(SqlSessionTemplate sqlSession, BookQna bookQna) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookQnaMapper.qnaUpdate",bookQna);
	}

	public int qnaDelete(SqlSessionTemplate sqlSession, int qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookQnaMapper.qnaDelete" ,qnaNo);
	}

}
