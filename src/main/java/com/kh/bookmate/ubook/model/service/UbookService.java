package com.kh.bookmate.ubook.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.bookmate.ubook.model.vo.Ubook;

public interface UbookService {

	void insertUbook(Ubook ubook);
	
	//Ubook selectUbook(int ubookNo);

	//List<Ubook> selectbookList();

	List<Ubook> selectbookList(int sellerNo);

	int deleteMyUbook(int ubookNo);
	
	int ubookUpdate(Ubook ubook);

	//List<Ubook> ubookCateList1();

	List<Ubook> selectCategory(int ubCategory);

	Ubook selectUbook(Ubook ub);

	Ubook selectUpdateUbook(int ubookNo);

	//List<Ubook> selectbookList(String userId);

}
