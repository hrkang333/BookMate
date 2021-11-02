package com.kh.bookmate.user.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.bookmate.user.model.vo.User;

public interface UserService {

	void insertUser(User u);

	User loginUser(BCryptPasswordEncoder bCryptPasswordEncoder, User u);

	User findId(User u);

	User updateUser(User user) throws Exception;

	User selectUserPoint(User user);

	void deleteUser(String userId) ;

}
