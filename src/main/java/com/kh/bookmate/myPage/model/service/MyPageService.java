package com.kh.bookmate.myPage.model.service;

import java.util.List;

import com.kh.bookmate.addressBook.model.vo.AddressBook;

public interface MyPageService {

	List<AddressBook> selectMyAddressList(String loginUser);

}
