package com.kh.bookmate.myPage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.addressBook.model.vo.AddressBook;



@Service
public class MyPageServiceImpl implements MyPageService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addressBookDao;

	@Override
	public List<AddressBook> selectMyAddressList(String loginUser) {
		List<AddressBook> list = addressBookDao.selectMyAddressList(sqlSession,loginUser);
		return list;
	}

}
