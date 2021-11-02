package com.kh.bookmate.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.user.model.vo.User;
@Repository
public class UserDao {


	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.loginUser", u);
	}

	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		// TODO Auto-generated method stub
		return sqlSession.insert("userMapper.insertUser", u);
	}



	public User findId(SqlSessionTemplate sqlSession, User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.findId", u);
	}

	public int updateUser(SqlSessionTemplate sqlSession, User user) {
		// TODO Auto-generated method stub
		return sqlSession.update("userMapper.updateUser", user);
	}

	public User selectUserPoint(SqlSessionTemplate sqlSession, User user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.selectUserPoint", user);
	}

	public int deleteUser(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("userMapper.deleteUser", userId);
	}

}
