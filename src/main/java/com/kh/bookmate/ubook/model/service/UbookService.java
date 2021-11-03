package com.kh.bookmate.ubook.model.service;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.ubook.model.vo.Ubook;

public interface UbookService {

	void insertUbook(Ubook ubook);

	void selectBook(int ubookNo);
}
