package com.kh.bookmate.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.admin.model.dao.AdminDao;
import com.kh.bookmate.book.model.vo.Book;
import com.kh.bookmate.club.model.vo.Club;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public int clubListCount(String keyword) {
		// TODO Auto-generated method stub
		return adminDao.clubListCount(sqlSession,keyword);
	}

	@Override
	public List<Club> selectClubConfirmList(String keyword, RowBounds rb) {
		// TODO Auto-generated method stub
		
		return adminDao.selectClubConfirmList(sqlSession,keyword,rb);
	}

	@Override
	public void updateClubConfirm(Map<String, Object> map) {
		
		
		int result =  adminDao.updateClubConfirm(sqlSession,map);
		if(result<0) {
			throw new RuntimeException("독서모임 승인업데이트중 db 오류");
		}
		
	}

	@Override
	public int selectLessStockCount(int checkStock) {
		// TODO Auto-generated method stub
		return adminDao.selectLessStockCount(sqlSession,checkStock);
	}

	@Override
	public List<Book> selectLessStockBook(RowBounds rb,int checkStock) {
		// TODO Auto-generated method stub
		return adminDao.selectLessStockBook(sqlSession,rb,checkStock);
	}

}
