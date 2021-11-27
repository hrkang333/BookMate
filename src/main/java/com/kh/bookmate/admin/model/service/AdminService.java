package com.kh.bookmate.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;

public interface AdminService {

	int clubListCount(String keyword);

	List<Club> selectClubConfirmList(String keyword, RowBounds rb);

	void updateClubConfirm(Map<String, Object> map);

	int selectLessStockCount(int checkStock);

	List<Book> selectLessStockBook(RowBounds rb, int checkStock);

}
