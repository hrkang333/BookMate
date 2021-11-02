package com.kh.bookmate.seller.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

public interface SellerService {

	Seller loginSeller(BCryptPasswordEncoder bCryptPasswordEncoder, User u, Seller s) throws Exception;
	
	void insertSeller(Seller s);

	//Seller loginSeller(User u, Seller s);
	
	
}
