package com.kh.bookmate.seller.model.service;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.bookmate.seller.model.vo.Seller;
import com.kh.bookmate.user.model.vo.User;

public interface SellerService {
	
	void insertSeller(Seller s);

	Seller loginSeller(String userId);

	//Seller updateSeller(String userId) throws Exception;
	//void updateSeller(Seller s);

	//void updateSeller(Seller s1) throws Exception;

	int updateSeller(Seller s);
	
	int deleteSeller(Seller s);

	//void deleteSeller(Seller s, String userPwd);
}
