package com.kh.bookmate.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.bookmate.user.model.dao.UserDao;
import com.kh.bookmate.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(BCryptPasswordEncoder bCryptPasswordEncoder, User u) {
		User loginUser = userDao.loginUser(sqlSession, u);
		
		
		return loginUser;
	}

	@Override
	public void insertUser(User u) {
		int result = userDao.insertUser(sqlSession, u);
		
	}



	@Override
	public User findId(User u) {
		User findId = userDao.findId(sqlSession, u);
		return findId;
	}
}
