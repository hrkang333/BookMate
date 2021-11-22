package com.kh.bookmate.bookqna.model.service;

import java.util.List;

import com.kh.bookmate.bookqna.model.vo.BookQna;
import com.kh.bookmate.common.Paging;

public interface BookQnaService {

	int selectTotalCount(String bookISBN, int questionKind);

	List<BookQna> selectList(String bookISBN, Paging qnaPaging, int questionKind);

	List<String> selectQnaDetail(int qnaNo);

	void qnaInsert(BookQna bookQna);

	void qnaUpdate(BookQna bookQna);

	void qnaDelete(int qnaNo);

}
