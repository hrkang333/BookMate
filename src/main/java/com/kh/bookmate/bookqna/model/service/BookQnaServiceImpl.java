package com.kh.bookmate.bookqna.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int selectA_QnaListCount(int searchKind, String keyword, int isAnswer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKind", searchKind);
		map.put("keyword", keyword);
		map.put("isAnswer", isAnswer);
		
		return bookQnaDao.selectA_QnaListCount(sqlSession,map);
		
	}

	@Override
	public List<BookQna> selectB_QnaList(int searchKind, String keyword, int isAnswer, RowBounds rb) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKind", searchKind);
		map.put("keyword", keyword);
		map.put("isAnswer", isAnswer);
		
		return bookQnaDao.selectB_QnaList(sqlSession,map,rb);
	}

	@Override
	public BookQna selectA_QnaDetail(int qnaNo) {
		BookQna qna=null;
		
		qna=bookQnaDao.selectA_QnaDetail(sqlSession,qnaNo);
		if(qna==null) {
			throw new RuntimeException("어드민 qna 상세 보기 db오류");
		}
		
		return qna;
	}

	@Override
	public BookQnaAnswer selectA_QnaAnswerDetail(int qnaNo) {
		BookQnaAnswer qnaAnswer=null;
		
		qnaAnswer=bookQnaDao.selectA_QnaAnswerDetail(sqlSession,qnaNo);
		if(qnaAnswer==null) {
			throw new RuntimeException("어드민 qna 상세 보기 db오류");
		}
		
		return qnaAnswer;
	}

	@Override
	public void intsertQnaAnswer(BookQnaAnswer qnaAnswer) {
		int result = bookQnaDao.intsertQnaAnswer(sqlSession,qnaAnswer);
		if(result < 0) {
			throw new RuntimeException("qna 답변 등록중 db오류");
		}
		int result2 = bookQnaDao.updateQnaInsertAnswer(sqlSession,qnaAnswer.getQnaNo());
		if(result2 < 0) {
			throw new RuntimeException("qna 답변 등록 업데이트중 db오류");
		}
	}

	@Override
	public void updateQnaAnswer(BookQnaAnswer qnaAnswer) {
		int result = bookQnaDao.updateQnaAnswer(sqlSession,qnaAnswer);
		if(result < 0) {
			throw new RuntimeException("qna 답변 등록중 db오류");
		}
		
	}

	@Override
	public void deleteQnaAnswer(int qnaNo) {
		int result = bookQnaDao.deleteQnaAnswer(sqlSession,qnaNo);
		if(result < 0) {
			throw new RuntimeException("qna 답변 삭제중 db오류");
		}
		int result2 = bookQnaDao.updateQnaDeleteAnswer(sqlSession,qnaNo);
		if(result2 < 0) {
			throw new RuntimeException("qna 답변 삭제 업데이트중 db오류");
		}
		
	}

}
