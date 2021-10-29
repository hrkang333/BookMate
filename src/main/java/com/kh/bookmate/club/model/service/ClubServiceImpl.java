/* 파일 설명 : 서비스(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bookmate.club.model.dao.ClubDao;

@Service
public class ClubServiceImpl implements ClubService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClubDao clubDao;
	
	@Override
	public int checkHost(String hostName) {
		
		return clubDao.checkHost(sqlSession, hostName);
	}

}
