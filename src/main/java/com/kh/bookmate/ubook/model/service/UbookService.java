package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.bookmate.ubook.model.vo.Ubook;

public interface UbookService {

	void insertUbook(Ubook ubook);
	
	Ubook selectUbook(int ubookNo);

	//List<Ubook> selectbookList();

	List<Ubook> selectbookList(int sellerNo);

	int deleteMyUbook(int ubookNo);

	//List<Ubook> ubookCateList1();

	List<Ubook> selectCategory(int ubCategory);

	//List<Ubook> selectbookList(String userId);

}
