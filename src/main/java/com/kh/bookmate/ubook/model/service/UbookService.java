package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;

import com.kh.bookmate.common.PageInfo;
import com.kh.bookmate.ubook.model.vo.Ubook;

public interface UbookService {

	void insertUbook(Ubook ubook);
	
	Ubook selectUbook(int ubookNo);

	int selectbookListCount();
	ArrayList<Ubook> selectbookListCount(PageInfo pi);
}
