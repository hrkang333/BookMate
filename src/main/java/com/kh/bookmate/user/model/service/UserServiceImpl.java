package com.kh.bookmate.user.model.service;

import java.util.HashMap;

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
	public String findId(User u) {
		String findId = userDao.findId(sqlSession, u);
		return findId;
	}


	// 회원정보 수정
	@Override
	public User updateUser(User user) throws Exception {
		int result = userDao.updateUser(sqlSession, user);

		if (result > 0) {
			User loginUser = userDao.loginUser(sqlSession, user);
			return loginUser;
		} else {
			throw new Exception("회원 수정 실패 ");
		}
	}

	

	//회원 탈퇴 
	@Override
	public void deleteUser(String userId){
		
		int result = userDao.deleteUser(sqlSession, userId);
		
//		if(result < 0) {
//			throw new Exception("회원삭제 실패 ");
//		}
		
		
	}
	
	@Override
	public String findPwd(User u) {
		String findPwd = userDao.findPwd(sqlSession, u);
		return findPwd;
	}

	
	@Override
	public User selectUserPoint(String loginUser) {
		User user = userDao.selectUserPoint(sqlSession,loginUser );	
		return user;
	}

	
	@Override
	public void updatePwd(HashMap<String, String> map) {
		 userDao.updatePwd(sqlSession, map);
		
	}

	
	
}
