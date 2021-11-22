package com.kh.bookmate.bookqna.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.bookqna.model.dao.BookQnaDao;
import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.bookqna.model.vo.BookQnaAnswer;
import com.kh.bookmate.common.Paging;

@Service
public class BookQnaServiceImpl implements BookQnaService {
	
	@Autowired
	private BookQnaDao bookQnaDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectTotalCount(String bookISBN,int questionKind) {
		// TODO Auto-generated method stub
		
		if(questionKind==5) {
			return bookQnaDao.selectTotalCount(sqlSession,bookISBN);
		}else {
		
		List<Object> list=new ArrayList<Object>();
		list.add(bookISBN);
		list.add(questionKind);
		return bookQnaDao.selectKindCount(sqlSession,list);
		}
	}

	@Override
	public List<BookQna> selectList(String bookISBN, Paging qnaPaging, int questionKind) {

		RowBounds rb = new RowBounds(qnaPaging.getStart()-1, qnaPaging.getCntPerPage());
		if(questionKind==5) {
			return bookQnaDao.selectListAll(sqlSession,bookISBN,rb);
		}else {
		
		List<Object> list=new ArrayList<Object>();
		list.add(bookISBN);
		list.add(questionKind);
		return bookQnaDao.selectList(sqlSession,list,rb);
		}
	}

	@Override
	public List<String> selectQnaDetail(int qnaNo) {
		List<String> strList = new ArrayList<String>();
		BookQna tempQna = bookQnaDao.selectQnaDetail(sqlSession, qnaNo);
		strList.add(tempQna.getQnaContent());
		if(tempQna.getQnaAnswer()==1) {
			BookQnaAnswer tempAnswer = bookQnaDao.selectAnswerDetail(sqlSession, qnaNo);
			if(tempAnswer == null) {
				throw new RuntimeException("qna 답변 DB 로딩 오류");
			}
			strList.add(tempAnswer.getQnaAnswerContent());
		}
		
		if(tempQna == null) {
			throw new RuntimeException("qna 상세보기 DB 로딩 오류");
		}
		return strList;
	}

	@Override
	public void qnaInsert(BookQna bookQna) {
		int result = bookQnaDao.qnaInsert(sqlSession,bookQna);
		if(result < 0) {
			throw new RuntimeException("qna 등록중 db오류");
		}
		
	}

	@Override
	public void qnaUpdate(BookQna bookQna) {
		// TODO Auto-generated method stub
		int result = bookQnaDao.qnaUpdate(sqlSession,bookQna);
		if(result < 0) {
			throw new RuntimeException("qna 수정중 db오류");
		}
	}

	@Override
	public void qnaDelete(int qnaNo) {
		int result = bookQnaDao.qnaDelete(sqlSession,qnaNo);
		if(result < 0) {
			throw new RuntimeException("qna 삭제중 db오류");
		}
		
	}

}
