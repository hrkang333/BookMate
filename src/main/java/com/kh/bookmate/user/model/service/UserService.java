package com.kh.bookmate.user.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.bookmate.user.model.vo.User;

public interface UserService {

	void insertUser(User u);

	User loginUser(BCryptPasswordEncoder bCryptPasswordEncoder, User u);

	String findId(User u);

	String findPwd(User u);


}
