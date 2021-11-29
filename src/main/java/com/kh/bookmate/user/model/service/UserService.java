package com.kh.bookmate.user.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.bookmate.user.model.vo.User;

public interface UserService {

	void insertUser(User u);

	User loginUser(BCryptPasswordEncoder bCryptPasswordEncoder, User u);

	String findId(User u);

	String findPwd(User u);


	User updateUser(User user) throws Exception;



	void deleteUser(String userId) ;



	User selectUserPoint(String loginUser);

	void updatePwd(HashMap<String, String> map);


}
