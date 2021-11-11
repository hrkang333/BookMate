package com.kh.bookmate.addressBook.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.addressBook.model.dao.AddressBookDao;
import com.kh.bookmate.addressBook.model.vo.AddressBook;

@Service
public class AddressBookServiceImpl implements AddressBookService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	AddressBookDao addressBookDao;

	@Override
	public AddressBook selcetAddressBook(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertAddressBook(AddressBook abook) {
		// TODO Auto-generated method stub
		
	}

}
