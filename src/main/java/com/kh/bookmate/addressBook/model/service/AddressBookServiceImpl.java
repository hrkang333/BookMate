package com.kh.bookmate.addressBook.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.addressBook.model.vo.AddressBook;

@Service
public class AddressBookServiceImpl implements AddressBookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addressBookDao;

	@Override
	public AddressBook selcetAddressBook(String userId) {
		// TODO Auto-generated method stub
		return addressBookDao.selcetAddressBook(sqlSession,userId);
	}

	@Override
	public void insertAddressBook(AddressBook abook) {
		addressBookDao.insertAddressBook(sqlSession, abook);
		
		
	}

}
